import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/enums/scanner_settings/read_options.dart';
import 'package:opticonnect_sdk/interfaces/scanner_settings/read_options.dart';
import 'package:opticonnect_sdk/src/interfaces/settings_base.dart';

@LazySingleton(as: ReadOptions)
class ReadOptionsImpl extends SettingsBase implements ReadOptions {
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

  final Map<IlluminationMode, String> _illuminationModeCommands = {
    IlluminationMode.enableFloodlight: enableFloodlight,
    IlluminationMode.disableFloodlight: disableFloodlight,
    IlluminationMode.alternatingFloodlight: alternatingFloodlight,
    IlluminationMode.preventSpecularReflection: preventSpecularReflection,
  };

  @override
  Future<CommandResponse> setPositiveAndNegativeBarcodesMode({
    required String deviceId,
    required PositiveAndNegativeBarcodesMode mode,
  }) async {
    return await sendCommand(
        deviceId, _positiveAndNegativeBarcodesReadModeCommands[mode]!);
  }

  @override
  Future<CommandResponse> setReadMode({
    required String deviceId,
    required ReadMode mode,
  }) async {
    return await sendCommand(deviceId, _readModeCommands[mode]!);
  }

  @override
  Future<CommandResponse> setReadTime({
    required String deviceId,
    required ReadTime time,
  }) async {
    return await sendCommand(deviceId, _readTimeCommands[time]!);
  }

  @override
  Future<CommandResponse> setIlluminationMode({
    required String deviceId,
    required IlluminationMode mode,
  }) async {
    return await sendCommand(deviceId, _illuminationModeCommands[mode]!);
  }

  @override
  Future<CommandResponse> setAiming({
    required String deviceId,
    required bool enabled,
  }) async {
    return await sendCommand(
        deviceId, enabled ? aimingEnabled : aimingDisabled);
  }

  @override
  Future<CommandResponse> setTriggerRepeat({
    required String deviceId,
    required bool enabled,
  }) async {
    return await sendCommand(
        deviceId, enabled ? triggerRepeatEnabled : triggerRepeatDisabled);
  }

  @override
  Future<CommandResponse> setDeleteKey({
    required String deviceId,
    required bool enabled,
  }) async {
    return await sendCommand(
        deviceId, enabled ? deleteKeyEnabled : deleteKeyDisabled);
  }
}
