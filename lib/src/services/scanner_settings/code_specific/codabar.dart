import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants.dart';
import 'package:opticonnect_sdk/entities.dart';
import 'package:opticonnect_sdk/enums.dart';
import 'package:opticonnect_sdk/interfaces.dart';
import 'package:opticonnect_sdk/src/interfaces/settings_base.dart';

/// Implementation for managing Codabar-specific settings on the scanner.
@LazySingleton(as: Codabar)
class CodabarImpl extends SettingsBase implements Codabar {
  /// A map linking the Codabar mode to the corresponding command strings.
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

  final Map<CodabarMinimumLength, String> _minLengthCommands = {
    CodabarMinimumLength.oneCharacter: codabarMinimumLengthOneChar,
    CodabarMinimumLength.threeCharacters: codabarMinimumLengthThreeChars,
    CodabarMinimumLength.fiveCharacters: codabarMinimumLengthFiveChars,
  };

  @override
  Future<CommandResponse> setMode(
      {required String deviceId, required CodabarMode mode}) async {
    return sendCommand(deviceId, _modeCommands[mode]!);
  }

  @override
  Future<CommandResponse> setCheckCD(
      {required String deviceId, required bool enabled}) async {
    final String command = enabled ? codabarCheckCd : codabarDoNotCheckCd;
    return sendCommand(deviceId, command);
  }

  @override
  Future<CommandResponse> setTransmitCD(
      {required String deviceId, required bool enabled}) async {
    final String command = enabled ? codabarTransmitCd : codabarDoNotTransmitCd;
    return sendCommand(deviceId, command);
  }

  @override
  Future<CommandResponse> setSpaceInsertion(
      {required String deviceId, required bool enabled}) async {
    final String command =
        enabled ? codabarEnableSpaceInsertion : codabarDisableSpaceInsertion;
    return sendCommand(deviceId, command);
  }

  @override
  Future<CommandResponse> setMinimumLength(
      {required String deviceId, required CodabarMinimumLength length}) async {
    return sendCommand(deviceId, _minLengthCommands[length]!);
  }

  @override
  Future<CommandResponse> setIntercharacterGapCheck(
      {required String deviceId, required bool enabled}) async {
    final String command = enabled
        ? codabarEnableIntercharacterGapCheck
        : codabarDisableIntercharacterGapCheck;
    return sendCommand(deviceId, command);
  }

  @override
  Future<CommandResponse> setStartStopTransmission(
      {required String deviceId,
      required CodabarStartStopTransmission transmission}) async {
    return sendCommand(deviceId, _startStopTransmissionCommands[transmission]!);
  }
}
