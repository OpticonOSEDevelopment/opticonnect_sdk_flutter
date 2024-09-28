import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/settings_base.dart';

/// A class representing settings for UK Plessey symbology.
///
/// This class provides methods to configure check digit transmission and space insertion for UK Plessey symbology.
@lazySingleton
class UKPlessey extends SettingsBase {
  /// Sets the transmission of check digits for UK Plessey symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the transmission of check digits.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setTransmitCDs(String deviceId,
      {required bool enabled}) async {
    final String command =
        enabled ? ukPlesseyTransmitCds : ukPlesseyDoNotTransmitCds;
    return sendCommand(deviceId, command);
  }

  /// Sets space insertion between characters for UK Plessey symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) space insertion.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setSpaceInsertion(String deviceId,
      {required bool enabled}) async {
    final String command = enabled
        ? ukPlesseyEnableSpaceInsertion
        : ukPlesseyDisableSpaceInsertion;
    return sendCommand(deviceId, command);
  }

  /// Sets the A to X conversion for UK Plessey symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the A to X conversion.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setAToXConversion(String deviceId,
      {required bool enabled}) async {
    final String command = enabled
        ? ukPlesseyEnableAtoXConversion
        : ukPlesseyDisableAtoXConversion;
    return sendCommand(deviceId, command);
  }
}
