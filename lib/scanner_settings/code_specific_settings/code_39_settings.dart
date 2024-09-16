import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/base_scanner_settings.dart';

/// Enum representing the various modes available for Code 39 symbology.
enum Code39Mode {
  normal,
  fullASCII,
  fullASCIIIfPossible,
  itPharmaceuticalOnly,
  itPharmaceutialIfPossible,
}

/// A class representing settings for Code 39 symbology.
///
/// This class provides methods to configure the mode, check digit validation,
/// and transmission options for Code 39 symbology.
class Code39Settings extends BaseScannerSettings {
  Code39Settings(super.sdk);

  /// A map linking the modes to their respective command strings.
  final Map<Code39Mode, String> _modeCommands = {
    Code39Mode.normal: normalCode39,
    Code39Mode.fullASCII: fullASCIICode39,
    Code39Mode.fullASCIIIfPossible: fullASCIICode39IfPossible,
    Code39Mode.itPharmaceuticalOnly: itPharmaceuticalOnly,
    Code39Mode.itPharmaceutialIfPossible: itPharmaceuticalIfPossible,
  };

  /// Sets the mode for Code 39 symbology.
  Future<CommandResponse> setMode(String deviceId, Code39Mode mode) async {
    return sendCommand(deviceId, _modeCommands[mode]!);
  }

  /// Enables check digit validation for Code 39 symbology.
  Future<CommandResponse> enableCheckCD(String deviceId) async {
    return sendCommand(deviceId, code39CheckCd);
  }

  /// Disables check digit validation for Code 39 symbology.
  Future<CommandResponse> disableCheckCD(String deviceId) async {
    return sendCommand(deviceId, code39DoNotCheckCd);
  }

  /// Enables the transmission of the check digit for Code 39 symbology.
  Future<CommandResponse> enableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, code39TransmitCd);
  }

  /// Disables the transmission of the check digit for Code 39 symbology.
  Future<CommandResponse> disableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, code39DoNotTransmitCd);
  }

  /// Enables the transmission of start/stop characters for Code 39 symbology.
  Future<CommandResponse> enableTransmitSTSP(String deviceId) async {
    return sendCommand(deviceId, code39TransmitStSp);
  }

  /// Disables the transmission of start/stop characters for Code 39 symbology.
  Future<CommandResponse> disableTransmitSTSP(String deviceId) async {
    return sendCommand(deviceId, code39DoNotTransmitStSp);
  }

  /// Enables concatenation for Code 39 symbology.
  Future<CommandResponse> enableConcatenation(String deviceId) async {
    return sendCommand(deviceId, code39EnableConcatenation);
  }

  /// Disables concatenation for Code 39 symbology.
  Future<CommandResponse> disableConcatenation(String deviceId) async {
    return sendCommand(deviceId, code39DisableConcatenation);
  }
}
