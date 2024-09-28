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
  /// Sets the check digit validation for Code 93 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the check digit validation.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setCheckCD(String deviceId,
      {required bool enabled}) async {
    final String command = enabled ? code93CheckCd : code93DoNotCheckCd;
    return sendCommand(deviceId, command);
  }

  /// Sets the concatenation mode for Code 93 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) concatenation.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setConcatenation(String deviceId,
      {required bool enabled}) async {
    final String command =
        enabled ? code93EnableConcatenation : code93DisableConcatenation;
    return sendCommand(deviceId, command);
  }
}
