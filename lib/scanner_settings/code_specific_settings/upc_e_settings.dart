import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/base_scanner_settings.dart';

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
class UPCESettings extends BaseScannerSettings {
  UPCESettings(super.sdk);

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
      String deviceId, UPCELeadingZeroAndTransmitCDMode mode) async {
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
      String deviceId, UPCEConversionMode mode) async {
    return sendCommand(deviceId, _upcEConversionModeCommands[mode]!);
  }

  /// Enables the 2-character add-on for UPCE symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableAddOnPlus2(String deviceId) async {
    return sendCommand(deviceId, enableUPCEPlus2);
  }

  /// Disables the 2-character add-on for UPCE symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableAddOnPlus2(String deviceId) async {
    return sendCommand(deviceId, disableUPCEPlus2);
  }

  /// Enables the 5-character add-on for UPCE symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableAddOnPlus5(String deviceId) async {
    return sendCommand(deviceId, enableUPCEPlus5);
  }

  /// Disables the 5-character add-on for UPCE symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableAddOnPlus5(String deviceId) async {
    return sendCommand(deviceId, disableUPCEPlus5);
  }
}
