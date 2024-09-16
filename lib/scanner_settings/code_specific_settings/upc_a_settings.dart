import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/base_scanner_settings.dart';

/// Enum representing the leading zero and check digit transmission settings for UPCA symbology.
enum UPCALeadingZeroAndTransmitCDMode {
  noLeadingZeroTransmitCD,
  noLeadingZeroDoNotTransmitCD,
  leadingZeroTransmitCD,
  leadingZeroDoNotTransmitCD,
}

/// A class representing settings for UPCA symbology.
///
/// This class provides methods to configure leading zero and check digit transmission settings,
/// as well as add-on support for UPCA symbology.
class UPCASettings extends BaseScannerSettings {
  UPCASettings(super.sdk);

  /// A map linking the leading zero and check digit transmission settings to their corresponding commands.
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

  /// Sets the leading zero and check digit transmission mode for UPCA symbology.
  ///
  /// [deviceId] is the ID of the BLE device, and [mode] is the desired leading zero and check digit transmission mode.
  Future<CommandResponse> setLeadingZeroAndTransmitCDMode(
      String deviceId, UPCALeadingZeroAndTransmitCDMode mode) async {
    return sendCommand(
        deviceId, _upcALeadingZeroAndTransmitCDModeCommands[mode]!);
  }

  /// Enables the 2-character add-on for UPCA symbology.
  Future<CommandResponse> enableAddOnPlus2(String deviceId) async {
    return sendCommand(deviceId, upcAEnableAddon2);
  }

  /// Disables the 2-character add-on for UPCA symbology.
  Future<CommandResponse> disableAddOnPlus2(String deviceId) async {
    return sendCommand(deviceId, upcADisableAddon2);
  }

  /// Enables the 5-character add-on for UPCA symbology.
  Future<CommandResponse> enableAddOnPlus5(String deviceId) async {
    return sendCommand(deviceId, upcAEnableAddon5);
  }

  /// Disables the 5-character add-on for UPCA symbology.
  Future<CommandResponse> disableAddOnPlus5(String deviceId) async {
    return sendCommand(deviceId, upcADisableAddon5);
  }
}
