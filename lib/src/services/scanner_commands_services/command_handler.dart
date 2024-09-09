import 'dart:async';
import 'dart:collection';

import 'package:mutex/mutex.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/constants/data_hex_constants.dart';
import 'package:opticonnect_sdk/src/entities/command.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/interfaces/ble_command_response_reader.dart';
import 'package:opticonnect_sdk/src/interfaces/ble_data_writer.dart';
import 'package:opticonnect_sdk/src/interfaces/command_bytes_provider.dart';
import 'package:opticonnect_sdk/src/services/scanner_commands_services/command_feedback_service.dart';
import 'package:opticonnect_sdk/src/services/scanner_commands_services/command_timeout_manager.dart';

abstract class ICommandSender {
  void sendCommand(Command command);
}

class CommandHandler implements ICommandSender {
  final String _deviceId;
  final BleDataWriter _bleDataWriter;
  final BleCommandResponseReader _bleCommandResponseReader;
  final CommandBytesProvider _commandBytesProvider;
  final CommandFeedbackService _commandFeedbackService;
  final AppLogger _appLogger;
  late final CommandTimeoutManager _commandTimeoutManager;

  CommandHandler(
      this._deviceId,
      this._bleDataWriter,
      this._bleCommandResponseReader,
      this._commandBytesProvider,
      this._commandFeedbackService,
      this._appLogger) {
    _initializeResponseListener();
    _commandTimeoutManager = CommandTimeoutManager();
  }

  final _commandQueue = Queue<Command>();
  final _responseData = StringBuffer();
  final _mutex = Mutex();

  void _initializeResponseListener() async {
    final commandResponseStream =
        await _bleCommandResponseReader.getCommandResponseStream(_deviceId);
    commandResponseStream.listen((data) {
      _commandResponseReceivedEvent(data);
    }, onError: (error) {
      _appLogger.error('Error receiving command response: $error');
    });
  }

  @override
  void sendCommand(Command command) {
    _mutex.protect(() async {
      _enqueueCommand(command);
    });
  }

  void _enqueueCommand(Command command) {
    _commandQueue.addLast(command);
    if (_commandQueue.length == 1) {
      _sendCommand(_commandQueue.first);
    }
  }

  Future<void> _sendCommand(Command command) async {
    _responseData.clear();
    _startCommandTimeout(command);

    try {
      _bleDataWriter.writeData(_deviceId, command.code,
          _commandBytesProvider.getCommandBytes(command));
    } catch (e) {
      _appLogger.error('Error sending command: ${command.code}, Error: $e');

      _finishWithFailedRequest(command);
    }
  }

  void _startCommandTimeout(Command command) {
    _commandTimeoutManager.startTimeout(
      const Duration(seconds: 2),
      () => _onCommandTimeout(command),
    );
  }

  void _onCommandTimeout(Command command) {
    _appLogger.warning('Command timeout occurred for: ${command.code}');
    if (command.retried) {
      _finishWithFailedRequest(command);
    } else {
      _retryCommand(command);
    }
  }

  void _sendScannerFeedback(
      bool sendAckFeedback, bool sendNakFeedback, Command command) {
    final feedbackCommands = _commandFeedbackService.generateFeedbackCommands(
        sendAckFeedback, sendNakFeedback, command);
    for (final feedbackCommand in feedbackCommands) {
      sendCommand(feedbackCommand);
    }
  }

  void _completeCommand(Command command, String responseData, bool hasFailed) {
    _commandTimeoutManager.cancelTimeout();

    if (!command.completer.isCompleted) {
      command.completer.complete(CommandResponse(responseData, !hasFailed));
    }
  }

  void _finalizeCommandAndProcessNext(String responseData, bool hasFailed) {
    if (_commandQueue.isNotEmpty) {
      _mutex.protect(() async {
        if (_commandQueue.isNotEmpty) {
          final command = _commandQueue.first;

          _completeCommand(command, responseData, hasFailed);

          _commandQueue.removeFirst();
        }
        if (_commandQueue.isNotEmpty) {
          _sendCommand(_commandQueue.first);
        }
      });
    }
  }

  void _finishWithFailedRequest(Command command) {
    _finishCommandRequest('', false, false, command, hasFailed: true);
  }

  void _finishCommandRequest(String responseData, bool sendAckFeedback,
      bool sendNakFeedback, Command command,
      {bool hasFailed = false}) {
    _sendScannerFeedback(sendAckFeedback, sendNakFeedback, command);
    _finalizeCommandAndProcessNext(responseData, hasFailed);
  }

  void _retryCommand(Command command) {
    _appLogger.warning('Retrying command: ${command.code}');
    command.retried = true;
    _mutex.protect(() async {
      _commandQueue.removeFirst();
      _commandQueue.add(command);
      await _sendCommand(_commandQueue.first);
    });
  }

  void _commandResponseReceivedEvent(String data) {
    if (_commandQueue.isEmpty) {
      return;
    }

    final command = _commandQueue.first;
    _appLogger
        .warning('Command response received for: ${command.code}, Data: $data');

    if (data == nak && !command.retried) {
      _retryCommand(command);
    } else if (data == ack || data == nak) {
      final responseData = _responseData.toString();
      _finishCommandRequest(responseData, data == ack, data == nak, command);
    } else {
      _responseData.write(data);
    }
  }

  void dispose() {
    _commandQueue.clear();
    _commandTimeoutManager.dispose();
  }
}
