import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/interfaces/scanner_settings/code_specific/ean_8.dart';
import 'package:opticonnect_sdk/src/interfaces/settings_base.dart';

/// Implementation for settings related to EAN-8 symbology.
///
/// Provides methods to enable or disable the transmission of check digits,
/// and to manage add-on settings for EAN-8 symbology.
@LazySingleton(as: EAN8)
class EAN8Impl extends SettingsBase implements EAN8 {
  @override
  Future<CommandResponse> setTransmitCD({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command = enabled ? ean8TransmitCd : ean8DoNotTransmitCd;
    return sendCommand(deviceId, command);
  }

  @override
  Future<CommandResponse> setAddOnPlus2({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command = enabled ? enableEAN8Plus2 : disableEAN8Plus2;
    return sendCommand(deviceId, command);
  }

  @override
  Future<CommandResponse> setAddOnPlus5({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command = enabled ? enableEAN8Plus5 : disableEAN8Plus5;
    return sendCommand(deviceId, command);
  }
}
