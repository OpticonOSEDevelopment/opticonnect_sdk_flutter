import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/scanner_settings/scanner_settings.dart';

class UKPlesseySettings extends ScannerSettings {
  UKPlesseySettings(super.sdk);

  Future<CommandResponse> enableTransmitCDs(String deviceId) async {
    return sendCommand(deviceId, ukPlesseyTransmitCds);
  }

  Future<CommandResponse> disableTransmitCDs(String deviceId) async {
    return sendCommand(deviceId, ukPlesseyDoNotTransmitCds);
  }

  Future<CommandResponse> enableSpaceInsertion(String deviceId) async {
    return sendCommand(deviceId, ukPlesseyEnableSpaceInsertion);
  }

  Future<CommandResponse> disableSpaceInsertion(String deviceId) async {
    return sendCommand(deviceId, ukPlesseyDisableSpaceInsertion);
  }
}
