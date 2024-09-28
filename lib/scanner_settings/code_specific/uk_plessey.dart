import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/settings_base.dart';

/// A class representing settings for UK Plessey symbology.
///
/// This class provides methods to configure check digit transmission and space insertion for UK Plessey symbology.
@lazySingleton
class UKPlessey extends SettingsBase {
  /// Enables the transmission of check digits for UK Plessey symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableTransmitCDs(String deviceId) async {
    return sendCommand(deviceId, ukPlesseyTransmitCds);
  }

  /// Disables the transmission of check digits for UK Plessey symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableTransmitCDs(String deviceId) async {
    return sendCommand(deviceId, ukPlesseyDoNotTransmitCds);
  }

  /// Enables space insertion between characters for UK Plessey symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableSpaceInsertion(String deviceId) async {
    return sendCommand(deviceId, ukPlesseyEnableSpaceInsertion);
  }

  /// Disables space insertion between characters for UK Plessey symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableSpaceInsertion(String deviceId) async {
    return sendCommand(deviceId, ukPlesseyDisableSpaceInsertion);
  }

  /// Enables A to X conversion for UK Plessey symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableAToXConversion(String deviceId) async {
    return sendCommand(deviceId, ukPlesseyEnableAtoXConversion);
  }

  /// Disables A to X conversion for UK Plessey symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableAToXConversion(String deviceId) async {
    return sendCommand(deviceId, ukPlesseyDisableAtoXConversion);
  }
}
