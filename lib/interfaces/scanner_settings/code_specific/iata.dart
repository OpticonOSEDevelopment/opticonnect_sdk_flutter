part of 'package:opticonnect_sdk/interfaces/interfaces.dart';

/// Interface for settings related to IATA symbology.
///
/// Provides methods to configure the check digit validation mode
/// and manage the transmission of check digits for IATA symbology.
abstract class IATA {
  Future<CommandResponse> setCheckCD({
    required String deviceId,
    required IATACheckCDSettings setting,
  });

  Future<CommandResponse> setTransmitCD({
    required String deviceId,
    required bool enabled,
  });
}
