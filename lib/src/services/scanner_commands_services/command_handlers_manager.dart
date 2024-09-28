import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/entities/scanner_command.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/interfaces/command_bytes_provider.dart';
import 'package:opticonnect_sdk/src/services/ble_services/ble_devices_streams_handler.dart';
import 'package:opticonnect_sdk/src/services/scanner_commands_services/command_executor.dart';
import 'package:opticonnect_sdk/src/services/scanner_commands_services/command_factory.dart';
import 'package:opticonnect_sdk/src/services/scanner_commands_services/command_feedback_service.dart';
import 'package:opticonnect_sdk/src/services/scanner_commands_services/compression_manager.dart';
import 'package:opticonnect_sdk/src/services/scanner_settings_services/settings_compressor.dart';

@lazySingleton
class CommandHandlersManager {
  final CommandFactory _commandFactory;
  final BleDevicesStreamsHandler _bleDevicesStreamsHandler;
  final CommandBytesProvider _commandBytesProvider;
  final CommandFeedbackService _commandFeedbackService;
  final SettingsCompressor _scannerSettingsCompressor;
  final AppLogger _appLogger;

  CommandHandlersManager(
    this._commandFactory,
    this._bleDevicesStreamsHandler,
    this._commandBytesProvider,
    this._commandFeedbackService,
    this._scannerSettingsCompressor,
    this._appLogger,
  );

  final Map<String, CommandExecutor> _commandHandlers = {};
  final Map<String, CompressionManager> _compressionManagers = {};

  void createCommandHandler(String deviceId) {
    _commandHandlers[deviceId]?.dispose();
    _commandHandlers[deviceId] = CommandExecutor(
      deviceId,
      _bleDevicesStreamsHandler,
      _bleDevicesStreamsHandler,
      _commandBytesProvider,
      _commandFeedbackService,
      _appLogger,
    );

    final compressionManager = CompressionManager(
      _commandHandlers[deviceId]!,
      _scannerSettingsCompressor,
      _appLogger,
    );

    _compressionManagers[deviceId] = compressionManager;
  }

  CommandExecutor getCommandHandler(String deviceId) {
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
      return CommandResponse.failed(e.toString());
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
