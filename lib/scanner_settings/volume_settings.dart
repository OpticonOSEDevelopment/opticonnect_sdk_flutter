import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/helpers/direct_input_keys_helper.dart';
import 'package:opticonnect_sdk/src/injection/injection.config.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/scanner_settings/base_scanner_settings.dart';

/// A class responsible for controlling volume settings on the scanner.
class VolumeSettings extends BaseScannerSettings {
  /// Constructs a [VolumeSettings] instance, requiring the SDK to be passed to the base class.
  VolumeSettings(super.sdk);

  /// Logger for warnings and errors.
  final _appLogger = getIt<AppLogger>();

  /// Handles the volume command by validating the volume range and sending the command to the device.
  ///
  /// - [deviceId]: The ID of the BLE device.
  /// - [volume]: The volume value to be set, ranging from 0 to 100.
  /// - [command]: The command string representing either persistent or non-persistent volume settings.
  ///
  /// - Returns: A [CommandResponse] indicating the success or failure of the operation.
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

  /// Tests the volume by setting it temporarily (non-persistent).
  ///
  /// - [deviceId]: The ID of the BLE device.
  /// - [volume]: The volume value to be set, ranging from 0 to 100.
  ///
  /// - Returns: A [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> testVolume(String deviceId, int volume) async {
    return _handleVolumeCommand(deviceId, volume, nonPersistentSetBuzzer);
  }

  /// Sets the volume permanently (persistent).
  ///
  /// - [deviceId]: The ID of the BLE device.
  /// - [volume]: The volume value to be set, ranging from 0 to 100.
  ///
  /// - Returns: A [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setVolume(String deviceId, int volume) async {
    return _handleVolumeCommand(deviceId, volume, persistentSetBuzzer);
  }
}
