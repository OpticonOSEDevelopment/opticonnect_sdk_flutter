part of 'package:opticonnect_sdk/interfaces.dart';

/// Interface for managing settings related to Code 39 symbology.
///
/// Provides methods for configuring the mode, check digit validation, transmission options,
/// concatenation, and minimum length settings for Code 39.
abstract class Code39 {
  /// Sets the mode for Code 39 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [mode] - The [Code39Mode] enum value representing the desired mode.
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setMode({
    required String deviceId,
    required Code39Mode mode,
  });

  /// Sets the check digit validation for Code 39 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the check digit validation.
  Future<CommandResponse> setCheckCD({
    required String deviceId,
    required bool enabled,
  });

  /// Sets the transmission of the check digit for Code 39 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the transmission of the check digit.
  Future<CommandResponse> setTransmitCD({
    required String deviceId,
    required bool enabled,
  });

  /// Sets the transmission of start/stop characters for Code 39 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the transmission of start/stop characters.
  Future<CommandResponse> setTransmitSTSP({
    required String deviceId,
    required bool enabled,
  });

  /// Sets the concatenation mode for Code 39 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) concatenation.
  Future<CommandResponse> setConcatenation({
    required String deviceId,
    required bool enabled,
  });

  /// Sets the transmission of the leading 'A' for IT Pharmaceutical mode in Code 39 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the transmission of the leading 'A'.
  Future<CommandResponse> setTransmitLdAForItPharm({
    required String deviceId,
    required bool enabled,
  });

  /// Sets the minimum length for Code 39 symbology to 3 digits.
  ///
  /// [deviceId] - The identifier of the target device.
  Future<CommandResponse> setMinLength3Digits(String deviceId);

  /// Sets the minimum length for Code 39 symbology to 1 digit.
  ///
  /// [deviceId] - The identifier of the target device.
  Future<CommandResponse> setMinLength1Digit(String deviceId);
}
