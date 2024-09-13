import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/helpers/direct_input_keys_helper.dart';
import 'package:opticonnect_sdk/scanner_settings/scanner_settings.dart';
import 'package:opticonnect_sdk/src/injection/injection.config.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';

class VolumeSettings extends ScannerSettings {
  VolumeSettings(super.sdk);

  final _appLogger = getIt<AppLogger>();

  Future<CommandResponse> _handleVolumeCommand(
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

  Future<CommandResponse> testVolume(String deviceId, int volume) async {
    return _handleVolumeCommand(deviceId, volume, nonPersistentSetBuzzer);
  }

  Future<CommandResponse> setVolume(String deviceId, int volume) async {
    return _handleVolumeCommand(deviceId, volume, persistentSetBuzzer);
  }
}
