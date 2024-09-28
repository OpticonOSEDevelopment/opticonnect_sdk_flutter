import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/settings_base.dart';

/// Enum representing the check digit validation settings for MSI Plessey symbology.
enum MSIPlesseyCheckCDSettings {
  doNotCheckCD,
  check1CDMOD10,
  check2CDsMOD10MOD10,
  check2CDsMOD10MOD11,
  check2CDsMOD11MOD10,
  check2CDsMOD11MOD11,
}

/// Enum representing the transmission settings for check digits in MSI Plessey symbology.
enum MSIPlesseyCDTransmissionSettings {
  transmitCD1,
  transmitCD1AndCD2,
  doNotTransmitCD,
}

/// A class representing settings for MSI Plessey symbology.
///
/// This class provides methods to configure check digit validation and transmission settings for MSI Plessey symbology.
@lazySingleton
class MSIPlessey extends SettingsBase {
  /// A map linking check digit settings to their corresponding commands.
  final Map<MSIPlesseyCheckCDSettings, String> _checkCDCommands = {
    MSIPlesseyCheckCDSettings.doNotCheckCD: msiPlesseyDoNotCheckCd,
    MSIPlesseyCheckCDSettings.check1CDMOD10: msiPlesseyCheck1CdMod10,
    MSIPlesseyCheckCDSettings.check2CDsMOD10MOD10:
        msiPlesseyCheck2CdsMod10Mod10,
    MSIPlesseyCheckCDSettings.check2CDsMOD10MOD11:
        msiPlesseyCheck2CdsMod10Mod11,
    MSIPlesseyCheckCDSettings.check2CDsMOD11MOD10:
        msiPlesseyCheck2CdsMod11Mod10,
    MSIPlesseyCheckCDSettings.check2CDsMOD11MOD11:
        msiPlesseyCheck2CdsMod11Mod11,
  };

  /// A map linking CD transmission settings to their corresponding commands.
  final Map<MSIPlesseyCDTransmissionSettings, String> _cdTransmissionCommands =
      {
    MSIPlesseyCDTransmissionSettings.transmitCD1: msiPlesseyTransmitCd1,
    MSIPlesseyCDTransmissionSettings.transmitCD1AndCD2:
        msiPlesseyTransmitCd1AndCd2,
    MSIPlesseyCDTransmissionSettings.doNotTransmitCD: msiPlesseyDoNotTransmitCd,
  };

  /// Sets the check digit validation mode for MSI Plessey symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [setting] - The desired check digit validation mode.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setCheckCD(
      String deviceId, MSIPlesseyCheckCDSettings setting) async {
    return sendCommand(deviceId, _checkCDCommands[setting]!);
  }

  /// Sets the check digit transmission mode for MSI Plessey symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [setting] - The desired check digit transmission mode.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setCDTransmission(
      String deviceId, MSIPlesseyCDTransmissionSettings setting) async {
    return sendCommand(deviceId, _cdTransmissionCommands[setting]!);
  }
}
