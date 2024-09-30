import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/entities/scanner_command.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/interfaces/command_bytes_provider.dart';
import 'package:opticonnect_sdk/src/services/ble_services/streams/data/data_handler.dart';
import 'package:opticonnect_sdk/src/services/scanner_commands_services/command_executor.dart';
import 'package:opticonnect_sdk/src/services/scanner_commands_services/command_factory.dart';
import 'package:opticonnect_sdk/src/services/scanner_commands_services/command_feedback_service.dart';
import 'package:opticonnect_sdk/src/services/scanner_commands_services/compression_manager.dart';
import 'package:opticonnect_sdk/src/services/scanner_settings_services/settings_compressor.dart';

@lazySingleton
class CommandExecutorsManager {
  final CommandFactory _commandFactory;
  final DataHandler _bleDevicesDataStreamsHandler;
  final CommandBytesProvider _commandBytesProvider;
  final CommandFeedbackService _commandFeedbackService;
  final SettingsCompressor _scannerSettingsCompressor;
  final AppLogger _appLogger;

  CommandExecutorsManager(
    this._commandFactory,
    this._bleDevicesDataStreamsHandler,
    this._commandBytesProvider,
    this._commandFeedbackService,
    this._scannerSettingsCompressor,
    this._appLogger,
  );

  final Map<String, CommandExecutor> _commandExecutors = {};
  final Map<String, CompressionManager> _compressionManagers = {};

  void createCommandExecutor(String deviceId) {
    _commandExecutors[deviceId]?.dispose();
    _commandExecutors[deviceId] = CommandExecutor(
      deviceId,
      _bleDevicesDataStreamsHandler,
      _bleDevicesDataStreamsHandler,
      _commandBytesProvider,
      _commandFeedbackService,
      _appLogger,
    );

    final compressionManager = CompressionManager(
      _commandExecutors[deviceId]!,
      _scannerSettingsCompressor,
      _appLogger,
    );

    _compressionManagers[deviceId] = compressionManager;
  }

  CommandExecutor getCommandExecutor(String deviceId) {
    if (!_commandExecutors.containsKey(deviceId)) {
      throw Exception("CommandExecutor for device $deviceId does not exist.");
    }

    return _commandExecutors[deviceId]!;
  }

  Future<CommandResponse> sendCommand(
      String deviceId, ScannerCommand scannerCommand) async {
    try {
      final commandExecutor = getCommandExecutor(deviceId);
      final command = _commandFactory.createCommand(scannerCommand);

      commandExecutor.sendCommand(command);

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

  void disposeForDevice(String deviceId) {
    if (_commandExecutors.containsKey(deviceId)) {
      _commandExecutors[deviceId]!.dispose();
      _commandExecutors.remove(deviceId);
    }
    if (_compressionManagers.containsKey(deviceId)) {
      _compressionManagers.remove(deviceId);
    }
  }

  void dispose() {
    _commandExecutors.forEach((key, value) {
      value.dispose();
    });
    _commandExecutors.clear();
    _compressionManagers.clear();
  }
}
