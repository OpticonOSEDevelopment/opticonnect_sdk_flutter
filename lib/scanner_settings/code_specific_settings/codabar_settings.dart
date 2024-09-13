import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/scanner_settings/scanner_settings.dart';

enum CodabarMode {
  normal,
  abcCodeOnly,
  cxCodeOnly,
  codabarABCAndCX,
}

enum CodabarStartStopTransmission {
  doNotTransmitStartStop,
  startStopABCDABCD,
  startStopabcdabcd,
  startStopABCDTNxE,
  startStopabcdtnxe,
  startStopDC1DC2DC3DC4,
}

class CodabarSettings extends ScannerSettings {
  CodabarSettings(super.sdk);

  final Map<CodabarMode, String> _modeCommands = {
    CodabarMode.normal: codabarNormal,
    CodabarMode.abcCodeOnly: codabarABCCodeOnly,
    CodabarMode.cxCodeOnly: codabarCXCodeOnly,
    CodabarMode.codabarABCAndCX: codabarABCAndCX,
  };

  final Map<CodabarStartStopTransmission, String>
      _startStopTransmissionCommands = {
    CodabarStartStopTransmission.doNotTransmitStartStop:
        codabarDoNotTransmitStSp,
    CodabarStartStopTransmission.startStopABCDABCD: codabarStSpABCDABCD,
    CodabarStartStopTransmission.startStopabcdabcd: codabarStSpAbcdabcd,
    CodabarStartStopTransmission.startStopABCDTNxE: codabarStSpABCDTNE,
    CodabarStartStopTransmission.startStopabcdtnxe: codabarStSpAbcdTne,
    CodabarStartStopTransmission.startStopDC1DC2DC3DC4: codabarStSpDC1DC2DC3DC4,
  };

  Future<CommandResponse> setMode(String deviceId, CodabarMode mode) async {
    return sendCommand(deviceId, _modeCommands[mode]!);
  }

  Future<CommandResponse> enableCheckCD(String deviceId) async {
    return sendCommand(deviceId, codabarCheckCd);
  }

  Future<CommandResponse> disableCheckCD(String deviceId) async {
    return sendCommand(deviceId, codabarDoNotCheckCd);
  }

  Future<CommandResponse> enableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, codabarTransmitCd);
  }

  Future<CommandResponse> disableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, codabarDoNotTransmitCd);
  }

  Future<CommandResponse> setStartStopTransmission(
      String deviceId, CodabarStartStopTransmission transmission) async {
    return sendCommand(deviceId, _startStopTransmissionCommands[transmission]!);
  }

  Future<CommandResponse> enableSpaceInsertion(String deviceId) async {
    return sendCommand(deviceId, codabarEnableSpaceInsertion);
  }

  Future<CommandResponse> disableSpaceInsertion(String deviceId) async {
    return sendCommand(deviceId, codabarDisableSpaceInsertion);
  }
}
