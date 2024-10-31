import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/interfaces/scanner_settings/code_specific/gs1_databar.dart';
import 'package:opticonnect_sdk/src/interfaces/settings_base.dart';

/// Implementation of the [GS1Databar] interface for settings related to GS1 Databar symbology.
///
/// This class provides methods to manage the transmission of check digits and AI (Application Identifier) settings for GS1 Databar symbology.
@LazySingleton(as: GS1Databar)
class GS1DatabarImpl extends SettingsBase implements GS1Databar {
  @override
  Future<CommandResponse> setTransmitCD({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command =
        enabled ? gs1DataBarTransmitCd : gs1DataBarDoNotTransmitCd;
    return sendCommand(deviceId, command);
  }

  @override
  Future<CommandResponse> setTransmitAI({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command =
        enabled ? gs1DataBarTransmitAI : gs1DataBarDoNotTransmitAI;
    return sendCommand(deviceId, command);
  }
}
