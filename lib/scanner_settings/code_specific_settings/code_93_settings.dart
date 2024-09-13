import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/scanner_settings/scanner_settings.dart';

class Code93Settings extends ScannerSettings {
  Code93Settings(super.sdk);

  Future<CommandResponse> enableCheckCD(String deviceId) async {
    return sendCommand(deviceId, code93CheckCd);
  }

  Future<CommandResponse> disableCheckCD(String deviceId) async {
    return sendCommand(deviceId, code93DoNotCheckCd);
  }

  Future<CommandResponse> enableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, code93TransmitCd);
  }

  Future<CommandResponse> disableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, code93DoNotTransmitCd);
  }

  Future<CommandResponse> enableConcatenation(String deviceId) async {
    return sendCommand(deviceId, code93EnableConcatenation);
  }

  Future<CommandResponse> disableConcatenation(String deviceId) async {
    return sendCommand(deviceId, code93DisableConcatenation);
  }
}
