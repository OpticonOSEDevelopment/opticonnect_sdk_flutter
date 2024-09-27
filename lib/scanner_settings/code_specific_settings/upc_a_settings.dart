import 'package:injectable/injectable.dart';
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
@lazySingleton
class UPCASettings extends BaseScannerSettings {
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
  /// [deviceId] - The identifier of the target device.
  /// [mode] - The desired leading zero and check digit transmission mode.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setLeadingZeroAndTransmitCDMode(
      String deviceId, UPCALeadingZeroAndTransmitCDMode mode) async {
    return sendCommand(
        deviceId, _upcALeadingZeroAndTransmitCDModeCommands[mode]!);
  }

  /// Enables the 2-character add-on for UPCA symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableAddOnPlus2(String deviceId) async {
    return sendCommand(deviceId, enableUPCAPlus2);
  }

  /// Disables the 2-character add-on for UPCA symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableAddOnPlus2(String deviceId) async {
    return sendCommand(deviceId, disableUPCAPlus2);
  }

  /// Enables the 5-character add-on for UPCA symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableAddOnPlus5(String deviceId) async {
    return sendCommand(deviceId, enableUPCAPlus5);
  }

  /// Disables the 5-character add-on for UPCA symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableAddOnPlus5(String deviceId) async {
    return sendCommand(deviceId, disableUPCAPlus5);
  }
}
