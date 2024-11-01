import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/interfaces/scanner_settings/code_specific/korean_postal_authority';
import 'package:opticonnect_sdk/src/interfaces/settings_base.dart';

/// Implementation of [KoreanPostalAuthority] for settings related to Korean Postal Authority Code symbology.
///
/// Provides methods to manage check digit transmission, dash transmission,
/// scan orientation, and upside-down reading options.
@LazySingleton(as: KoreanPostalAuthority)
class KoreanPostalAuthorityImpl extends SettingsBase
    implements KoreanPostalAuthority {
  @override
  Future<CommandResponse> setTransmitCD({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command =
        enabled ? koreanPostalTransmitCd : koreanPostalDoNotTransmitCd;
    return sendCommand(deviceId, command);
  }

  @override
  Future<CommandResponse> setTransmitDash({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command =
        enabled ? koreanPostalTransmitDash : koreanPostalDoNotTransmitDash;
    return sendCommand(deviceId, command);
  }

  @override
  Future<CommandResponse> setKoreanPostalOrientation({
    required String deviceId,
    required bool setUpsideDown,
  }) async {
    final String command = setUpsideDown
        ? koreanPostalOrientationUpsideDown
        : koreanPostalOrientationNormal;
    return sendCommand(deviceId, command);
  }

  @override
  Future<CommandResponse> setUpsideDownReading({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command = enabled
        ? koreanPostalUpsideDownReadingEnabled
        : koreanPostalUpsideDownReadingDisabled;
    return sendCommand(deviceId, command);
  }
}
