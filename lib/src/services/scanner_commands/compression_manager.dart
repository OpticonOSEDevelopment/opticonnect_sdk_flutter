import 'package:opticonnect_sdk/constants/constants.dart';
import 'package:opticonnect_sdk/src/entities/command.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/services/scanner_commands/command_executor.dart';
import 'package:opticonnect_sdk/src/services/scanner_settings/settings_compressor.dart';

class CompressionManager {
  final CommandExecutor _commandExecutor;
  final SettingsCompressor _settingsCompressor;
  final AppLogger _appLogger;

  CompressionManager(
      this._commandExecutor, this._settingsCompressor, this._appLogger);

  static const int _compressionThreshold = 30;
  int _commandsSentCounter = 0;

  Future<void> checkAndHandleCompressionThreshold() async {
    _commandsSentCounter++;

    if (_commandsSentCounter >= _compressionThreshold) {
      _commandsSentCounter = 0;

      try {
        // Fetch the current uncompressed settings
        final command = Command(fetchSettings, sendFeedback: false);
        _commandExecutor.sendCommand(command);

        final settingsResult = await command.completer.future;

        // Compress settings and send them
        final compressedCommand = await _settingsCompressor
            .getCompressedSettingsCommand(settingsResult.response);

        _commandExecutor.sendCommand(compressedCommand);
      } catch (error) {
        _appLogger.error('Error during command compression: $error');
      }
    }
  }
}
