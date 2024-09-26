import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/src/entities/command.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/services/scanner_commands_services/command_handler.dart';
import 'package:opticonnect_sdk/src/services/scanner_settings_services/scanner_settings_compressor.dart';

class CommandCompressionManager {
  final CommandHandler _commandHandler;
  final ScannerSettingsCompressor _scannerSettingsCompressor;
  final AppLogger _appLogger;

  CommandCompressionManager(
      this._commandHandler, this._scannerSettingsCompressor, this._appLogger);

  static const int _compressionThreshold = 30;
  int _commandsSentCounter = 0;

  Future<void> checkAndHandleCompressionThreshold() async {
    _commandsSentCounter++;

    if (_commandsSentCounter >= _compressionThreshold) {
      _commandsSentCounter = 0;

      try {
        // Fetch the current uncompressed settings
        final command = Command(fetchSettings, sendFeedback: false);
        _commandHandler.sendCommand(command);

        final settingsResult = await command.completer.future;

        // Compress settings and send them
        final compressedCommand = await _scannerSettingsCompressor
            .getCompressedSettingsCommand(settingsResult.response);

        _commandHandler.sendCommand(compressedCommand);
      } catch (error) {
        _appLogger.error('Error during command compression: $error');
      }
    }
  }
}
