import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/entities/scanner_command.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/interfaces/command_bytes_provider.dart';
import 'package:opticonnect_sdk/src/services/ble_services/ble_devices_streams_handler.dart';
import 'package:opticonnect_sdk/src/services/scanner_commands_services/command_compression_manager.dart';
import 'package:opticonnect_sdk/src/services/scanner_commands_services/command_factory.dart';
import 'package:opticonnect_sdk/src/services/scanner_commands_services/command_feedback_service.dart';
import 'package:opticonnect_sdk/src/services/scanner_commands_services/command_handler.dart';
import 'package:opticonnect_sdk/src/services/scanner_settings_services/scanner_settings_compressor.dart';

@lazySingleton
class CommandHandlersManager {
  final CommandFactory _commandFactory;
  final BleDevicesStreamsHandler _bleDevicesStreamsHandler;
  final CommandBytesProvider _commandBytesProvider;
  final CommandFeedbackService _commandFeedbackService;
  final ScannerSettingsCompressor _scannerSettingsCompressor;
  final AppLogger _appLogger;

  CommandHandlersManager(
    this._commandFactory,
    this._bleDevicesStreamsHandler,
    this._commandBytesProvider,
    this._commandFeedbackService,
    this._scannerSettingsCompressor,
    this._appLogger,
  );

  final Map<String, CommandHandler> _commandHandlers = {};
  final Map<String, CommandCompressionManager> _compressionManagers = {};

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

    final compressionManager = CommandCompressionManager(
      _commandHandlers[deviceId]!,
      _scannerSettingsCompressor,
      _appLogger,
    );

    _compressionManagers[deviceId] = compressionManager;
  }

  CommandHandler getCommandHandler(String deviceId) {
    if (!_commandHandlers.containsKey(deviceId)) {
      throw Exception("CommandHandler for device $deviceId does not exist.");
    }

    return _commandHandlers[deviceId]!;
  }

  Future<CommandResponse> sendCommand(
      String deviceId, ScannerCommand scannerCommand) async {
    try {
      final commandHandler = getCommandHandler(deviceId);
      final command = _commandFactory.createCommand(scannerCommand);

      commandHandler.sendCommand(command);

      if (_compressionManagers.containsKey(deviceId)) {
        await _compressionManagers[deviceId]!
            .checkAndHandleCompressionThreshold();
      } else {
        _appLogger
            .error("Compression manager for device $deviceId does not exist.");
      }

      return await command.completer.future;
    } catch (e) {
      _appLogger.error("Error sending command to device $deviceId: $e");
      return CommandResponse('', false);
    }
  }

  void disposeCommandHandler(String deviceId) {
    if (_commandHandlers.containsKey(deviceId)) {
      _commandHandlers[deviceId]!.dispose();
      _commandHandlers.remove(deviceId);
    }
    if (_compressionManagers.containsKey(deviceId)) {
      _compressionManagers.remove(deviceId);
    }
  }

  void dispose() {
    _commandHandlers.forEach((key, value) {
      value.dispose();
    });
    _commandHandlers.clear();
    _compressionManagers.clear();
  }
}
