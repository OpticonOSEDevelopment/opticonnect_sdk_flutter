import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants.dart';
import 'package:opticonnect_sdk/entities.dart';
import 'package:opticonnect_sdk/interfaces.dart';
import 'package:opticonnect_sdk/src/interfaces/settings_base.dart';

/// Implementation of [UKPlessey] for settings related to UK Plessey symbology.
///
/// Provides methods to configure check digit transmission, space insertion, and
/// A to X conversion for UK Plessey symbology.
@LazySingleton(as: UKPlessey)
class UKPlesseyImpl extends SettingsBase implements UKPlessey {
  @override
  Future<CommandResponse> setTransmitCDs({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command =
        enabled ? ukPlesseyTransmitCds : ukPlesseyDoNotTransmitCds;
    return sendCommand(deviceId, command);
  }

  @override
  Future<CommandResponse> setSpaceInsertion({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command = enabled
        ? ukPlesseyEnableSpaceInsertion
        : ukPlesseyDisableSpaceInsertion;
    return sendCommand(deviceId, command);
  }

  @override
  Future<CommandResponse> setAToXConversion({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command = enabled
        ? ukPlesseyEnableAtoXConversion
        : ukPlesseyDisableAtoXConversion;
    return sendCommand(deviceId, command);
  }
}
