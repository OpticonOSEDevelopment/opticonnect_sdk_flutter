import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/enums/scanner_settings/code_specific/composite_codes.dart';

/// Interface for settings related to composite codes.
///
/// Provides methods to configure output mode and manage settings for GS1 and EAN/UPC composite codes.
abstract class CompositeCodes {
  /// Sets the output mode for composite codes.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [outputMode] - The [CompositeCodesOutputMode] enum value representing the desired output mode.
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setOutputMode({
    required String deviceId,
    required CompositeCodesOutputMode outputMode,
  });

  /// Sets whether to ignore the link flag for composite codes.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to ignore (`true`) or not ignore (`false`) the link flag.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setIgnoreLinkFlag({
    required String deviceId,
    required bool enabled,
  });

  /// Sets the state for GS1 Databar and GS1-128 composite codes.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) GS1 composite codes.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setCompositeGS1DatabarGS1128({
    required String deviceId,
    required bool enabled,
  });

  /// Sets the state for EAN/UPC composite codes.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) EAN/UPC composite codes.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setCompositeEANUPC({
    required String deviceId,
    required bool enabled,
  });
}
