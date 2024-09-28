import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/settings_base.dart';

/// A class representing settings for EAN-8 symbology.
///
/// This class provides methods to enable or disable the transmission of check digits,
/// and to manage add-on settings for EAN-8 symbology.
@lazySingleton
class EAN8 extends SettingsBase {
  /// Sets the transmission of the check digit for EAN-8 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the transmission of the check digit.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setTransmitCD(String deviceId,
      {required bool enabled}) async {
    final String command = enabled ? ean8TransmitCd : ean8DoNotTransmitCd;
    return sendCommand(deviceId, command);
  }

  /// Sets the 2-character add-on for EAN-8 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the 2-character add-on.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setAddOnPlus2(String deviceId,
      {required bool enabled}) async {
    final String command = enabled ? enableEAN8Plus2 : disableEAN8Plus2;
    return sendCommand(deviceId, command);
  }

  /// Sets the 5-character add-on for EAN-8 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the 5-character add-on.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setAddOnPlus5(String deviceId,
      {required bool enabled}) async {
    final String command = enabled ? enableEAN8Plus5 : disableEAN8Plus5;
    return sendCommand(deviceId, command);
  }
}
