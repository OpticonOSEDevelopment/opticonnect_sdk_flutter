import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/scanner_settings/scanner_settings.dart';

class KoreanPostalAuthorityCodeSettings extends ScannerSettings {
  KoreanPostalAuthorityCodeSettings(super.sdk);

  Future<CommandResponse> enableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, koreanPostalTransmitCd);
  }

  Future<CommandResponse> disableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, koreanPostalDoNotTransmitCd);
  }

  Future<CommandResponse> transmitDash(String deviceId) async {
    return sendCommand(deviceId, koreanPostalTransmitDash);
  }

  Future<CommandResponse> doNotTransmitDash(String deviceId) async {
    return sendCommand(deviceId, koreanPostalDoNotTransmitDash);
  }
}
