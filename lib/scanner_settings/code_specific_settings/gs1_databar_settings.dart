import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/scanner_settings/scanner_settings.dart';

class GS1DatabarSettings extends ScannerSettings {
  GS1DatabarSettings(super.sdk);

  Future<CommandResponse> enableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, gs1DataBarTransmitCd);
  }

  Future<CommandResponse> disableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, gs1DataBarDoNotTransmitCd);
  }

  Future<CommandResponse> enableTransmitAI(String deviceId) async {
    return sendCommand(deviceId, gs1DataBarTransmitAI);
  }

  Future<CommandResponse> disableTransmitAI(String deviceId) async {
    return sendCommand(deviceId, gs1DataBarDoNotTransmitAI);
  }
}
