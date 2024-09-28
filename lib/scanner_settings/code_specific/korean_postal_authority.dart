import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/settings_base.dart';

/// A class representing settings for the Korean Postal Authority Code symbology.
///
/// This class provides methods to enable or disable the transmission of check digits,
/// and to manage the transmission of dashes in the barcode data.
@lazySingleton
class KoreanPostalAuthority extends SettingsBase {
  /// Sets the transmission of the check digit for Korean Postal Authority Code symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the transmission of the check digit.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setTransmitCD(
      {required deviceId, required bool enabled}) async {
    final String command =
        enabled ? koreanPostalTransmitCd : koreanPostalDoNotTransmitCd;
    return sendCommand(deviceId, command);
  }

  /// Sets the transmission of dashes in the barcode data for Korean Postal Authority Code symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the transmission of dashes.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setTransmitDash(
      {required deviceId, required bool enabled}) async {
    final String command =
        enabled ? koreanPostalTransmitDash : koreanPostalDoNotTransmitDash;
    return sendCommand(deviceId, command);
  }

  /// Sets the orientation of the scan engine for Korean Postal Authority Code symbology.
  ///
  /// If [setUpsideDown] is true, sets the orientation to upside-down, otherwise sets it to normal.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [setUpsideDown] - A boolean flag indicating whether to set the orientation to upside-down (true) or normal (false).
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setKoreanPostalOrientation(
      {required String deviceId, required bool setUpsideDown}) async {
    // Choose the appropriate command based on the desired orientation
    final command = setUpsideDown
        ? koreanPostalOrientationUpsideDown
        : koreanPostalOrientationNormal;

    // Send the selected command to the device
    return sendCommand(deviceId, command);
  }

  /// Sets upside-down reading for Korean Postal Authority Code symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) upside-down reading.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setUpsideDownReading(
      {required deviceId, required bool enabled}) async {
    final String command = enabled
        ? koreanPostalUpsideDownReadingEnabled
        : koreanPostalUpsideDownReadingDisabled;
    return sendCommand(deviceId, command);
  }
}
