part of 'package:opticonnect_sdk/interfaces.dart';

/// Interface for settings related to UPCA symbology.
///
/// Provides methods to configure leading zero and check digit transmission settings,
/// as well as add-on support for UPCA symbology.
abstract class UPCA {
  Future<CommandResponse> setLeadingZeroAndTransmitCDMode({
    required String deviceId,
    required UPCALeadingZeroAndTransmitCDMode mode,
  });

  Future<CommandResponse> setAddOnPlus2({
    required String deviceId,
    required bool enabled,
  });

  Future<CommandResponse> setAddOnPlus5({
    required String deviceId,
    required bool enabled,
  });
}
