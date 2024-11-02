part of 'package:opticonnect_sdk/interfaces/interfaces.dart';

/// Interface for managing Code 93 symbology settings.
///
/// Provides methods for enabling or disabling check digit validation
/// and concatenation options for Code 93.
abstract class Code93 {
  /// Sets the check digit validation for Code 93 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the check digit validation.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setCheckCD({
    required String deviceId,
    required bool enabled,
  });

  /// Sets the concatenation mode for Code 93 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) concatenation.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setConcatenation({
    required String deviceId,
    required bool enabled,
  });
}
