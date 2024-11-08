import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants.dart';
import 'package:opticonnect_sdk/entities.dart';
import 'package:opticonnect_sdk/enums.dart';
import 'package:opticonnect_sdk/interfaces.dart';
import 'package:opticonnect_sdk/src/interfaces/settings_base.dart';

/// Implementation for managing Code 11 symbology settings.
@LazySingleton(as: Code11)
class Code11Impl extends SettingsBase implements Code11 {
  /// A map linking the check digit settings to the corresponding command strings.
  final Map<Code11CheckCDSettings, String> _checkCDCommands = {
    Code11CheckCDSettings.doNotCheckCD: code11DoNotCheckCd,
    Code11CheckCDSettings.check1CD: code11Check1Cd,
    Code11CheckCDSettings.check2CDs: code11Check2Cds,
    Code11CheckCDSettings.check1CDOr2CDsAutomatically: code11Check1Or2Cds,
  };

  @override
  Future<CommandResponse> setCheckCD({
    required String deviceId,
    required Code11CheckCDSettings setting,
  }) async {
    return sendCommand(deviceId, _checkCDCommands[setting]!);
  }

  @override
  Future<CommandResponse> setTransmitCD({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command = enabled ? code11TransmitCd : code11DoNotTransmitCd;
    return sendCommand(deviceId, command);
  }
}
