import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/base_scanner_settings.dart';

/// A class representing settings for the Korean Postal Authority Code symbology.
///
/// This class provides methods to enable or disable the transmission of check digits,
/// and to manage the transmission of dashes in the barcode data.
class KoreanPostalAuthorityCodeSettings extends BaseScannerSettings {
  KoreanPostalAuthorityCodeSettings(super.sdk);

  /// Enables the transmission of the check digit for Korean Postal Authority Code symbology.
  Future<CommandResponse> enableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, koreanPostalTransmitCd);
  }

  /// Disables the transmission of the check digit for Korean Postal Authority Code symbology.
  Future<CommandResponse> disableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, koreanPostalDoNotTransmitCd);
  }

  /// Enables the transmission of dashes in the barcode data for Korean Postal Authority Code symbology.
  Future<CommandResponse> transmitDash(String deviceId) async {
    return sendCommand(deviceId, koreanPostalTransmitDash);
  }

  /// Disables the transmission of dashes in the barcode data for Korean Postal Authority Code symbology.
  Future<CommandResponse> doNotTransmitDash(String deviceId) async {
    return sendCommand(deviceId, koreanPostalDoNotTransmitDash);
  }
}
