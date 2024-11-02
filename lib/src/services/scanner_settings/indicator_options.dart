import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/constants.dart';
import 'package:opticonnect_sdk/entities/entities.dart';
import 'package:opticonnect_sdk/enums/enums.dart';
import 'package:opticonnect_sdk/helpers/direct_input_keys_helper.dart';
import 'package:opticonnect_sdk/interfaces/interfaces.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/interfaces/settings_base.dart';

@LazySingleton(as: IndicatorOptions)
class IndicatorOptionsImpl extends SettingsBase implements IndicatorOptions {
  final AppLogger _appLogger;

  IndicatorOptionsImpl(this._appLogger);

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

  Future<CommandResponse> _handleBuzzerVolumeCommand(
      String deviceId, int volume, String command) async {
    if (volume < 0 || volume > 100) {
      const msg = 'Volume must be between 0 and 100.';
      _appLogger.warning(msg);
      return CommandResponse.failed(msg);
    }
    final volumeInDirectInputKeys =
        DirectInputKeysHelper.convertIntToDirectInputKeys(volume);
    return sendCommand(deviceId, command,
        parameters: volumeInDirectInputKeys, sendFeedback: false);
  }

  @override
  Future<CommandResponse> toggleBuzzer(
      {required String deviceId, required bool enabled}) async {
    return sendCommand(deviceId, enabled ? buzzerEnabled : buzzerDisabled);
  }

  @override
  Future<CommandResponse> testBuzzerVolume(
      {required String deviceId, required int volume}) async {
    return _handleBuzzerVolumeCommand(deviceId, volume, nonPersistentSetBuzzer);
  }

  @override
  Future<CommandResponse> setBuzzerVolume(
      {required String deviceId, required int volume}) async {
    return _handleBuzzerVolumeCommand(deviceId, volume, persistentSetBuzzer);
  }

  @override
  Future<CommandResponse> setBuzzerType(
      {required String deviceId, required BuzzerType type}) async {
    return sendCommand(deviceId, _buzzerTypeCommands[type]!);
  }

  @override
  Future<CommandResponse> setBuzzerDuration(
      {required String deviceId, required BuzzerDuration duration}) async {
    return sendCommand(deviceId, _buzzerDurationCommands[duration]!);
  }

  @override
  Future<CommandResponse> toggleBuzzerOnKeyclick(
      {required String deviceId, required bool enabled}) async {
    return sendCommand(
        deviceId, enabled ? buzzerOnKeyclickOn : buzzerOnKeyclickOff);
  }

  @override
  Future<CommandResponse> toggleBatteryChargingIndicator(
      {required String deviceId, required bool enabled}) async {
    return sendCommand(
        deviceId,
        enabled
            ? batteryChargingIndicatorEnabled
            : batteryChargingIndicatorDisabled);
  }

  @override
  Future<CommandResponse> toggleVibrator(
      {required String deviceId, required bool enabled}) async {
    return sendCommand(deviceId, enabled ? vibratorEnabled : vibratorDisabled);
  }

  @override
  Future<CommandResponse> setVibratorDuration(
      {required String deviceId, required VibratorDuration duration}) async {
    return sendCommand(deviceId, _vibratorDuration[duration]!);
  }

  @override
  Future<CommandResponse> toggleVibrateOnScanButtonPress(
      {required String deviceId, required bool enabled}) async {
    return sendCommand(deviceId,
        enabled ? enableVibratonOnButtonPress : disableVibratonOnButtonPress);
  }

  @override
  Future<CommandResponse> testLED(
      {required String deviceId, required LEDColor color}) async {
    return sendCommand(deviceId, nonPersistentSetLED,
        parameters: color.toParameters(), sendFeedback: false);
  }

  @override
  Future<CommandResponse> setLED(
      {required String deviceId, required LEDColor color}) async {
    return sendCommand(deviceId, persistentSetLED,
        parameters: color.toParameters(), sendFeedback: false);
  }

  @override
  Future<CommandResponse> setGoodReadLedDuration(
      {required String deviceId, required GoodReadLedDuration duration}) async {
    return sendCommand(deviceId, _goodReadLedDurationCommands[duration]!);
  }
}
