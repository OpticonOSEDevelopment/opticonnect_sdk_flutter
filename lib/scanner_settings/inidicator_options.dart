import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/base_scanner_settings.dart';

/// Enum representing the different types of buzzer sounds.
enum BuzzerType {
  singleToneBuzzer,
  highLowBuzzer,
  lowHighBuzzer,
}

/// Enum representing different durations for the buzzer sound.
enum BuzzerDuration {
  duration50ms,
  duration75ms,
  duration100ms,
  duration200ms,
  duration400ms,
}

/// Enum representing different durations for the vibration.
enum VibratorDuration {
  duration50ms,
  duration100ms,
}

/// A class that manages various indicators for the scanner such as buzzer, vibrator, and battery charging indicator.
///
/// This class allows for enabling/disabling these indicators and configuring buzzer and vibrator options.
class InidicatorOptions extends BaseScannerSettings {
  /// Constructor for [InidicatorOptions].
  ///
  /// - [sdk]: The SDK instance to send commands to the scanner.
  InidicatorOptions(super.sdk);

  /// A mapping of [BuzzerType] to the corresponding command string.
  final Map<BuzzerType, String> _buzzerTypeCommands = {
    BuzzerType.singleToneBuzzer: singleToneBuzzer,
    BuzzerType.highLowBuzzer: highLowBuzzer,
    BuzzerType.lowHighBuzzer: lowHighBuzzer,
  };

  /// A mapping of [BuzzerDuration] to the corresponding command string.
  final Map<BuzzerDuration, String> _buzzerDurationCommands = {
    BuzzerDuration.duration50ms: buzzerDuration50ms,
    BuzzerDuration.duration75ms: buzzerDuration75ms,
    BuzzerDuration.duration100ms: buzzerDuration100ms,
    BuzzerDuration.duration200ms: buzzerDuration200ms,
    BuzzerDuration.duration400ms: buzzerDuration400ms,
  };

  /// A mapping of [VibratorDuration] to the corresponding command string.
  final Map<VibratorDuration, String> _vibratorDuration = {
    VibratorDuration.duration50ms: vibratorDuration50ms,
    VibratorDuration.duration100ms: vibratorDuration100ms,
  };

  /// Enables the buzzer on the scanner.
  ///
  /// - [deviceId]: The ID of the BLE device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableBuzzer(String deviceId) async {
    return sendCommand(deviceId, buzzerEnabled);
  }

  /// Disables the buzzer on the scanner.
  ///
  /// - [deviceId]: The ID of the BLE device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableBuzzer(String deviceId) async {
    return sendCommand(deviceId, buzzerDisabled);
  }

  /// Sets the buzzer type on the scanner.
  ///
  /// - [deviceId]: The ID of the BLE device.
  /// - [type]: The type of buzzer sound, specified by the [BuzzerType] enum.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setBuzzerType(
      String deviceId, BuzzerType type) async {
    return sendCommand(deviceId, _buzzerTypeCommands[type]!);
  }

  /// Sets the buzzer duration on the scanner.
  ///
  /// - [deviceId]: The ID of the BLE device.
  /// - [duration]: The duration of the buzzer, specified by the [BuzzerDuration] enum.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setBuzzerDuration(
      String deviceId, BuzzerDuration duration) async {
    return sendCommand(deviceId, _buzzerDurationCommands[duration]!);
  }

  /// Enables the battery charging indicator on the scanner.
  ///
  /// - [deviceId]: The ID of the BLE device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableBatteryChargingIndicator(
      String deviceId) async {
    return sendCommand(deviceId, batteryChargingIndicatorEnabled);
  }

  /// Disables the battery charging indicator on the scanner.
  ///
  /// - [deviceId]: The ID of the BLE device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableBatteryChargingIndicator(
      String deviceId) async {
    return sendCommand(deviceId, batteryChargingIndicatorDisabled);
  }

  /// Enables the vibrator on the scanner.
  ///
  /// - [deviceId]: The ID of the BLE device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableVibrator(String deviceId) async {
    return sendCommand(deviceId, vibratorEnabled);
  }

  /// Disables the vibrator on the scanner.
  ///
  /// - [deviceId]: The ID of the BLE device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableVibrator(String deviceId) async {
    return sendCommand(deviceId, vibratorDisabled);
  }

  /// Sets the vibration duration on the scanner.
  ///
  /// - [deviceId]: The ID of the BLE device.
  /// - [duration]: The duration of the vibration, specified by the [VibratorDuration] enum.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setVibratorDuration(
      String deviceId, VibratorDuration duration) async {
    return sendCommand(deviceId, _vibratorDuration[duration]!);
  }

  /// Enables vibration when the scan button is pressed.
  ///
  /// - [deviceId]: The ID of the BLE device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableVibrateOnScanButtonPress(
      String deviceId) async {
    return sendCommand(deviceId, enableVibratonOnButtonPress);
  }

  /// Disables vibration when the scan button is pressed.
  ///
  /// - [deviceId]: The ID of the BLE device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableVibrateOnScanButtonPress(
      String deviceId) async {
    return sendCommand(deviceId, disableVibratonOnButtonPress);
  }
}
