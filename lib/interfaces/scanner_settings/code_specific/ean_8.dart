import 'package:opticonnect_sdk/entities/command_response.dart';

/// Interface for settings related to EAN-8 symbology.
///
/// Provides methods to enable or disable the transmission of check digits,
/// and to manage add-on settings for EAN-8 symbology.
abstract class EAN8 {
  /// Sets the transmission of the check digit for EAN-8 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the transmission of the check digit.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setTransmitCD({
    required String deviceId,
    required bool enabled,
  });

  /// Sets the 2-character add-on for EAN-8 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the 2-character add-on.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setAddOnPlus2({
    required String deviceId,
    required bool enabled,
  });

  /// Sets the 5-character add-on for EAN-8 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the 5-character add-on.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setAddOnPlus5({
    required String deviceId,
    required bool enabled,
  });
}
