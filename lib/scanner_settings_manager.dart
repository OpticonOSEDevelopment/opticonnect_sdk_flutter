import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_data.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/entities/scanner_command.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific_settings/code_specific_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/connection_pool_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/formatting_options.dart';
import 'package:opticonnect_sdk/scanner_settings/inidicator_options.dart';
import 'package:opticonnect_sdk/scanner_settings/scan_options_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/symbology_settings.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/scanner_settings/base_scanner_settings.dart';
import 'package:opticonnect_sdk/src/services/scanner_commands_services/command_handlers_manager.dart';
import 'package:opticonnect_sdk/src/services/scanner_settings_services/scanner_settings_compressor.dart';

/// A class representing the scanner settings for Opticon BLE scanners.
///
/// This class provides access to various settings, including enabling specific codes,
/// configuring scan options, and managing formatting options.
///
/// It is recommended that you access this class through the `OptiConnectSDK` and
/// avoid initializing or modifying the settings manually.
///
/// Example usage:
/// ```dart
/// final sdk = OptiConnectSDK.instance;
/// sdk.initialize();
/// final scannerSettings = sdk.scannerSettings;
/// ```
@lazySingleton
class ScannerSettingsManager extends BaseScannerSettings {
  /// Settings related to enabling specific barcode symbologies.
  final SymbologySettings symbologySettings;

  /// Settings specific to the configuration of individual barcode symbologies.
  final CodeSpecificSettings codeSpecificSettings;

  /// Settings related to scanning options such as trigger modes.
  final ScanOptionsSettings scanOptionsSettings;

  /// Options for configuring scanner indicators like buzzer, LEDs and vibration.
  final InidicatorOptions inidicatorOptions;

  /// Options for customizing the formatting of scanned barcode data.
  final FormattingOptions formattingOptions;

  /// Settings to manage the connection pool settings of scanners.
  final ConnectionPoolSettings connectionPoolSettings;

  /// The command handlers manager instance to send commands to the scanner.
  final CommandHandlersManager _commandHandlersManager;

  /// The scanner settings compressor instance to decompress settings.
  final ScannerSettingsCompressor _scannerSettingsCompressor;

  /// The application logger instance to log messages.
  final AppLogger _appLogger;

  /// Injects the dependencies.
  ScannerSettingsManager(
      this.symbologySettings,
      this.codeSpecificSettings,
      this.scanOptionsSettings,
      this.inidicatorOptions,
      this.formattingOptions,
      this.connectionPoolSettings,
      this._commandHandlersManager,
      this._scannerSettingsCompressor,
      this._appLogger);

  /// Sends a command to the connected BLE device.
  ///
  /// The [deviceId] specifies the BLE device to send the command to.
  /// The [command] represents the command to be sent, along with any associated parameters.
  /// Single 3 or 4-letter commands sent should not use square brackets as they are auto-added.
  /// For multiple commands in one request, 3-letter commands should always start with '[',
  /// and 4-letter commands should start with ']'.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> executeCommand(
      String deviceId, ScannerCommand command) async {
    try {
      return await _commandHandlersManager.sendCommand(deviceId, command);
    } catch (e) {
      _appLogger.error("Error sending command to device $deviceId: $e");
      rethrow;
    }
  }

  /// Retrieves the current scanner settings from the device as a list of [CommandData].
  ///
  /// The [deviceId] specifies the BLE device whose settings will be retrieved.
  ///
  /// The method will return a list of [CommandData], where each [CommandData] object contains
  /// the command name and its associated parameters, if any.
  ///
  /// Be sure to first persist the settings by calling [persistSettings] before fetching them.
  ///
  /// Throws an exception if there is an error during the process or if fetching the settings fails.
  ///
  /// Returns:
  /// - A list of [CommandData] representing the current scanner settings.
  Future<List<CommandData>> getSettings(String deviceId) async {
    try {
      final result = await _commandHandlersManager.sendCommand(
          deviceId,
          ScannerCommand(fetchSettings,
              ledFeedback: false,
              buzzerFeedback: false,
              vibrationFeedback: false));

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

  /// Resets the scanner settings to the default.
  ///
  /// The [deviceId] specifies the BLE device whose settings will be reset.
  ///
  /// Throws an exception if there is an error during the process or if resetting the settings fails.
  ///
  /// Returns:
  /// - A boolean indicating whether the settings were successfully reset.
  Future<bool> resetSettings(String deviceId) async {
    try {
      final result = await _commandHandlersManager.sendCommand(
          deviceId, ScannerCommand(bluetoothLowEnergyDefault));
      return result.succeeded;
    } catch (e) {
      _appLogger.error("Error resetting settings for device $deviceId: $e");
      rethrow;
    }
  }
}