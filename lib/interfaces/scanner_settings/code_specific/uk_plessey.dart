import 'package:opticonnect_sdk/entities/command_response.dart';

/// Interface for settings related to UK Plessey symbology.
///
/// Provides methods to configure check digit transmission, space insertion, and
/// A to X conversion for UK Plessey symbology.
abstract class UKPlessey {
  Future<CommandResponse> setTransmitCDs({
    required String deviceId,
    required bool enabled,
  });

  Future<CommandResponse> setSpaceInsertion({
    required String deviceId,
    required bool enabled,
  });

  Future<CommandResponse> setAToXConversion({
    required String deviceId,
    required bool enabled,
  });
}
