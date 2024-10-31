import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/enums/scanner_settings/code_specific/code_39.dart';
import 'package:opticonnect_sdk/interfaces/scanner_settings/code_specific/code_39.dart';
import 'package:opticonnect_sdk/src/interfaces/settings_base.dart';

/// Implementation for managing Code 39 symbology settings.
@LazySingleton(as: Code39)
class Code39Impl extends SettingsBase implements Code39 {
  /// A map linking the modes to their respective command strings.
  final Map<Code39Mode, String> _modeCommands = {
    Code39Mode.normal: normalCode39,
    Code39Mode.fullASCII: fullASCIICode39,
    Code39Mode.fullASCIIIfPossible: fullASCIICode39IfPossible,
    Code39Mode.itPharmaceuticalOnly: itPharmaceuticalOnly,
    Code39Mode.itPharmaceutialIfPossible: itPharmaceuticalIfPossible,
  };

  @override
  Future<CommandResponse> setMode({
    required String deviceId,
    required Code39Mode mode,
  }) async {
    return sendCommand(deviceId, _modeCommands[mode]!);
  }

  @override
  Future<CommandResponse> setCheckCD({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command = enabled ? code39CheckCd : code39DoNotCheckCd;
    return sendCommand(deviceId, command);
  }

  @override
  Future<CommandResponse> setTransmitCD({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command = enabled ? code39TransmitCd : code39DoNotTransmitCd;
    return sendCommand(deviceId, command);
  }

  @override
  Future<CommandResponse> setTransmitSTSP({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command =
        enabled ? code39TransmitStSp : code39DoNotTransmitStSp;
    return sendCommand(deviceId, command);
  }

  @override
  Future<CommandResponse> setConcatenation({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command =
        enabled ? code39EnableConcatenation : code39DisableConcatenation;
    return sendCommand(deviceId, command);
  }

  @override
  Future<CommandResponse> setTransmitLdAForItPharm({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command = enabled
        ? code39TransmitLeadingAForItPharm
        : code39DoNotTransmitLeadingAForItPharm;
    return sendCommand(deviceId, command);
  }

  @override
  Future<CommandResponse> setMinLength3Digits(String deviceId) async {
    return sendCommand(deviceId, code39MinLength3Digits);
  }

  @override
  Future<CommandResponse> setMinLength1Digit(String deviceId) async {
    return sendCommand(deviceId, code39MinLength1Digit);
  }
}
