import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/base_scanner_settings.dart';

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

/// Class for managing Codabar-specific settings on the scanner.
///
/// This class provides methods for configuring Codabar-related settings
/// such as enabling or disabling check digits, transmitting start and stop characters,
/// and setting the Codabar mode.
///
/// It is recommended to use this class through the `ScannerSettings` API of the `OptiConnectSDK`.
class CodabarSettings extends BaseScannerSettings {
  CodabarSettings(super.sdk);

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

  /// Sets the Codabar mode for the scanner.
  ///
  /// The [deviceId] specifies the BLE device to configure, and [mode] specifies the Codabar mode to set.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> setMode(String deviceId, CodabarMode mode) async {
    return sendCommand(deviceId, _modeCommands[mode]!);
  }

  /// Enables the check digit for Codabar symbology.
  ///
  /// The [deviceId] specifies the BLE device to configure.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> enableCheckCD(String deviceId) async {
    return sendCommand(deviceId, codabarCheckCd);
  }

  /// Disables the check digit for Codabar symbology.
  ///
  /// The [deviceId] specifies the BLE device to configure.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> disableCheckCD(String deviceId) async {
    return sendCommand(deviceId, codabarDoNotCheckCd);
  }

  /// Enables the transmission of the check digit for Codabar symbology.
  ///
  /// The [deviceId] specifies the BLE device to configure.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> enableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, codabarTransmitCd);
  }

  /// Disables the transmission of the check digit for Codabar symbology.
  ///
  /// The [deviceId] specifies the BLE device to configure.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> disableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, codabarDoNotTransmitCd);
  }

  /// Sets the start and stop character transmission mode for Codabar symbology.
  ///
  /// The [deviceId] specifies the BLE device to configure, and [transmission] specifies the start and stop character transmission mode.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> setStartStopTransmission(
      String deviceId, CodabarStartStopTransmission transmission) async {
    return sendCommand(deviceId, _startStopTransmissionCommands[transmission]!);
  }

  /// Enables space insertion between characters in Codabar symbology.
  ///
  /// The [deviceId] specifies the BLE device to configure.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> enableSpaceInsertion(String deviceId) async {
    return sendCommand(deviceId, codabarEnableSpaceInsertion);
  }

  /// Disables space insertion between characters in Codabar symbology.
  ///
  /// The [deviceId] specifies the BLE device to configure.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> disableSpaceInsertion(String deviceId) async {
    return sendCommand(deviceId, codabarDisableSpaceInsertion);
  }
}
