import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/settings_base.dart';

/// A class representing settings for GS1 Databar symbology.
///
/// This class provides methods to manage the transmission of check digits and AI (Application Identifier) settings for GS1 Databar symbology.
@lazySingleton
class GS1Databar extends SettingsBase {
  /// Sets the transmission of the check digit for GS1 Databar symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the transmission of the check digit.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setTransmitCD(
      {required deviceId, required bool enabled}) async {
    final String command =
        enabled ? gs1DataBarTransmitCd : gs1DataBarDoNotTransmitCd;
    return sendCommand(deviceId, command);
  }

  /// Sets the transmission of the AI (Application Identifier) for GS1 Databar symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the transmission of the AI.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setTransmitAI(
      {required deviceId, required bool enabled}) async {
    final String command =
        enabled ? gs1DataBarTransmitAI : gs1DataBarDoNotTransmitAI;
    return sendCommand(deviceId, command);
  }
}
