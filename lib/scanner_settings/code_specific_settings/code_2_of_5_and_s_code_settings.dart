import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/base_scanner_settings.dart';

/// A class representing settings for Code 2 of 5 and S-Code symbologies.
///
/// This class provides methods to enable or disable the check digit validation and
/// the transmission of the check digit for the respective symbologies.
class Code2Of5AndSCodeSettings extends BaseScannerSettings {
  Code2Of5AndSCodeSettings(super.sdk);

  /// Enables the check digit validation for Code 2 of 5 and S-Code symbologies.
  Future<CommandResponse> enableCode2of5andSCodeCheckCD(String deviceId) async {
    return sendCommand(deviceId, twoOfFiveAndSCodeCheckCd);
  }

  /// Disables the check digit validation for Code 2 of 5 and S-Code symbologies.
  Future<CommandResponse> disableCode2of5andSCodeCheckCD(
      String deviceId) async {
    return sendCommand(deviceId, twoOfFiveAndSCodeDoNotCheckCd);
  }

  /// Enables the transmission of the check digit for Code 2 of 5 and S-Code symbologies.
  Future<CommandResponse> enableCode2of5andSCodeTransmitCD(
      String deviceId) async {
    return sendCommand(deviceId, twoOfFiveAndSCodeTransmitCd);
  }

  /// Disables the transmission of the check digit for Code 2 of 5 and S-Code symbologies.
  Future<CommandResponse> disableCode2of5andSCodeTransmitCD(
      String deviceId) async {
    return sendCommand(deviceId, twoOfFiveAndSCodeDoNotTransmitCd);
  }
}
