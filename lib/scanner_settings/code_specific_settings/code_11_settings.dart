import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/scanner_settings/scanner_settings.dart';

enum Code11CheckCDSettings {
  doNotCheckCD,
  check1CD,
  check2CDs,
  check1CDOr2CDsAutomatically,
}

class Code11Settings extends ScannerSettings {
  Code11Settings(super.sdk);

  final Map<Code11CheckCDSettings, String> _checkCDCommands = {
    Code11CheckCDSettings.doNotCheckCD: code11DoNotCheckCd,
    Code11CheckCDSettings.check1CD: code11Check1Cd,
    Code11CheckCDSettings.check2CDs: code11Check2Cds,
    Code11CheckCDSettings.check1CDOr2CDsAutomatically: code11Check1Or2Cds,
  };

  Future<CommandResponse> setCheckCD(
      String deviceId, Code11CheckCDSettings setting) async {
    return sendCommand(deviceId, _checkCDCommands[setting]!);
  }

  Future<CommandResponse> enableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, code11TransmitCd);
  }

  Future<CommandResponse> disableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, code11DoNotTransmitCd);
  }
}
