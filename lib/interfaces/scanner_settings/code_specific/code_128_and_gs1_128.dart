import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/enums/scanner_settings/code_specific/code_128_and_gs1_128.dart';

/// Interface for managing settings for Code 128 and GS1-128 symbologies.
///
/// Provides methods for configuring GS1-128 mode, GS1-128 conversion mode,
/// concatenation, and leading ]C1 output options.
abstract class Code128AndGS1128 {
  /// Sets the mode for Code 128 and GS1-128 symbologies.
  ///
  /// [deviceId] is the identifier of the device.
  /// [mode] is the Code 128 GS1-128 mode to be set.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setGS1128Mode({
    required String deviceId,
    required Code128GS1128Mode mode,
  });

  /// Sets the conversion mode for GS1-128 symbology.
  ///
  /// [deviceId] is the identifier of the device.
  /// [mode] is the conversion mode to be set for GS1-128.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setGS1128ConversionMode({
    required String deviceId,
    required GS1128ConversionMode mode,
  });

  /// Sets the concatenation mode for Code 128 symbology.
  ///
  /// [deviceId] is the identifier of the device.
  /// [enabled] is a boolean indicating whether to enable (`true`) or disable (`false`) concatenation.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setConcatenation({
    required String deviceId,
    required bool enabled,
  });

  /// Sets the output mode for the leading ]C1 character in Code 128 symbology.
  ///
  /// [deviceId] is the identifier of the device.
  /// [enabled] is a boolean indicating whether to enable (`true`) or disable (`false`) the leading ]C1 output.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setLeadingC1Output({
    required String deviceId,
    required bool enabled,
  });
}
