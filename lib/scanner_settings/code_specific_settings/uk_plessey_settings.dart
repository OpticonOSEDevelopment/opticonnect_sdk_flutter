import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/base_scanner_settings.dart';

/// A class representing settings for UK Plessey symbology.
///
/// This class provides methods to configure check digit transmission and space insertion for UK Plessey symbology.
class UKPlesseySettings extends BaseScannerSettings {
  UKPlesseySettings(super.sdk);

  /// Enables the transmission of check digits for UK Plessey symbology.
  Future<CommandResponse> enableTransmitCDs(String deviceId) async {
    return sendCommand(deviceId, ukPlesseyTransmitCds);
  }

  /// Disables the transmission of check digits for UK Plessey symbology.
  Future<CommandResponse> disableTransmitCDs(String deviceId) async {
    return sendCommand(deviceId, ukPlesseyDoNotTransmitCds);
  }

  /// Enables space insertion between characters for UK Plessey symbology.
  Future<CommandResponse> enableSpaceInsertion(String deviceId) async {
    return sendCommand(deviceId, ukPlesseyEnableSpaceInsertion);
  }

  /// Disables space insertion between characters for UK Plessey symbology.
  Future<CommandResponse> disableSpaceInsertion(String deviceId) async {
    return sendCommand(deviceId, ukPlesseyDisableSpaceInsertion);
  }
}
