import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/scanner_settings/scanner_settings.dart';

enum MSIPlesseyCheckCDSettings {
  doNotCheckCD,
  check1CDMOD10,
  check2CDsMOD10MOD10,
  check2CDsMOD10MOD11,
  check2CDsMOD11MOD10,
  check2CDsMOD11MOD11,
}

enum MSIPlesseyCDTransmissionSettings {
  transmitCD1,
  transmitCD1AndCD2,
  doNotTransmitCD,
}

class MSIPlesseySettings extends ScannerSettings {
  MSIPlesseySettings(super.sdk);

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

  final Map<MSIPlesseyCDTransmissionSettings, String> _cdTransmissionCommands =
      {
    MSIPlesseyCDTransmissionSettings.transmitCD1: msiPlesseyTransmitCd1,
    MSIPlesseyCDTransmissionSettings.transmitCD1AndCD2:
        msiPlesseyTransmitCd1AndCd2,
    MSIPlesseyCDTransmissionSettings.doNotTransmitCD: msiPlesseyDoNotTransmitCd,
  };

  Future<CommandResponse> setCheckCD(
      String deviceId, MSIPlesseyCheckCDSettings setting) async {
    return sendCommand(deviceId, _checkCDCommands[setting]!);
  }

  Future<CommandResponse> setCDTransmission(
      String deviceId, MSIPlesseyCDTransmissionSettings setting) async {
    return sendCommand(deviceId, _cdTransmissionCommands[setting]!);
  }
}
