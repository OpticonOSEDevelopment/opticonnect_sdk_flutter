import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/enums/scanner_settings/code_specific/msi_plessey.dart';
import 'package:opticonnect_sdk/interfaces/scanner_settings/code_specific/msi_plessey.dart';
import 'package:opticonnect_sdk/src/interfaces/settings_base.dart';

/// Implementation of [MSIPlessey] for settings related to MSI Plessey symbology.
///
/// Provides methods to manage check digit validation and transmission settings.
@LazySingleton(as: MSIPlessey)
class MSIPlesseyImpl extends SettingsBase implements MSIPlessey {
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

  @override
  Future<CommandResponse> setCheckCD({
    required String deviceId,
    required MSIPlesseyCheckCDSettings setting,
  }) async {
    return sendCommand(deviceId, _checkCDCommands[setting]!);
  }

  @override
  Future<CommandResponse> setCDTransmission({
    required String deviceId,
    required MSIPlesseyCDTransmissionSettings setting,
  }) async {
    return sendCommand(deviceId, _cdTransmissionCommands[setting]!);
  }
}
