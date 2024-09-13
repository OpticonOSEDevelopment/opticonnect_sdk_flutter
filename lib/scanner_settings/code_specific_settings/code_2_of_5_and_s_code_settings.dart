import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/scanner_settings/scanner_settings.dart';

class Code2Of5AndSCodeSettings extends ScannerSettings {
  Code2Of5AndSCodeSettings(super.sdk);

  Future<CommandResponse> enableCode2of5andSCodeCheckCD(String deviceId) async {
    return sendCommand(deviceId, twoOfFiveAndSCodeCheckCd);
  }

  Future<CommandResponse> disableCode2of5andSCodeCheckCD(
      String deviceId) async {
    return sendCommand(deviceId, twoOfFiveAndSCodeDoNotCheckCd);
  }

  Future<CommandResponse> enableCode2of5andSCodeTransmitCD(
      String deviceId) async {
    return sendCommand(deviceId, twoOfFiveAndSCodeTransmitCd);
  }

  Future<CommandResponse> disableCode2of5andSCodeTransmitCD(
      String deviceId) async {
    return sendCommand(deviceId, twoOfFiveAndSCodeDoNotTransmitCd);
  }
}
