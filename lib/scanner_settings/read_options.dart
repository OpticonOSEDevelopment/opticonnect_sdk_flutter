import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/injection/injection.config.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/scanner_settings/settings_base.dart';

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
@lazySingleton
class ReadOptions extends SettingsBase {
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
  /// [deviceId] - The identifier of the target device.
  /// [mode] - The mode to set for barcode reading, specified by [PositiveAndNegativeBarcodesMode].
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setPositiveAndNegativeBarcodesMode(
      String deviceId, PositiveAndNegativeBarcodesMode mode) async {
    return await sendCommand(
        deviceId, _positiveAndNegativeBarcodesReadModeCommands[mode]!);
  }

  /// Sets the read mode for the scanner.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [mode] - The mode to set for reading, specified by [ReadMode].
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setReadMode(String deviceId, ReadMode mode) async {
    return await sendCommand(deviceId, _readModeCommands[mode]!);
  }

  /// Sets the read time for the scanner.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [time] - The duration for reading, specified by [ReadTime].
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setReadTime(String deviceId, ReadTime time) async {
    return await sendCommand(deviceId, _readTimeCommands[time]!);
  }

  /// Sets the illumination mode for the scanner.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [mode] - The illumination mode to set, specified by [IlluminationMode].
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setIlluminationMode(
      String deviceId, IlluminationMode mode) async {
    final appLogger = getIt<AppLogger>();
    appLogger.warning(
        'Setting illumination mode to $mode with code ${illuminationModeCommands[mode]!}');

    return await sendCommand(deviceId, illuminationModeCommands[mode]!);
  }

  /// Toggles the aiming feature for the scanner based on the [enabled] flag.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable or disable aiming.
  Future<CommandResponse> setAiming(String deviceId,
      {required bool enabled}) async {
    return await sendCommand(
        deviceId, enabled ? aimingEnabled : aimingDisabled);
  }

  /// Toggles the trigger repeat feature for the scanner based on the [enabled] flag.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable or disable trigger repeat.
  Future<CommandResponse> setTriggerRepeat(String deviceId,
      {required bool enabled}) async {
    return await sendCommand(
        deviceId, enabled ? triggerRepeatEnabled : triggerRepeatDisabled);
  }

  /// Toggles the delete key feature for the scanner based on the [enabled] flag.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable or disable the delete key.
  Future<CommandResponse> setDeleteKey(String deviceId,
      {required bool enabled}) async {
    return await sendCommand(
        deviceId, enabled ? deleteKeyEnabled : deleteKeyDisabled);
  }
}
