import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/scanner_settings/scanner_settings.dart';

enum Code128Mode {
  disableGS1128,
  enableGS1128Only,
  enableGS1128IfPossible,
}

class Code128AndGS1128Settings extends ScannerSettings {
  Code128AndGS1128Settings(super.sdk);

  final Map<Code128Mode, String> _modeCommands = {
    Code128Mode.disableGS1128: code128DisableGS1_128,
    Code128Mode.enableGS1128Only: code128EnableGS1_128Only,
    Code128Mode.enableGS1128IfPossible: code128EnableGS1_128IfPossible,
  };

  Future<CommandResponse> setMode(String deviceId, Code128Mode mode) async {
    return sendCommand(deviceId, _modeCommands[mode]!);
  }

  Future<CommandResponse> enableConcatenation(String deviceId) async {
    return sendCommand(deviceId, code128EnableConcatenation);
  }

  Future<CommandResponse> disableConcatenation(String deviceId) async {
    return sendCommand(deviceId, code128DisableConcatenation);
  }
}
