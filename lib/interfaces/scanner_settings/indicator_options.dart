import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/entities/led_color.dart';
import 'package:opticonnect_sdk/enums/scanner_settings/indicator_options.dart';

/// Manages various indicators for the scanner such as buzzer, vibrator, and battery charging indicator.
///
/// Allows enabling/disabling these indicators and configuring buzzer and vibrator options.
abstract class IndicatorOptions {
  /// Toggles the buzzer on or off based on the [enabled] flag.
  Future<CommandResponse> toggleBuzzer(
      {required String deviceId, required bool enabled});

  /// Tests the volume without storing it (non-persistent).
  Future<CommandResponse> testBuzzerVolume(
      {required String deviceId, required int volume});

  /// Sets the buzzer volume (persistent).
  Future<CommandResponse> setBuzzerVolume(
      {required String deviceId, required int volume});

  /// Sets the buzzer type on the scanner.
  Future<CommandResponse> setBuzzerType(
      {required String deviceId, required BuzzerType type});

  /// Sets the buzzer duration on the scanner.
  Future<CommandResponse> setBuzzerDuration(
      {required String deviceId, required BuzzerDuration duration});

  /// Toggles the buzzer sound when pressing any button on the scanner based on the [enabled] flag.
  Future<CommandResponse> toggleBuzzerOnKeyclick(
      {required String deviceId, required bool enabled});

  /// Toggles the battery charging indicator on or off based on the [enabled] flag.
  Future<CommandResponse> toggleBatteryChargingIndicator(
      {required String deviceId, required bool enabled});

  /// Toggles the vibrator on or off based on the [enabled] flag.
  Future<CommandResponse> toggleVibrator(
      {required String deviceId, required bool enabled});

  /// Sets the vibration duration on the scanner.
  Future<CommandResponse> setVibratorDuration(
      {required String deviceId, required VibratorDuration duration});

  /// Toggles the vibration when the scan button is pressed based on the [enabled] flag.
  Future<CommandResponse> toggleVibrateOnScanButtonPress(
      {required String deviceId, required bool enabled});

  /// Tests the LED by setting the color temporarily (non-persistent).
  Future<CommandResponse> testLED(
      {required String deviceId, required LEDColor color});

  /// Sets the LED color permanently (persistent).
  Future<CommandResponse> setLED(
      {required String deviceId, required LEDColor color});

  /// Sets the good read LED duration on the scanner.
  Future<CommandResponse> setGoodReadLedDuration(
      {required String deviceId, required GoodReadLedDuration duration});
}
