part of 'package:opticonnect_sdk/interfaces.dart';

/// Interface for settings related to MSI Plessey symbology.
///
/// Provides methods to manage check digit validation and transmission settings.
abstract class MSIPlessey {
  Future<CommandResponse> setCheckCD({
    required String deviceId,
    required MSIPlesseyCheckCDSettings setting,
  });

  Future<CommandResponse> setCDTransmission({
    required String deviceId,
    required MSIPlesseyCDTransmissionSettings setting,
  });
}
