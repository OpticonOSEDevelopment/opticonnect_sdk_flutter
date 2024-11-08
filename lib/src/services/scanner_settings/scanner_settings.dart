import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants.dart';
import 'package:opticonnect_sdk/entities.dart';
import 'package:opticonnect_sdk/interfaces.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/interfaces/settings_base.dart';
import 'package:opticonnect_sdk/src/services/scanner_commands/command_executors_manager.dart';
import 'package:opticonnect_sdk/src/services/scanner_settings/settings_compressor.dart';

@LazySingleton(as: ScannerSettings)
class ScannerSettingsImpl extends SettingsBase implements ScannerSettings {
  @override
  final Symbology symbology;

  @override
  final CodeSpecific codeSpecific;

  @override
  final ReadOptions readOptions;

  @override
  final IndicatorOptions indicator;

  @override
  final Formatting formatting;

  @override
  final ConnectionPool connectionPool;

  final CommandExecutorsManager _commandExecutorsManager;
  final SettingsCompressor _scannerSettingsCompressor;
  final AppLogger _appLogger;

  ScannerSettingsImpl(
    this.symbology,
    this.codeSpecific,
    this.readOptions,
    this.indicator,
    this.formatting,
    this.connectionPool,
    this._commandExecutorsManager,
    this._scannerSettingsCompressor,
    this._appLogger,
  );

  @override
  Future<CommandResponse> executeCommand(
      String deviceId, ScannerCommand command) async {
    try {
      return await _commandExecutorsManager.sendCommand(deviceId, command);
    } catch (e) {
      _appLogger.error("Error sending command to device $deviceId: $e");
      rethrow;
    }
  }

  @override
  Future<List<CommandData>> getSettings(String deviceId) async {
    try {
      final result = await _commandExecutorsManager.sendCommand(
        deviceId,
        ScannerCommand(
          fetchSettings,
          sendFeedback: false,
          ledFeedback: false,
          buzzerFeedback: false,
          vibrationFeedback: false,
        ),
      );

      if (!result.succeeded) {
        throw ("Error fetching settings for device $deviceId: ${result.response}");
      }

      return await _scannerSettingsCompressor
          .getCompressedSettingsList(result.response);
    } catch (e) {
      _appLogger.error("Error getting settings for device $deviceId: $e");
      rethrow;
    }
  }

  @override
  Future<bool> resetSettings(String deviceId) async {
    try {
      final result = await _commandExecutorsManager.sendCommand(
        deviceId,
        ScannerCommand(bluetoothLowEnergyDefault),
      );
      return result.succeeded;
    } catch (e) {
      _appLogger.error("Error resetting settings for device $deviceId: $e");
      rethrow;
    }
  }
}
