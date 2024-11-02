part of 'package:opticonnect_sdk/interfaces/interfaces.dart';

/// Interface for managing settings related to Code 2 of 5 and S-Code symbologies.
///
/// Provides methods for configuring space checks, data length, and S-Code transmission.
abstract class Code2Of5AndSCode {
  /// Sets the space check mode for Industrial 2 of 5 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the space check.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setSpaceCheck(
      {required String deviceId, required bool enabled});

  /// Sets the transmission mode of S-Code as Interleaved 2 of 5.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to transmit (`true`) or not transmit (`false`) the S-Code as Interleaved 2 of 5.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setSCodeTransmissionAsInterleaved(
      {required String deviceId, required bool enabled});

  /// Sets the minimum data length for Code 2 of 5 and S-Code symbologies.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [dataLength] - The [DataLength] enum value representing the minimum data length.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setMinimumDataLength(
      {required String deviceId, required DataLength dataLength});
}
