import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/scanner_settings/scanner_settings.dart';

class EAN8Settings extends ScannerSettings {
  EAN8Settings(super.sdk);

  Future<CommandResponse> enableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, ean8TransmitCd);
  }

  Future<CommandResponse> disableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, ean8DoNotTransmitCd);
  }

  Future<CommandResponse> enableAddOnPlus2(String deviceId) async {
    return sendCommand(deviceId, ean8EnableAddon2);
  }

  Future<CommandResponse> disableAddOnPlus2(String deviceId) async {
    return sendCommand(deviceId, ean8DisableAddon2);
  }

  Future<CommandResponse> enableAddOnPlus5(String deviceId) async {
    return sendCommand(deviceId, ean8EnableAddon5);
  }

  Future<CommandResponse> disableAddOnPlus5(String deviceId) async {
    return sendCommand(deviceId, ean8DisableAddon5);
  }
}
