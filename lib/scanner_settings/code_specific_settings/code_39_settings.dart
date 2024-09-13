import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/scanner_settings/scanner_settings.dart';

enum Code39Mode {
  normal,
  fullASCII,
  fullASCIIIfPossible,
  itPharmaceuticalOnly,
  itPharmaceutialIfPossible,
}

class Code39Settings extends ScannerSettings {
  Code39Settings(super.sdk);

  final Map<Code39Mode, String> _modeCommands = {
    Code39Mode.normal: normalCode39,
    Code39Mode.fullASCII: fullASCIICode39,
    Code39Mode.fullASCIIIfPossible: fullASCIICode39IfPossible,
    Code39Mode.itPharmaceuticalOnly: itPharmaceuticalOnly,
    Code39Mode.itPharmaceutialIfPossible: itPharmaceuticalIfPossible,
  };

  Future<CommandResponse> setMode(String deviceId, Code39Mode mode) async {
    return sendCommand(deviceId, _modeCommands[mode]!);
  }

  Future<CommandResponse> enableCheckCD(String deviceId) async {
    return sendCommand(deviceId, code39CheckCd);
  }

  Future<CommandResponse> disableCheckCD(String deviceId) async {
    return sendCommand(deviceId, code39DoNotCheckCd);
  }

  Future<CommandResponse> enableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, code39TransmitCd);
  }

  Future<CommandResponse> disableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, code39DoNotTransmitCd);
  }

  Future<CommandResponse> enableTransmitSTSP(String deviceId) async {
    return sendCommand(deviceId, code39TransmitStSp);
  }

  Future<CommandResponse> disableTransmitSTSP(String deviceId) async {
    return sendCommand(deviceId, code39DoNotTransmitStSp);
  }

  Future<CommandResponse> enableConcatenation(String deviceId) async {
    return sendCommand(deviceId, code39EnableConcatenation);
  }

  Future<CommandResponse> disableConcatenation(String deviceId) async {
    return sendCommand(deviceId, code39DisableConcatenation);
  }
}
