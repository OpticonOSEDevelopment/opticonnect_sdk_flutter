import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/settings_base.dart';

/// Enum representing the leading zero and check digit transmission settings for UPCE symbology.
enum UPCELeadingZeroAndTransmitCDMode {
  noLeadingZeroTransmitCD,
  noLeadingZeroDoNotTransmitCD,
  leadingZeroTransmitCD,
  leadingZeroDoNotTransmitCD,
}

/// Enum representing the conversion mode for UPCE symbology.
enum UPCEConversionMode {
  transmitAsIs,
  transmitAsUPCA,
}

/// A class representing settings for UPCE symbology.
///
/// This class provides methods to configure leading zero, check digit transmission settings,
/// conversion modes, and add-on support for UPCE symbology.
@lazySingleton
class UPCE extends SettingsBase {
  /// A map linking the leading zero and check digit transmission settings to their corresponding commands.
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

  /// A map linking the conversion modes to their corresponding commands.
  final Map<UPCEConversionMode, String> _upcEConversionModeCommands = {
    UPCEConversionMode.transmitAsIs: upcETransmitAsIs,
    UPCEConversionMode.transmitAsUPCA: upcETransmitAsUPCA,
  };

  /// Sets the leading zero and check digit transmission mode for UPCE symbology.
  ///
  /// [deviceId] - The identifier of the target device.and [mode] is the desired leading zero and check digit transmission mode.
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setLeadingZeroAndTransmitCDMode(
      {required deviceId,
      required UPCELeadingZeroAndTransmitCDMode mode}) async {
    return sendCommand(
        deviceId, _upcELeadingZeroAndTransmitCDModeCommands[mode]!);
  }

  /// Sets the conversion mode for UPCE symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [mode] - The desired conversion mode for UPCE symbology.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setConversionMode(
      {required deviceId, required UPCEConversionMode mode}) async {
    return sendCommand(deviceId, _upcEConversionModeCommands[mode]!);
  }

  /// Sets the 2-character add-on for UPCE symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the 2-character add-on.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setAddOnPlus2(
      {required deviceId, required bool enabled}) async {
    final String command = enabled ? enableUPCEPlus2 : disableUPCEPlus2;
    return sendCommand(deviceId, command);
  }

  /// Sets the 5-character add-on for UPCE symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the 5-character add-on.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setAddOnPlus5(
      {required deviceId, required bool enabled}) async {
    final String command = enabled ? enableUPCEPlus5 : disableUPCEPlus5;
    return sendCommand(deviceId, command);
  }
}
