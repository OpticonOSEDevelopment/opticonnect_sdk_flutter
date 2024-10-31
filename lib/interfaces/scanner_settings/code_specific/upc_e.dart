import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/enums/scanner_settings/code_specific/upc_e.dart';

/// Interface for UPCE symbology settings.
///
/// Provides methods to configure leading zero, check digit transmission settings,
/// conversion modes, and add-on support for UPCE symbology.
abstract class UPCE {
  Future<CommandResponse> setLeadingZeroAndTransmitCDMode({
    required String deviceId,
    required UPCELeadingZeroAndTransmitCDMode mode,
  });

  Future<CommandResponse> setConversionMode({
    required String deviceId,
    required UPCEConversionMode mode,
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
