import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/scanner_settings/scanner_settings.dart';

enum TelepenCodeMode {
  numericMode,
  asciiMode,
}

class TelepenSettings extends ScannerSettings {
  TelepenSettings(super.sdk);

  final Map<TelepenCodeMode, String> _telepenCodeModeCommands = {
    TelepenCodeMode.numericMode: telepenNumericMode,
    TelepenCodeMode.asciiMode: telepenASCIIMode,
  };

  Future<CommandResponse> setMode(
      String deviceId, TelepenCodeMode setting) async {
    return sendCommand(deviceId, _telepenCodeModeCommands[setting]!);
  }
}
