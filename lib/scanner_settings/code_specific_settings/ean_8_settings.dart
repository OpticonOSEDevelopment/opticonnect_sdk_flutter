import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/base_scanner_settings.dart';

/// A class representing settings for EAN-8 symbology.
///
/// This class provides methods to enable or disable the transmission of check digits,
/// and to manage add-on settings for EAN-8 symbology.
@lazySingleton
class EAN8Settings extends BaseScannerSettings {
  /// Enables the transmission of the check digit for EAN-8 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, ean8TransmitCd);
  }

  /// Disables the transmission of the check digit for EAN-8 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, ean8DoNotTransmitCd);
  }

  /// Enables the 2-character add-on for EAN-8 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableAddOnPlus2(String deviceId) async {
    return sendCommand(deviceId, enableEAN8Plus2);
  }

  /// Disables the 2-character add-on for EAN-8 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableAddOnPlus2(String deviceId) async {
    return sendCommand(deviceId, disableEAN8Plus2);
  }

  /// Enables the 5-character add-on for EAN-8 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableAddOnPlus5(String deviceId) async {
    return sendCommand(deviceId, enableEAN8Plus5);
  }

  /// Disables the 5-character add-on for EAN-8 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableAddOnPlus5(String deviceId) async {
    return sendCommand(deviceId, disableEAN8Plus5);
  }
}
