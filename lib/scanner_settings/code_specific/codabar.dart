import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/settings_base.dart';

/// Enum representing different modes for Codabar symbology.
enum CodabarMode {
  /// Normal Codabar mode.
  normal,

  /// Codabar mode with only ABC codes.
  abcCodeOnly,

  /// Codabar mode with only CX codes.
  cxCodeOnly,

  /// Codabar mode with both ABC and CX codes.
  codabarABCAndCX,
}

/// Enum representing the start and stop character transmission options for Codabar symbology.
enum CodabarStartStopTransmission {
  /// Do not transmit start and stop characters.
  doNotTransmitStartStop,

  /// Transmit start and stop characters in ABCD-ABCD format.
  startStopABCDABCD,

  /// Transmit start and stop characters in abcd-abcd format.
  startStopabcdabcd,

  /// Transmit start and stop characters in ABCD-TNxE format.
  startStopABCDTNxE,

  /// Transmit start and stop characters in abcd-tnxe format.
  startStopabcdtnxe,

  /// Transmit start and stop characters in DC1-DC2-DC3-DC4 format.
  startStopDC1DC2DC3DC4,
}

/// Enum representing the minimum data lengths for Codabar symbology.
enum CodabarMinimumLength {
  /// Minimum length of 1 character.
  oneCharacter,

  /// Minimum length of 3 characters.
  threeCharacters,

  /// Minimum length of 5 characters.
  fiveCharacters,
}

/// Class for managing Codabar-specific settings on the scanner.
///
/// This class provides methods for configuring Codabar-related settings
/// such as enabling or disabling check digits, transmitting start and stop characters,
/// and setting the Codabar mode.
///
/// It is recommended to use this class through the `ScannerSettings` API of the `OptiConnectSDK`.
@lazySingleton
class Codabar extends SettingsBase {
  /// A map linking the Codabar mode to the corresponding command strings.
  final Map<CodabarMode, String> _modeCommands = {
    CodabarMode.normal: codabarNormal,
    CodabarMode.abcCodeOnly: codabarABCCodeOnly,
    CodabarMode.cxCodeOnly: codabarCXCodeOnly,
    CodabarMode.codabarABCAndCX: codabarABCAndCX,
  };

  /// A map linking the start and stop character transmission options to the corresponding command strings.
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

  /// A map linking the minimum data length to their corresponding command strings.
  final Map<CodabarMinimumLength, String> _minLengthCommands = {
    CodabarMinimumLength.oneCharacter: codabarMinimumLengthOneChar,
    CodabarMinimumLength.threeCharacters: codabarMinimumLengthThreeChars,
    CodabarMinimumLength.fiveCharacters: codabarMinimumLengthFiveChars,
  };

  /// Sets the Codabar mode for the scanner.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [mode] - The Codabar mode to set.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> setMode(
      {required deviceId, required CodabarMode mode}) async {
    return sendCommand(deviceId, _modeCommands[mode]!);
  }

  /// Sets the check digit state for Codabar symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the check digit.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> setCheckCD(
      {required deviceId, required bool enabled}) async {
    final String command = enabled ? codabarCheckCd : codabarDoNotCheckCd;
    return sendCommand(deviceId, command);
  }

  /// Sets the transmission state of the check digit for Codabar symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the transmission of the check digit.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> setTransmitCD(
      {required deviceId, required bool enabled}) async {
    final String command = enabled ? codabarTransmitCd : codabarDoNotTransmitCd;
    return sendCommand(deviceId, command);
  }

  /// Sets the space insertion mode between characters in Codabar symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) space insertion.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> setSpaceInsertion(
      {required deviceId, required bool enabled}) async {
    final String command =
        enabled ? codabarEnableSpaceInsertion : codabarDisableSpaceInsertion;
    return sendCommand(deviceId, command);
  }

  /// Sets the minimum data length for Codabar symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [length] - The minimum data length to set.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> setMinimumLength(
      {required deviceId, required CodabarMinimumLength length}) async {
    return sendCommand(deviceId, _minLengthCommands[length]!);
  }

  /// Sets the intercharacter gap check mode for Codabar symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the intercharacter gap check.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> setIntercharacterGapCheck(
      {required deviceId, required bool enabled}) async {
    final String command = enabled
        ? codabarEnableIntercharacterGapCheck
        : codabarDisableIntercharacterGapCheck;
    return sendCommand(deviceId, command);
  }

  /// Sets the start and stop character transmission mode for Codabar symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [transmission] - The start and stop character transmission mode.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> setStartStopTransmission(
      {required deviceId,
      required CodabarStartStopTransmission transmission}) async {
    return sendCommand(deviceId, _startStopTransmissionCommands[transmission]!);
  }
}
