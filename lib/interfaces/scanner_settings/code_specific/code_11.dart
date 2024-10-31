import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/enums/scanner_settings/code_specific/code_11.dart';

/// Interface for managing settings related to Code 11 symbology.
///
/// Provides methods for configuring check digit validation and transmission settings.
abstract class Code11 {
  /// Sets the check digit validation mode for Code 11 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [setting] - The [Code11CheckCDSettings] enum value representing the desired setting.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setCheckCD({
    required String deviceId,
    required Code11CheckCDSettings setting,
  });

  /// Sets the transmission state of the check digit for Code 11 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the transmission of the check digit.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> setTransmitCD({
    required String deviceId,
    required bool enabled,
  });
}
