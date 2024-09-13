import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/scanner_settings/scanner_settings.dart';

enum UPCELeadingZeroAndTransmitCDMode {
  noLeadingZeroTransmitCD,
  noLeadingZeroDoNotTransmitCD,
  leadingZeroTransmitCD,
  leadingZeroDoNotTransmitCD,
}

enum UPCEConversionMode {
  transmitAsIs,
  transmitAsUPCA,
}

class UPCASettings extends ScannerSettings {
  UPCASettings(super.sdk);

  final Map<UPCELeadingZeroAndTransmitCDMode, String>
      _upcELeadingZeroAndTransmitCDModeCommands = {
    UPCELeadingZeroAndTransmitCDMode.noLeadingZeroTransmitCD:
        upcENoLeadingZeroTransmitCd,
    UPCELeadingZeroAndTransmitCDMode.noLeadingZeroDoNotTransmitCD:
        upcENoLeadingZeroDoNotTransmitCd,
    UPCELeadingZeroAndTransmitCDMode.leadingZeroTransmitCD:
        upcELeadingZeroTransmitCd,
    UPCELeadingZeroAndTransmitCDMode.leadingZeroDoNotTransmitCD:
        upcELeadingZeroDoNotTransmitCd,
  };

  final Map<UPCEConversionMode, String> _upcEConversionModeCommands = {
    UPCEConversionMode.transmitAsIs: upcETransmitAsIs,
    UPCEConversionMode.transmitAsUPCA: upcETransmitAsUPCA,
  };

  Future<CommandResponse> setLeadingZeroAndTransmitCDMode(
      String deviceId, UPCELeadingZeroAndTransmitCDMode mode) async {
    return sendCommand(
        deviceId, _upcELeadingZeroAndTransmitCDModeCommands[mode]!);
  }

  Future<CommandResponse> setConversionMode(
      String deviceId, UPCEConversionMode mode) async {
    return sendCommand(deviceId, _upcEConversionModeCommands[mode]!);
  }

  Future<CommandResponse> enableAddOnPlus2(String deviceId) async {
    return sendCommand(deviceId, upcEEnableAddon2);
  }

  Future<CommandResponse> disableAddOnPlus2(String deviceId) async {
    return sendCommand(deviceId, upcEDisableAddon2);
  }

  Future<CommandResponse> enableAddOnPlus5(String deviceId) async {
    return sendCommand(deviceId, upcEEnableAddon5);
  }

  Future<CommandResponse> disableAddOnPlus5(String deviceId) async {
    return sendCommand(deviceId, upcEDisableAddon5);
  }
}
