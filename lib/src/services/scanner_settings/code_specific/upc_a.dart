import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/constants.dart';
import 'package:opticonnect_sdk/entities/entities.dart';
import 'package:opticonnect_sdk/enums/enums.dart';
import 'package:opticonnect_sdk/interfaces/interfaces.dart';
import 'package:opticonnect_sdk/src/interfaces/settings_base.dart';

/// Implementation of [UPCA] for UPCA symbology settings.
///
/// Provides methods to configure leading zero and check digit transmission settings,
/// as well as add-on support for UPCA symbology.
@LazySingleton(as: UPCA)
class UPCAImpl extends SettingsBase implements UPCA {
  final Map<UPCALeadingZeroAndTransmitCDMode, String>
      _upcALeadingZeroAndTransmitCDModeCommands = {
    UPCALeadingZeroAndTransmitCDMode.noLeadingZeroTransmitCD:
        upcANoLeadingZeroTransmitCd,
    UPCALeadingZeroAndTransmitCDMode.noLeadingZeroDoNotTransmitCD:
        upcANoLeadingZeroDoNotTransmitCd,
    UPCALeadingZeroAndTransmitCDMode.leadingZeroTransmitCD:
        upcALeadingZeroTransmitCd,
    UPCALeadingZeroAndTransmitCDMode.leadingZeroDoNotTransmitCD:
        upcALeadingZeroDoNotTransmitCd,
  };

  @override
  Future<CommandResponse> setLeadingZeroAndTransmitCDMode({
    required String deviceId,
    required UPCALeadingZeroAndTransmitCDMode mode,
  }) async {
    return sendCommand(
        deviceId, _upcALeadingZeroAndTransmitCDModeCommands[mode]!);
  }

  @override
  Future<CommandResponse> setAddOnPlus2({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command = enabled ? enableUPCAPlus2 : disableUPCAPlus2;
    return sendCommand(deviceId, command);
  }

  @override
  Future<CommandResponse> setAddOnPlus5({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command = enabled ? enableUPCAPlus5 : disableUPCAPlus5;
    return sendCommand(deviceId, command);
  }
}
