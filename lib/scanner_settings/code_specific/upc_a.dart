import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/settings_base.dart';

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
class UPCA extends SettingsBase {
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
      {required String deviceId,
      required UPCALeadingZeroAndTransmitCDMode mode}) async {
    return sendCommand(
        deviceId, _upcALeadingZeroAndTransmitCDModeCommands[mode]!);
  }

  /// Sets the 2-character add-on for UPCA symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the 2-character add-on.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setAddOnPlus2(
      {required deviceId, required bool enabled}) async {
    final String command = enabled ? enableUPCAPlus2 : disableUPCAPlus2;
    return sendCommand(deviceId, command);
  }

  /// Sets the 5-character add-on for UPCA symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the 5-character add-on.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setAddOnPlus5(
      {required deviceId, required bool enabled}) async {
    final String command = enabled ? enableUPCAPlus5 : disableUPCAPlus5;
    return sendCommand(deviceId, command);
  }
}
