import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/settings_base.dart';

/// A class representing settings for Code 93 symbology.
///
/// This class provides methods to enable or disable check digit validation,
/// transmission of check digits, and concatenation for Code 93 symbology.
@lazySingleton
class Code93 extends SettingsBase {
  /// Enables check digit validation for Code 93 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableCheckCD(String deviceId) async {
    return sendCommand(deviceId, code93CheckCd);
  }

  /// Disables check digit validation for Code 93 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableCheckCD(String deviceId) async {
    return sendCommand(deviceId, code93DoNotCheckCd);
  }

  /// Enables concatenation for Code 93 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableConcatenation(String deviceId) async {
    return sendCommand(deviceId, code93EnableConcatenation);
  }

  /// Disables concatenation for Code 93 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableConcatenation(String deviceId) async {
    return sendCommand(deviceId, code93DisableConcatenation);
  }
}
