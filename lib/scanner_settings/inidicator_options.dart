import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/entities/led_color.dart';
import 'package:opticonnect_sdk/helpers/direct_input_keys_helper.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/scanner_settings/settings_base.dart';

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

/// Enum representing different durations for the good read LED.
enum GoodReadLedDuration {
  disabled,
  duration10ms,
  duration60ms,
  duration100ms,
  duration200ms,
  duration400ms,
  duration500ms,
  duration800ms,
  duration2000ms,
}

/// A class that manages various indicators for the scanner such as buzzer, vibrator, and battery charging indicator.
///
/// This class allows for enabling/disabling these indicators and configuring buzzer and vibrator options.
@lazySingleton
class InidicatorOptions extends SettingsBase {
  final AppLogger _appLogger;

  InidicatorOptions(this._appLogger);

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

  /// A mapping of [GoodReadLedDuration] to the corresponding command string.
  final Map<GoodReadLedDuration, String> _goodReadLedDurationCommands = {
    GoodReadLedDuration.disabled: goodReadLedDurationDisabled,
    GoodReadLedDuration.duration10ms: goodReadLedDuration10ms,
    GoodReadLedDuration.duration60ms: goodReadLedDuration60ms,
    GoodReadLedDuration.duration100ms: goodReadLedDuration100ms,
    GoodReadLedDuration.duration200ms: goodReadLedDuration200ms,
    GoodReadLedDuration.duration400ms: goodReadLedDuration400ms,
    GoodReadLedDuration.duration500ms: goodReadLedDuration500ms,
    GoodReadLedDuration.duration800ms: goodReadLedDuration800ms,
    GoodReadLedDuration.duration2000ms: goodReadLedDuration2000ms,
  };

  /// Handles the volume command by validating the volume range and sending the command to the device.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [volume] - The volume value to be set, ranging from 0 to 100.
  /// [command] - The command string representing either persistent or non-persistent volume settings.
  ///
  /// - Returns: A [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> _handleBuzzerVolumeCommand(
      String deviceId, int volume, String command) async {
    if (volume < 0 || volume > 100) {
      const msg = 'Volume must be between 0 and 100.';
      _appLogger.warning(msg);
      return CommandResponse.failed(msg);
    }
    final volumeInDirectInputKeys =
        DirectInputKeysHelper.convertIntToDirectInputKeys(volume);
    return sendCommand(deviceId, command, parameters: volumeInDirectInputKeys);
  }

  /// Toggles the buzzer on or off based on the [enabled] flag.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable or disable the buzzer.
  Future<CommandResponse> toggleBuzzer(String deviceId,
      {required bool enabled}) async {
    return sendCommand(deviceId, enabled ? buzzerEnabled : buzzerDisabled);
  }

  /// Tests the volume without storing it (non-persistent).
  ///
  /// [deviceId] - The identifier of the target device.
  /// [volume] - The volume value to be set, ranging from 0 to 100.
  ///
  /// - Returns: A [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> testBuzzerVolume(String deviceId, int volume) async {
    return _handleBuzzerVolumeCommand(deviceId, volume, nonPersistentSetBuzzer);
  }

  /// Sets the buzzer volume (persistent).
  ///
  /// [deviceId] - The identifier of the target device.
  /// [volume] - The volume value to be set, ranging from 0 to 100.
  ///
  /// - Returns: A [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setBuzzerVolume(String deviceId, int volume) async {
    return _handleBuzzerVolumeCommand(deviceId, volume, persistentSetBuzzer);
  }

  /// Sets the buzzer type on the scanner.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [type] - The type of buzzer sound, specified by the [BuzzerType] enum.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setBuzzerType(
      String deviceId, BuzzerType type) async {
    return sendCommand(deviceId, _buzzerTypeCommands[type]!);
  }

  /// Sets the buzzer duration on the scanner.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [duration] - The duration of the buzzer, specified by the [BuzzerDuration] enum.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setBuzzerDuration(
      String deviceId, BuzzerDuration duration) async {
    return sendCommand(deviceId, _buzzerDurationCommands[duration]!);
  }

  /// Toggles the buzzer sound when pressing any button on the scanner based on the [enabled] flag.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable or disable the buzzer on key press.
  Future<CommandResponse> toggleBuzzerOnKeyclick(String deviceId,
      {required bool enabled}) async {
    return sendCommand(
        deviceId, enabled ? buzzerOnKeyclickOn : buzzerOnKeyclickOff);
  }

  /// Toggles the battery charging indicator on or off based on the [enabled] flag.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable or disable the battery charging indicator.
  Future<CommandResponse> toggleBatteryChargingIndicator(String deviceId,
      {required bool enabled}) async {
    return sendCommand(
        deviceId,
        enabled
            ? batteryChargingIndicatorEnabled
            : batteryChargingIndicatorDisabled);
  }

  /// Toggles the vibrator on or off based on the [enabled] flag.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable or disable the vibrator.
  Future<CommandResponse> toggleVibrator(String deviceId,
      {required bool enabled}) async {
    return sendCommand(deviceId, enabled ? vibratorEnabled : vibratorDisabled);
  }

  /// Sets the vibration duration on the scanner.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [duration] - The duration of the vibration, specified by the [VibratorDuration] enum.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setVibratorDuration(
      String deviceId, VibratorDuration duration) async {
    return sendCommand(deviceId, _vibratorDuration[duration]!);
  }

  /// Toggles the vibration when the scan button is pressed based on the [enabled] flag.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable or disable the vibration on button press.
  Future<CommandResponse> toggleVibrateOnScanButtonPress(String deviceId,
      {required bool enabled}) async {
    return sendCommand(deviceId,
        enabled ? enableVibratonOnButtonPress : disableVibratonOnButtonPress);
  }

  /// Tests the LED by setting the color temporarily (non-persistent).
  ///
  /// [deviceId] - The identifier of the target device.
  /// [color] - The [LEDColor] object that contains the red, green, and blue values.
  ///
  /// - Returns: A [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> testLED(String deviceId, LEDColor color) async {
    return sendCommand(deviceId, nonPersistentSetLED,
        parameters: color.toParameters());
  }

  /// Sets the LED color permanently (persistent).
  ///
  /// [deviceId] - The identifier of the target device.
  /// [color] - The [LEDColor] object that contains the red, green, and blue values.
  ///
  /// - Returns: A [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setLED(String deviceId, LEDColor color) async {
    return sendCommand(deviceId, persistentSetLED,
        parameters: color.toParameters());
  }

  /// Sets the good read LED duration on the scanner.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [duration] - The duration of the vibration, specified by the [VibratorDuration] enum.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setGoodReadLedDuration(
      String deviceId, GoodReadLedDuration duration) async {
    return sendCommand(deviceId, _goodReadLedDurationCommands[duration]!);
  }
}
