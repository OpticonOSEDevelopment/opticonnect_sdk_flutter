import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/settings_base.dart';

/// A class representing settings for UPCE1 symbology.
///
/// This class provides methods to configure leading zero, check digit transmission settings,
/// conversion modes, and add-on support for UPCE1 symbology.
@lazySingleton
class UPCE1 extends SettingsBase {
  /// Sets the 2-character add-on for UPCE1 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the 2-character add-on.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setAddOnPlus2(String deviceId,
      {required bool enabled}) async {
    final String command = enabled ? enableUPCE1Plus2 : disableUPCE1Plus2;
    return sendCommand(deviceId, command);
  }

  /// Sets the 5-character add-on for UPCE1 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the 5-character add-on.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setAddOnPlus5(String deviceId,
      {required bool enabled}) async {
    final String command = enabled ? enableUPCE1Plus5 : disableUPCE1Plus5;
    return sendCommand(deviceId, command);
  }
}
