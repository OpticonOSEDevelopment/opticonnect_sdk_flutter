import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_data.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/entities/scanner_command.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific_settings/code_specific_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/connection_pool_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/enable_codes_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/formatting_options.dart';
import 'package:opticonnect_sdk/scanner_settings/inidicator_options.dart';
import 'package:opticonnect_sdk/scanner_settings/led_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/scan_options_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/volume_settings.dart';
import 'package:opticonnect_sdk/src/injection/injection.config.dart';
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
class ScannerSettingsManager extends BaseScannerSettings {
  final _appLogger = getIt<AppLogger>();

  ScannerSettingsManager(super.sdk);

  /// Settings related to enabling specific barcode symbologies.
  late final EnableCodesSettings enableCodesSettings;

  /// Settings specific to the configuration of individual barcode symbologies.
  late final CodeSpecificSettings codeSpecificSettings;

  /// Settings related to scanning options such as trigger modes.
  late final ScanOptionsSettings scanOptionsSettings;

  /// Options for configuring scanner indicators like buzzer, LEDs and vibration.
  late final InidicatorOptions inidicatorOptions;

  /// Options for customizing the formatting of scanned barcode data.
  late final FormattingOptions formattingOptions;

  /// Settings related to adjusting the scanner's volume.
  late final VolumeSettings volumeSettings;

  /// Settings to configure the scanner's LED behavior.
  late final LEDSettings ledSettings;

  /// Settings to manage the connection pool settings of scanners.
  late final ConnectionPoolSettings connectionPoolSettings;

  /// The command handlers manager instance to send commands to the scanner.
  late final CommandHandlersManager _commandHandlersManager;

  /// The scanner settings compressor instance to decompress settings.
  late final ScannerSettingsCompressor _scannerSettingsCompressor;

  /// Initializes the properties that provide access to the various scanner settings categories.
  ///
  /// This method is automatically called during the SDK initialization (`OptiConnectSDK.initialize()`),
  /// so it is not necessary to call this method manually.
  Future<void> initialize() async {
    enableCodesSettings = EnableCodesSettings(sdk);
    codeSpecificSettings = CodeSpecificSettings(sdk);
    scanOptionsSettings = ScanOptionsSettings(sdk);
    inidicatorOptions = InidicatorOptions(sdk);
    formattingOptions = FormattingOptions(sdk);
    volumeSettings = VolumeSettings(sdk);
    ledSettings = LEDSettings(sdk);
    connectionPoolSettings = ConnectionPoolSettings(sdk);
    _commandHandlersManager = getIt<CommandHandlersManager>();
    _scannerSettingsCompressor = getIt<ScannerSettingsCompressor>();

    await codeSpecificSettings.initialize();
  }

  /// Sends a command to the connected BLE device.
  ///
  /// The [deviceId] specifies the BLE device to send the command to.
  /// The [command] represents the command to be sent, along with any associated parameters.
  /// Single 3 or 4-letter commands should be sent without the square brackets. Multiple commands in one request should be sent with square brackets.
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

  /// Persists the current scanner settings on the device.
  ///
  /// The [deviceId] specifies the BLE device whose settings will be persisted.
  ///
  /// Returns a boolean indicating whether the settings were successfully saved.
  Future<bool> persistSettings(String deviceId) async {
    try {
      final result = await _commandHandlersManager.sendCommand(
          deviceId, ScannerCommand(saveSettings));
      return result.succeeded;
    } catch (e) {
      _appLogger.error("Error persisting settings for device $deviceId: $e");
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
          deviceId, ScannerCommand(fetchSettings));

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
}
