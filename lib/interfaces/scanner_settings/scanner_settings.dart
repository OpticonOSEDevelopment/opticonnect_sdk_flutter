part of 'package:opticonnect_sdk/interfaces.dart';

/// A contract for scanner settings functionality within Opticon BLE scanners.
///
/// Provides access to various scanner configurations and operations,
/// including enabling specific codes, configuring scan options,
/// and managing formatting options.
abstract class ScannerSettings {
  /// Settings related to enabling specific barcode symbologies.
  Symbology get symbology;

  /// Settings specific to the configuration of individual barcode symbologies.
  CodeSpecific get codeSpecific;

  /// Settings related to scanning options such as trigger modes.
  ReadOptions get readOptions;

  /// Options for configuring scanner indicators like buzzer, LEDs, and vibration.
  IndicatorOptions get indicator;

  /// Options for customizing the formatting of scanned barcode data.
  Formatting get formatting;

  /// Settings to manage the connection pool of scanners.
  ConnectionPool get connectionPool;

  /// Sends a command to the connected BLE device.
  ///
  /// The [deviceId] specifies the BLE device to send the command to.
  /// The [command] represents the command to be sent, along with any associated parameters.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> executeCommand(
      String deviceId, ScannerCommand command);

  /// Retrieves the current scanner settings from the device as a list of [CommandData].
  ///
  /// The [deviceId] specifies the BLE device whose settings will be retrieved.
  ///
  /// Be sure to first persist the settings by calling [persistSettings] before fetching them.
  ///
  /// Returns:
  /// - A list of [CommandData] representing the current scanner settings.
  Future<List<CommandData>> getSettings(String deviceId);

  /// Resets the scanner settings to the default.
  ///
  /// The [deviceId] specifies the BLE device whose settings will be reset.
  ///
  /// Returns:
  /// - A boolean indicating whether the settings were successfully reset.
  Future<bool> resetSettings(String deviceId);
}
