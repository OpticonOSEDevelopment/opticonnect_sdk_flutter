import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/base_scanner_settings.dart';

/// A class representing settings for the Korean Postal Authority Code symbology.
///
/// This class provides methods to enable or disable the transmission of check digits,
/// and to manage the transmission of dashes in the barcode data.
@lazySingleton
class KoreanPostalAuthorityCodeSettings extends BaseScannerSettings {
  /// Enables the transmission of the check digit for Korean Postal Authority Code symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, koreanPostalTransmitCd);
  }

  /// Disables the transmission of the check digit for Korean Postal Authority Code symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, koreanPostalDoNotTransmitCd);
  }

  /// Enables the transmission of dashes in the barcode data for Korean Postal Authority Code symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> transmitDash(String deviceId) async {
    return sendCommand(deviceId, koreanPostalTransmitDash);
  }

  /// Disables the transmission of dashes in the barcode data for Korean Postal Authority Code symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> doNotTransmitDash(String deviceId) async {
    return sendCommand(deviceId, koreanPostalDoNotTransmitDash);
  }

  /// Sets the orientation of the scan engine to normal for Korean Postal Authority Code symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setOrientationNormal(String deviceId) async {
    return sendCommand(deviceId, koreanPostalOrientationNormal);
  }

  /// Sets the orientation of the scan engine to upside-down for Korean Postal Authority Code symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setOrientationUpsideDown(String deviceId) async {
    return sendCommand(deviceId, koreanPostalOrientationUpsideDown);
  }

  /// Disables upside-down reading for Korean Postal Authority Code symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableUpsideDownReading(String deviceId) async {
    return sendCommand(deviceId, koreanPostalUpsideDownReadingDisabled);
  }

  /// Enables upside-down reading for Korean Postal Authority Code symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableUpsideDownReading(String deviceId) async {
    return sendCommand(deviceId, koreanPostalUpsideDownReadingEnabled);
  }
}
