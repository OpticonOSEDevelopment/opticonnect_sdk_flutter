import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/scanner_settings/scanner_settings.dart';

enum PositiveAndNegativeBarcodesMode {
  positiveBarcodes,
  negativeBarcodes,
  positiveAndNegativeBarcodes,
}

enum ReadMode {
  singleRead,
  multipleRead,
}

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

enum IlluminationMode {
  enableFloodlight,
  disableFloodlight,
  alternatingFloodlight,
  preventSpecularReflection,
}

class ScanOptionsSettings extends ScannerSettings {
  ScanOptionsSettings(super.sdk);

  final Map<PositiveAndNegativeBarcodesMode, String>
      _positiveAndNegativeBarcodesReadModeCommands = {
    PositiveAndNegativeBarcodesMode.positiveBarcodes: positiveBarcodes,
    PositiveAndNegativeBarcodesMode.negativeBarcodes: negativeBarcodes,
    PositiveAndNegativeBarcodesMode.positiveAndNegativeBarcodes:
        positiveAndNegativeBarcodes,
  };

  final Map<ReadMode, String> _readModeCommands = {
    ReadMode.singleRead: singleRead,
    ReadMode.multipleRead: multipleRead,
  };

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

  final Map<IlluminationMode, String> illuminationModeCommands = {
    IlluminationMode.enableFloodlight: enableFloodlight,
    IlluminationMode.disableFloodlight: disableFloodlight,
    IlluminationMode.alternatingFloodlight: alternatingFloodlight,
    IlluminationMode.preventSpecularReflection: preventSpecularReflection,
  };

  Future<CommandResponse> setPositiveAndNegativeBarcodesMode(
      String deviceId, PositiveAndNegativeBarcodesMode mode) async {
    return await sendCommand(
        deviceId, _positiveAndNegativeBarcodesReadModeCommands[mode]!);
  }

  Future<CommandResponse> setReadMode(String deviceId, ReadMode mode) async {
    return await sendCommand(deviceId, _readModeCommands[mode]!);
  }

  Future<CommandResponse> setReadTime(String deviceId, ReadTime time) async {
    return await sendCommand(deviceId, _readTimeCommands[time]!);
  }

  Future<CommandResponse> setIlluminationMode(
      String deviceId, IlluminationMode mode) async {
    return await sendCommand(deviceId, illuminationModeCommands[mode]!);
  }

  Future<CommandResponse> enableAiming(String deviceId) async {
    return await sendCommand(deviceId, aimingEnabled);
  }

  Future<CommandResponse> disableAiming(String deviceId) async {
    return await sendCommand(deviceId, aimingDisabled);
  }

  Future<CommandResponse> enableTriggerRepeat(String deviceId) async {
    return await sendCommand(deviceId, triggerRepeatEnabled);
  }

  Future<CommandResponse> disableTriggerRepeat(String deviceId) async {
    return await sendCommand(deviceId, triggerRepeatDisabled);
  }

  Future<CommandResponse> enableDeleteKey(String deviceId) async {
    return await sendCommand(deviceId, deleteKeyEnabled);
  }

  Future<CommandResponse> disableDeleteKey(String deviceId) async {
    return await sendCommand(deviceId, deleteKeyDisabled);
  }
}
