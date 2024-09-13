import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/scanner_settings/scanner_settings.dart';

enum IATACheckCDSettings {
  doNetCheckCD,
  checkFCAndSNOnly,
  checkCPNFCAndSN,
  checkCPNACFCAndSN,
}

class IATASettings extends ScannerSettings {
  IATASettings(super.sdk);

  final Map<IATACheckCDSettings, String> _checkCDCommands = {
    IATACheckCDSettings.doNetCheckCD: iataDoNotCheckCd,
    IATACheckCDSettings.checkFCAndSNOnly: iataCheckFCAndSNOnly,
    IATACheckCDSettings.checkCPNFCAndSN: iataCheckCPNFCAndSN,
    IATACheckCDSettings.checkCPNACFCAndSN: iataCheckCPNACFCAndSN,
  };

  Future<CommandResponse> setCheckCD(
      String deviceId, IATACheckCDSettings setting) async {
    return sendCommand(deviceId, _checkCDCommands[setting]!);
  }

  Future<CommandResponse> enableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, iataTransmitCd);
  }

  Future<CommandResponse> disableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, iataDoNotTransmitCd);
  }
}
