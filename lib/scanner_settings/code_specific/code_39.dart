import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/settings_base.dart';

/// Enum representing the various modes available for Code 39 symbology.
enum Code39Mode {
  /// Normal mode for Code 39 symbology.
  normal,

  /// Full ASCII mode for Code 39 symbology.
  fullASCII,

  /// Full ASCII mode if possible for Code 39 symbology.
  fullASCIIIfPossible,

  /// IT pharmaceutical only mode for Code 39 symbology.
  itPharmaceuticalOnly,

  /// IT pharmaceutical if possible mode for Code 39 symbology.
  itPharmaceutialIfPossible,
}

/// A class representing settings for Code 39 symbology.
///
/// This class provides methods to configure the mode, check digit validation,
/// and transmission options for Code 39 symbology.
@lazySingleton
class Code39 extends SettingsBase {
  /// A map linking the modes to their respective command strings.
  final Map<Code39Mode, String> _modeCommands = {
    Code39Mode.normal: normalCode39,
    Code39Mode.fullASCII: fullASCIICode39,
    Code39Mode.fullASCIIIfPossible: fullASCIICode39IfPossible,
    Code39Mode.itPharmaceuticalOnly: itPharmaceuticalOnly,
    Code39Mode.itPharmaceutialIfPossible: itPharmaceuticalIfPossible,
  };

  /// Sets the mode for Code 39 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [mode] - The [Code39Mode] enum value representing the desired mode.
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setMode(String deviceId, Code39Mode mode) async {
    return sendCommand(deviceId, _modeCommands[mode]!);
  }

  /// Sets the check digit validation for Code 39 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the check digit validation.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setCheckCD(String deviceId,
      {required bool enabled}) async {
    final String command = enabled ? code39CheckCd : code39DoNotCheckCd;
    return sendCommand(deviceId, command);
  }

  /// Sets the transmission of the check digit for Code 39 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the transmission of the check digit.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setTransmitCD(String deviceId,
      {required bool enabled}) async {
    final String command = enabled ? code39TransmitCd : code39DoNotTransmitCd;
    return sendCommand(deviceId, command);
  }

  /// Sets the transmission of start/stop characters for Code 39 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the transmission of start/stop characters.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setTransmitSTSP(String deviceId,
      {required bool enabled}) async {
    final String command =
        enabled ? code39TransmitStSp : code39DoNotTransmitStSp;
    return sendCommand(deviceId, command);
  }

  /// Sets the concatenation mode for Code 39 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) concatenation.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setConcatenation(String deviceId,
      {required bool enabled}) async {
    final String command =
        enabled ? code39EnableConcatenation : code39DisableConcatenation;
    return sendCommand(deviceId, command);
  }

  /// Sets the transmission of the leading 'A' for IT Pharmaceutical mode in Code 39 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the transmission of the leading 'A'.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setTransmitLdAForItPharm(String deviceId,
      {required bool enabled}) async {
    final String command = enabled
        ? code39TransmitLeadingAForItPharm
        : code39DoNotTransmitLeadingAForItPharm;
    return sendCommand(deviceId, command);
  }

  /// Sets the minimum length for Code 39 symbology to 3 digits.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> setMinLength3Digits(String deviceId) async {
    return sendCommand(deviceId, code39MinLength3Digits);
  }

  /// Sets the minimum length for Code 39 symbology to 1 digit.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> setMinLength1Digit(String deviceId) async {
    return sendCommand(deviceId, code39MinLength1Digit);
  }
}
