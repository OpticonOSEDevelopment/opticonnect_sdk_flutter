import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/interfaces/scanner_settings/code_specific/upc_e1.dart';
import 'package:opticonnect_sdk/src/interfaces/settings_base.dart';

/// Implementation of [UPCE1] for UPCE1 symbology settings.
///
/// Provides methods to configure add-on support for UPCE1 symbology.
@LazySingleton(as: UPCE1)
class UPCE1Impl extends SettingsBase implements UPCE1 {
  @override
  Future<CommandResponse> setAddOnPlus2({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command = enabled ? enableUPCE1Plus2 : disableUPCE1Plus2;
    return sendCommand(deviceId, command);
  }

  @override
  Future<CommandResponse> setAddOnPlus5({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command = enabled ? enableUPCE1Plus5 : disableUPCE1Plus5;
    return sendCommand(deviceId, command);
  }
}
