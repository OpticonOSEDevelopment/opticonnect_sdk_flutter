import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/base_scanner_settings.dart';

class EAN13Settings extends BaseScannerSettings {
  EAN13Settings(super.sdk);

  Future<CommandResponse> enableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, ean13TransmitCd);
  }

  Future<CommandResponse> disableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, ean13DoNotTransmitCd);
  }

  Future<CommandResponse> enableAddOnPlus2(String deviceId) async {
    return sendCommand(deviceId, ean13EnableAddon2);
  }

  Future<CommandResponse> disableAddOnPlus2(String deviceId) async {
    return sendCommand(deviceId, ean13DisableAddon2);
  }

  Future<CommandResponse> enableAddOnPlus5(String deviceId) async {
    return sendCommand(deviceId, ean13EnableAddon5);
  }

  Future<CommandResponse> disableAddOnPlus5(String deviceId) async {
    return sendCommand(deviceId, ean13DisableAddon5);
  }
}
