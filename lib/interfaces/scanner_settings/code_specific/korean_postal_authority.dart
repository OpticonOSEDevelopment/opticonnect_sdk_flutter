part of 'package:opticonnect_sdk/interfaces.dart';

/// Interface for settings related to Korean Postal Authority Code symbology.
///
/// Provides methods to manage check digit transmission, dash transmission,
/// scan orientation, and upside-down reading options.
abstract class KoreanPostalAuthority {
  Future<CommandResponse> setTransmitCD({
    required String deviceId,
    required bool enabled,
  });

  Future<CommandResponse> setTransmitDash({
    required String deviceId,
    required bool enabled,
  });

  Future<CommandResponse> setKoreanPostalOrientation({
    required String deviceId,
    required bool setUpsideDown,
  });

  Future<CommandResponse> setUpsideDownReading({
    required String deviceId,
    required bool enabled,
  });
}
