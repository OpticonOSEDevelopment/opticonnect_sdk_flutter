import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/base_scanner_settings.dart';

/// A class representing settings for UPCE1 symbology.
///
/// This class provides methods to configure leading zero, check digit transmission settings,
/// conversion modes, and add-on support for UPCE1 symbology.
class UPCE1Settings extends BaseScannerSettings {
  UPCE1Settings(super.sdk);

  /// Enables the 2-character add-on for UPCE symbology.
  Future<CommandResponse> enableAddOnPlus2(String deviceId) async {
    return sendCommand(deviceId, enableUPCE1Plus2);
  }

  /// Disables the 2-character add-on for UPCE symbology.
  Future<CommandResponse> disableAddOnPlus2(String deviceId) async {
    return sendCommand(deviceId, disableUPCE1Plus2);
  }

  /// Enables the 5-character add-on for UPCE symbology.
  Future<CommandResponse> enableAddOnPlus5(String deviceId) async {
    return sendCommand(deviceId, enableUPCE1Plus5);
  }

  /// Disables the 5-character add-on for UPCE symbology.
  Future<CommandResponse> disableAddOnPlus5(String deviceId) async {
    return sendCommand(deviceId, disableUPCE1Plus5);
  }
}
