import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/base_scanner_settings.dart';

/// A class representing settings for Code 93 symbology.
///
/// This class provides methods to enable or disable check digit validation,
/// transmission of check digits, and concatenation for Code 93 symbology.
class Code93Settings extends BaseScannerSettings {
  Code93Settings(super.sdk);

  /// Enables check digit validation for Code 93 symbology.
  Future<CommandResponse> enableCheckCD(String deviceId) async {
    return sendCommand(deviceId, code93CheckCd);
  }

  /// Disables check digit validation for Code 93 symbology.
  Future<CommandResponse> disableCheckCD(String deviceId) async {
    return sendCommand(deviceId, code93DoNotCheckCd);
  }

  /// Enables the transmission of the check digit for Code 93 symbology.
  Future<CommandResponse> enableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, code93TransmitCd);
  }

  /// Disables the transmission of the check digit for Code 93 symbology.
  Future<CommandResponse> disableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, code93DoNotTransmitCd);
  }

  /// Enables concatenation for Code 93 symbology.
  Future<CommandResponse> enableConcatenation(String deviceId) async {
    return sendCommand(deviceId, code93EnableConcatenation);
  }

  /// Disables concatenation for Code 93 symbology.
  Future<CommandResponse> disableConcatenation(String deviceId) async {
    return sendCommand(deviceId, code93DisableConcatenation);
  }
}
