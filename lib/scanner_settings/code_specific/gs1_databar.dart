import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/settings_base.dart';

/// A class representing settings for GS1 Databar symbology.
///
/// This class provides methods to manage the transmission of check digits and AI (Application Identifier) settings for GS1 Databar symbology.
@lazySingleton
class GS1Databar extends SettingsBase {
  /// Enables the transmission of the check digit for GS1 Databar symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, gs1DataBarTransmitCd);
  }

  /// Disables the transmission of the check digit for GS1 Databar symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, gs1DataBarDoNotTransmitCd);
  }

  /// Enables the transmission of the AI (Application Identifier) for GS1 Databar symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableTransmitAI(String deviceId) async {
    return sendCommand(deviceId, gs1DataBarTransmitAI);
  }

  /// Disables the transmission of the AI (Application Identifier) for GS1 Databar symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableTransmitAI(String deviceId) async {
    return sendCommand(deviceId, gs1DataBarDoNotTransmitAI);
  }
}
