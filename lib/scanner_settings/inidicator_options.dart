import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/scanner_settings/scanner_settings.dart';

enum BuzzerType {
  singleToneBuzzer,
  highLowBuzzer,
  lowHighBuzzer,
}

enum BuzzerDuration {
  duration50ms,
  duration75ms,
  duration100ms,
  duration200ms,
  duration400ms,
}

enum VibratorDuration {
  duration50ms,
  duration100ms,
}

class InidicatorOptions extends ScannerSettings {
  InidicatorOptions(super.sdk);

  final Map<BuzzerType, String> _buzzerTypeCommands = {
    BuzzerType.singleToneBuzzer: singleToneBuzzer,
    BuzzerType.highLowBuzzer: highLowBuzzer,
    BuzzerType.lowHighBuzzer: lowHighBuzzer,
  };

  final Map<BuzzerDuration, String> _buzzerDurationCommands = {
    BuzzerDuration.duration50ms: buzzerDuration50ms,
    BuzzerDuration.duration75ms: buzzerDuration75ms,
    BuzzerDuration.duration100ms: buzzerDuration100ms,
    BuzzerDuration.duration200ms: buzzerDuration200ms,
    BuzzerDuration.duration400ms: buzzerDuration400ms,
  };

  final Map<VibratorDuration, String> _vibratorDuration = {
    VibratorDuration.duration50ms: vibratorDuration50ms,
    VibratorDuration.duration100ms: vibratorDuration100ms,
  };

  Future<CommandResponse> enableBuzzer(String deviceId) async {
    return sendCommand(deviceId, buzzerEnabled);
  }

  Future<CommandResponse> disableBuzzer(String deviceId) async {
    return sendCommand(deviceId, buzzerDisabled);
  }

  Future<CommandResponse> setBuzzerType(
      String deviceId, BuzzerType type) async {
    return sendCommand(deviceId, _buzzerTypeCommands[type]!);
  }

  Future<CommandResponse> setBuzzerDuration(
      String deviceId, BuzzerDuration duration) async {
    return sendCommand(deviceId, _buzzerDurationCommands[duration]!);
  }

  Future<CommandResponse> enableBatteryChargingIndicator(
      String deviceId) async {
    return sendCommand(deviceId, batteryChargingIndicatorEnabled);
  }

  Future<CommandResponse> disableBatteryChargingIndicator(
      String deviceId) async {
    return sendCommand(deviceId, batteryChargingIndicatorDisabled);
  }

  Future<CommandResponse> enableVibrator(String deviceId) async {
    return sendCommand(deviceId, vibratorEnabled);
  }

  Future<CommandResponse> disableVibrator(String deviceId) async {
    return sendCommand(deviceId, vibratorDisabled);
  }

  Future<CommandResponse> setVibratorDuration(
      String deviceId, VibratorDuration duration) async {
    return sendCommand(deviceId, _vibratorDuration[duration]!);
  }

  Future<CommandResponse> enableVibrateOnScanButtonPress(
      String deviceId) async {
    return sendCommand(deviceId, enableVibratonOnButtonPress);
  }

  Future<CommandResponse> disableVibrateOnScanButtonPress(
      String deviceId) async {
    return sendCommand(deviceId, disableVibratonOnButtonPress);
  }
}
