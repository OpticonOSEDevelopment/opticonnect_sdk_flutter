import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/entities/scanner_command.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/interfaces/command_bytes_provider.dart';
import 'package:opticonnect_sdk/src/services/ble_services/ble_devices_streams_handler.dart';
import 'package:opticonnect_sdk/src/services/scanner_commands_services/command_factory.dart';
import 'package:opticonnect_sdk/src/services/scanner_commands_services/command_feedback_service.dart';
import 'package:opticonnect_sdk/src/services/scanner_commands_services/command_handler.dart';

@lazySingleton
class CommandHandlersManager {
  final Map<String, CommandHandler> _commandHandlers = {};
  final CommandFactory _commandFactory;
  final BleDevicesStreamsHandler _bleDevicesStreamsHandler;
  final CommandBytesProvider _commandBytesProvider;
  final CommandFeedbackService _commandFeedbackService;
  final AppLogger _appLogger;

  CommandHandlersManager(
    this._commandFactory,
    this._bleDevicesStreamsHandler,
    this._commandBytesProvider,
    this._commandFeedbackService,
    this._appLogger,
  );

  void createCommandHandler(String deviceId) {
    _commandHandlers[deviceId]?.dispose();
    _commandHandlers[deviceId] = CommandHandler(
      deviceId,
      _bleDevicesStreamsHandler,
      _bleDevicesStreamsHandler,
      _commandBytesProvider,
      _commandFeedbackService,
      _appLogger,
    );
  }

  CommandHandler getCommandHandler(String deviceId) {
    if (!_commandHandlers.containsKey(deviceId)) {
      throw Exception("CommandHandler for device $deviceId does not exist.");
    }

    return _commandHandlers[deviceId]!;
  }

  Future<CommandResponse> sendCommand(
      String deviceId, ScannerCommand scannerCommand) async {
    final commandHandler = getCommandHandler(deviceId);
    final command = _commandFactory.createCommand(scannerCommand);
    commandHandler.sendCommand(command);
    return await command.completer.future;
  }

  void disposeCommandHandler(String deviceId) {
    if (_commandHandlers.containsKey(deviceId)) {
      _commandHandlers[deviceId]!.dispose();
      _commandHandlers.remove(deviceId);
    }
  }

  void dispose() {
    _commandHandlers.forEach((key, value) {
      value.dispose();
    });
    _commandHandlers.clear();
  }
}
