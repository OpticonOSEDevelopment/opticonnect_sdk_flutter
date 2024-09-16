import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/base_scanner_settings.dart';

/// Enum representing different modes for reading positive and negative barcodes.
enum PositiveAndNegativeBarcodesMode {
  positiveBarcodes,
  negativeBarcodes,
  positiveAndNegativeBarcodes,
}

/// Enum representing different modes for single or multiple reads.
enum ReadMode {
  singleRead,
  multipleRead,
}

/// Enum representing different read times for the scanner.
enum ReadTime {
  zeroSeconds,
  oneSecond,
  twoSeconds,
  threeSeconds,
  fourSeconds,
  fiveSeconds,
  sixSeconds,
  sevenSeconds,
  eightSeconds,
  nineSeconds,
  indefinitely,
}

/// Enum representing different modes for illumination control during scanning.
enum IlluminationMode {
  enableFloodlight,
  disableFloodlight,
  alternatingFloodlight,
  preventSpecularReflection,
}

/// Class responsible for configuring scan options, including read modes, illumination, and barcode settings.
class ScanOptionsSettings extends BaseScannerSettings {
  /// Constructor for [ScanOptionsSettings].
  ///
  /// - [sdk]: The SDK instance to send commands to the scanner.
  ScanOptionsSettings(super.sdk);

  /// A mapping of [PositiveAndNegativeBarcodesMode] to the corresponding command string.
  final Map<PositiveAndNegativeBarcodesMode, String>
      _positiveAndNegativeBarcodesReadModeCommands = {
    PositiveAndNegativeBarcodesMode.positiveBarcodes: positiveBarcodes,
    PositiveAndNegativeBarcodesMode.negativeBarcodes: negativeBarcodes,
    PositiveAndNegativeBarcodesMode.positiveAndNegativeBarcodes:
        positiveAndNegativeBarcodes,
  };

  /// A mapping of [ReadMode] to the corresponding command string.
  final Map<ReadMode, String> _readModeCommands = {
    ReadMode.singleRead: singleRead,
    ReadMode.multipleRead: multipleRead,
  };

  /// A mapping of [ReadTime] to the corresponding command string.
  final Map<ReadTime, String> _readTimeCommands = {
    ReadTime.zeroSeconds: readTime0Seconds,
    ReadTime.oneSecond: readTime1Second,
    ReadTime.twoSeconds: readTime2Seconds,
    ReadTime.threeSeconds: readTime3Seconds,
    ReadTime.fourSeconds: readTime4Seconds,
    ReadTime.fiveSeconds: readTime5Seconds,
    ReadTime.sixSeconds: readTime6Seconds,
    ReadTime.sevenSeconds: readTime7Seconds,
    ReadTime.eightSeconds: readTime8Seconds,
    ReadTime.nineSeconds: readTime9Seconds,
    ReadTime.indefinitely: readTimeIndefinitely,
  };

  /// A mapping of [IlluminationMode] to the corresponding command string.
  final Map<IlluminationMode, String> illuminationModeCommands = {
    IlluminationMode.enableFloodlight: enableFloodlight,
    IlluminationMode.disableFloodlight: disableFloodlight,
    IlluminationMode.alternatingFloodlight: alternatingFloodlight,
    IlluminationMode.preventSpecularReflection: preventSpecularReflection,
  };

  /// Sets the mode for reading positive and negative barcodes.
  ///
  /// - [deviceId]: The ID of the BLE device.
  /// - [mode]: The mode to set for barcode reading, specified by [PositiveAndNegativeBarcodesMode].
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setPositiveAndNegativeBarcodesMode(
      String deviceId, PositiveAndNegativeBarcodesMode mode) async {
    return await sendCommand(
        deviceId, _positiveAndNegativeBarcodesReadModeCommands[mode]!);
  }

  /// Sets the read mode for the scanner.
  ///
  /// - [deviceId]: The ID of the BLE device.
  /// - [mode]: The mode to set for reading, specified by [ReadMode].
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setReadMode(String deviceId, ReadMode mode) async {
    return await sendCommand(deviceId, _readModeCommands[mode]!);
  }

  /// Sets the read time for the scanner.
  ///
  /// - [deviceId]: The ID of the BLE device.
  /// - [time]: The duration for reading, specified by [ReadTime].
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setReadTime(String deviceId, ReadTime time) async {
    return await sendCommand(deviceId, _readTimeCommands[time]!);
  }

  /// Sets the illumination mode for the scanner.
  ///
  /// - [deviceId]: The ID of the BLE device.
  /// - [mode]: The illumination mode to set, specified by [IlluminationMode].
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setIlluminationMode(
      String deviceId, IlluminationMode mode) async {
    return await sendCommand(deviceId, illuminationModeCommands[mode]!);
  }

  /// Enables the aiming feature for the scanner.
  ///
  /// - [deviceId]: The ID of the BLE device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableAiming(String deviceId) async {
    return await sendCommand(deviceId, aimingEnabled);
  }

  /// Disables the aiming feature for the scanner.
  ///
  /// - [deviceId]: The ID of the BLE device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableAiming(String deviceId) async {
    return await sendCommand(deviceId, aimingDisabled);
  }

  /// Enables the trigger repeat feature for the scanner.
  ///
  /// - [deviceId]: The ID of the BLE device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableTriggerRepeat(String deviceId) async {
    return await sendCommand(deviceId, triggerRepeatEnabled);
  }

  /// Disables the trigger repeat feature for the scanner.
  ///
  /// - [deviceId]: The ID of the BLE device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableTriggerRepeat(String deviceId) async {
    return await sendCommand(deviceId, triggerRepeatDisabled);
  }

  /// Enables the delete key feature for the scanner.
  ///
  /// - [deviceId]: The ID of the BLE device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableDeleteKey(String deviceId) async {
    return await sendCommand(deviceId, deleteKeyEnabled);
  }

  /// Disables the delete key feature for the scanner.
  ///
  /// - [deviceId]: The ID of the BLE device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableDeleteKey(String deviceId) async {
    return await sendCommand(deviceId, deleteKeyDisabled);
  }
}
