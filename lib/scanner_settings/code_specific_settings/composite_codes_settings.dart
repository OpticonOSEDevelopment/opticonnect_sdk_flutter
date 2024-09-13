import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/scanner_settings/scanner_settings.dart';

enum CompositeCodesOutputMode {
  only1DAnd2DComponentsAllowed,
  only2DComponentAllowed,
  only1DComponentAllowed,
}

class CompositeCodesSettings extends ScannerSettings {
  CompositeCodesSettings(super.sdk);

  final Map<CompositeCodesOutputMode, String> _outputModeCommands = {
    CompositeCodesOutputMode.only1DAnd2DComponentsAllowed:
        compositeOutput1dAnd2dComponent,
    CompositeCodesOutputMode.only2DComponentAllowed: compositeOutput2dComponent,
    CompositeCodesOutputMode.only1DComponentAllowed: compositeOutput1dComponent,
  };

  Future<CommandResponse> setOutputMode(
      String deviceId, CompositeCodesOutputMode outputMode) async {
    return sendCommand(deviceId, _outputModeCommands[outputMode]!);
  }

  Future<CommandResponse> ignoreLinkFlag(String deviceId) async {
    return sendCommand(deviceId, compositeIgnoreLinkFlag);
  }

  Future<CommandResponse> doNotIgnoreLinkFlag(String deviceId) async {
    return sendCommand(deviceId, compositeDoNotIgnoreLinkFlag);
  }

  Future<CommandResponse> enableCompositeGS1DatabarGS1128(
      String deviceId) async {
    return sendCommand(deviceId, enableCompositeGs1);
  }

  Future<CommandResponse> disableCompositeGS1DatabarGS1128(
      String deviceId) async {
    return sendCommand(deviceId, disableCompositeGs1);
  }

  Future<CommandResponse> enableCompositeEANUPC(String deviceId) async {
    return sendCommand(deviceId, enableCompositeEanUpc);
  }

  Future<CommandResponse> disableCompositeEANUPC(String deviceId) async {
    return sendCommand(deviceId, disableCompositeEanUpc);
  }
}
