import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/settings_base.dart';

/// Enum representing the output mode for composite codes.
enum CompositeCodesOutputMode {
  /// Only 1D and 2D components are allowed in the output.
  only1DAnd2DComponentsAllowed,

  /// Only the 2D component is allowed in the output.
  only2DComponentAllowed,

  /// Only the 1D component is allowed in the output.
  only1DComponentAllowed,
}

/// A class representing settings for composite codes.
///
/// This class provides methods to configure the output mode, and manage settings for GS1 and EAN/UPC composite codes.
@lazySingleton
class CompositeCodes extends SettingsBase {
  /// A map linking the output modes to their corresponding commands.
  final Map<CompositeCodesOutputMode, String> _outputModeCommands = {
    CompositeCodesOutputMode.only1DAnd2DComponentsAllowed:
        compositeOutput1dAnd2dComponent,
    CompositeCodesOutputMode.only2DComponentAllowed: compositeOutput2dComponent,
    CompositeCodesOutputMode.only1DComponentAllowed: compositeOutput1dComponent,
  };

  /// Sets the output mode for composite codes.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [outputMode] - The [CompositeCodesOutputMode] enum value representing the desired output mode.
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setOutputMode(
      {required deviceId, required CompositeCodesOutputMode outputMode}) async {
    return sendCommand(deviceId, _outputModeCommands[outputMode]!);
  }

  /// Sets whether to ignore the link flag for composite codes.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to ignore (`true`) or not ignore (`false`) the link flag.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setIgnoreLinkFlag(
      {required deviceId, required bool enabled}) async {
    final String command =
        enabled ? compositeIgnoreLinkFlag : compositeDoNotIgnoreLinkFlag;
    return sendCommand(deviceId, command);
  }

  /// Sets the state for GS1 Databar and GS1-128 composite codes.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) GS1 composite codes.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setCompositeGS1DatabarGS1128(
      {required deviceId, required bool enabled}) async {
    final String command = enabled ? enableCompositeGs1 : disableCompositeGs1;
    return sendCommand(deviceId, command);
  }

  /// Sets the state for EAN/UPC composite codes.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) EAN/UPC composite codes.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setCompositeEANUPC(
      {required deviceId, required bool enabled}) async {
    final String command =
        enabled ? enableCompositeEanUpc : disableCompositeEanUpc;
    return sendCommand(deviceId, command);
  }
}
