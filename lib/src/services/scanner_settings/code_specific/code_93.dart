import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants.dart';
import 'package:opticonnect_sdk/entities.dart';
import 'package:opticonnect_sdk/interfaces.dart';
import 'package:opticonnect_sdk/src/interfaces/settings_base.dart';

/// Implementation for managing Code 93 symbology settings.
@LazySingleton(as: Code93)
class Code93Impl extends SettingsBase implements Code93 {
  @override
  Future<CommandResponse> setCheckCD({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command = enabled ? code93CheckCd : code93DoNotCheckCd;
    return sendCommand(deviceId, command);
  }

  @override
  Future<CommandResponse> setConcatenation({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command =
        enabled ? code93EnableConcatenation : code93DisableConcatenation;
    return sendCommand(deviceId, command);
  }
}
