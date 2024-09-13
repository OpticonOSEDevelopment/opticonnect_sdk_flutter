import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/scanner_settings/scanner_settings.dart';

enum UPCALeadingZeroAndTransmitCDMode {
  noLeadingZeroTransmitCD,
  noLeadingZeroDoNotTransmitCD,
  leadingZeroTransmitCD,
  leadingZeroDoNotTransmitCD,
}

class UPCASettings extends ScannerSettings {
  UPCASettings(super.sdk);

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

  Future<CommandResponse> setLeadingZeroAndTransmitCDMode(
      String deviceId, UPCALeadingZeroAndTransmitCDMode mode) async {
    return sendCommand(
        deviceId, _upcALeadingZeroAndTransmitCDModeCommands[mode]!);
  }

  Future<CommandResponse> enableAddOnPlus2(String deviceId) async {
    return sendCommand(deviceId, upcAEnableAddon2);
  }

  Future<CommandResponse> disableAddOnPlus2(String deviceId) async {
    return sendCommand(deviceId, upcADisableAddon2);
  }

  Future<CommandResponse> enableAddOnPlus5(String deviceId) async {
    return sendCommand(deviceId, upcAEnableAddon5);
  }

  Future<CommandResponse> disableAddOnPlus5(String deviceId) async {
    return sendCommand(deviceId, upcADisableAddon5);
  }
}
