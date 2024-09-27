import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/base_scanner_settings.dart';

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
class CompositeCodes extends BaseScannerSettings {
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
      String deviceId, CompositeCodesOutputMode outputMode) async {
    return sendCommand(deviceId, _outputModeCommands[outputMode]!);
  }

  /// Ignores the link flag for composite codes.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> ignoreLinkFlag(String deviceId) async {
    return sendCommand(deviceId, compositeIgnoreLinkFlag);
  }

  /// Disables ignoring the link flag for composite codes.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> doNotIgnoreLinkFlag(String deviceId) async {
    return sendCommand(deviceId, compositeDoNotIgnoreLinkFlag);
  }

  /// Enables GS1 Databar and GS1-128 composite codes.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableCompositeGS1DatabarGS1128(
      String deviceId) async {
    return sendCommand(deviceId, enableCompositeGs1);
  }

  /// Disables GS1 Databar and GS1-128 composite codes.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableCompositeGS1DatabarGS1128(
      String deviceId) async {
    return sendCommand(deviceId, disableCompositeGs1);
  }

  /// Enables EAN/UPC composite codes.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableCompositeEANUPC(String deviceId) async {
    return sendCommand(deviceId, enableCompositeEanUpc);
  }

  /// Disables EAN/UPC composite codes.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableCompositeEANUPC(String deviceId) async {
    return sendCommand(deviceId, disableCompositeEanUpc);
  }
}
