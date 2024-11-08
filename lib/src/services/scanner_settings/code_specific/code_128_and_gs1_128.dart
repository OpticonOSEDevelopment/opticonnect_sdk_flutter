import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants.dart';
import 'package:opticonnect_sdk/entities.dart';
import 'package:opticonnect_sdk/enums.dart';
import 'package:opticonnect_sdk/interfaces.dart';
import 'package:opticonnect_sdk/src/interfaces/settings_base.dart';

/// Implementation for managing settings for Code 128 and GS1-128 symbologies.
@LazySingleton(as: Code128AndGS1128)
class Code128AndGS1128Impl extends SettingsBase implements Code128AndGS1128 {
  final Map<Code128GS1128Mode, String> _modeCommands = {
    Code128GS1128Mode.disableGS1128: code128DisableGS1_128,
    Code128GS1128Mode.enableGS1128Only: code128EnableGS1_128Only,
    Code128GS1128Mode.enableGS1128IfPossible: code128EnableGS1_128IfPossible,
  };

  final Map<GS1128ConversionMode, String> _gs1ConversionCommands = {
    GS1128ConversionMode.disableConversion: code128DisableGS1_128Conversion,
    GS1128ConversionMode.enableMode1: code128EnableGS1_128ConversionMode1,
    GS1128ConversionMode.enableMode2: code128EnableGS1_128ConversionMode2,
    GS1128ConversionMode.enableMode3: code128EnableGS1_128ConversionMode3,
    GS1128ConversionMode.enableMode4: code128EnableGS1_128ConversionMode4,
  };

  @override
  Future<CommandResponse> setGS1128Mode({
    required String deviceId,
    required Code128GS1128Mode mode,
  }) async {
    return sendCommand(deviceId, _modeCommands[mode]!);
  }

  @override
  Future<CommandResponse> setGS1128ConversionMode({
    required String deviceId,
    required GS1128ConversionMode mode,
  }) async {
    return sendCommand(deviceId, _gs1ConversionCommands[mode]!);
  }

  @override
  Future<CommandResponse> setConcatenation({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command =
        enabled ? code128EnableConcatenation : code128DisableConcatenation;
    return sendCommand(deviceId, command);
  }

  @override
  Future<CommandResponse> setLeadingC1Output({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command =
        enabled ? code128EnableLeadingC1Output : code128DisableLeadingC1Output;
    return sendCommand(deviceId, command);
  }
}
