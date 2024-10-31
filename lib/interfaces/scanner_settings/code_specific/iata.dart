import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/enums/scanner_settings/code_specific/iata.dart';

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
