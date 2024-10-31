import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/enums/scanner_settings/code_specific/composite_codes.dart';
import 'package:opticonnect_sdk/interfaces/scanner_settings/code_specific/composite_codes.dart';
import 'package:opticonnect_sdk/src/interfaces/settings_base.dart';

/// Implementation for settings related to composite codes.
///
/// This implementation provides methods to configure the output mode and manage settings for GS1 and EAN/UPC composite codes.
@LazySingleton(as: CompositeCodes)
class CompositeCodesImpl extends SettingsBase implements CompositeCodes {
  /// A map linking the output modes to their corresponding commands.
  final Map<CompositeCodesOutputMode, String> _outputModeCommands = {
    CompositeCodesOutputMode.only1DAnd2DComponentsAllowed:
        compositeOutput1dAnd2dComponent,
    CompositeCodesOutputMode.only2DComponentAllowed: compositeOutput2dComponent,
    CompositeCodesOutputMode.only1DComponentAllowed: compositeOutput1dComponent,
  };

  @override
  Future<CommandResponse> setOutputMode({
    required String deviceId,
    required CompositeCodesOutputMode outputMode,
  }) async {
    return sendCommand(deviceId, _outputModeCommands[outputMode]!);
  }

  @override
  Future<CommandResponse> setIgnoreLinkFlag({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command =
        enabled ? compositeIgnoreLinkFlag : compositeDoNotIgnoreLinkFlag;
    return sendCommand(deviceId, command);
  }

  @override
  Future<CommandResponse> setCompositeGS1DatabarGS1128({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command = enabled ? enableCompositeGs1 : disableCompositeGs1;
    return sendCommand(deviceId, command);
  }

  @override
  Future<CommandResponse> setCompositeEANUPC({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command =
        enabled ? enableCompositeEanUpc : disableCompositeEanUpc;
    return sendCommand(deviceId, command);
  }
}
