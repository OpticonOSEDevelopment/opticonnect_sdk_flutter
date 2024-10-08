import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/settings_base.dart';

/// Enum representing the check digit validation settings for Code 11 symbology.
enum Code11CheckCDSettings {
  doNotCheckCD,
  check1CD,
  check2CDs,
  check1CDOr2CDsAutomatically,
}

/// A class representing settings for Code 11 symbology.
///
/// This class provides methods to configure check digit validation and transmission
/// settings for Code 11 symbology.
@lazySingleton
class Code11 extends SettingsBase {
  /// A map linking the check digit settings to the corresponding command strings.
  final Map<Code11CheckCDSettings, String> _checkCDCommands = {
    Code11CheckCDSettings.doNotCheckCD: code11DoNotCheckCd,
    Code11CheckCDSettings.check1CD: code11Check1Cd,
    Code11CheckCDSettings.check2CDs: code11Check2Cds,
    Code11CheckCDSettings.check1CDOr2CDsAutomatically: code11Check1Or2Cds,
  };

  /// Sets the check digit validation mode for Code 11 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [setting] - The [Code11CheckCDSettings] enum value representing the desired setting.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setCheckCD(
      {required deviceId, required Code11CheckCDSettings setting}) async {
    return sendCommand(deviceId, _checkCDCommands[setting]!);
  }

  /// Sets the transmission state of the check digit for Code 11 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the transmission of the check digit.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> setTransmitCD(
      {required deviceId, required bool enabled}) async {
    final String command = enabled ? code11TransmitCd : code11DoNotTransmitCd;
    return sendCommand(deviceId, command);
  }
}
