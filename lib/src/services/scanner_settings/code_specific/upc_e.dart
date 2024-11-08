import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants.dart';
import 'package:opticonnect_sdk/entities.dart';
import 'package:opticonnect_sdk/enums.dart';
import 'package:opticonnect_sdk/interfaces.dart';
import 'package:opticonnect_sdk/src/interfaces/settings_base.dart';

/// Implementation of [UPCE] for UPCE symbology settings.
///
/// Provides methods to configure leading zero, check digit transmission settings,
/// conversion modes, and add-on support for UPCE symbology.
@LazySingleton(as: UPCE)
class UPCEImpl extends SettingsBase implements UPCE {
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

  @override
  Future<CommandResponse> setLeadingZeroAndTransmitCDMode({
    required String deviceId,
    required UPCELeadingZeroAndTransmitCDMode mode,
  }) async {
    return sendCommand(
        deviceId, _upcELeadingZeroAndTransmitCDModeCommands[mode]!);
  }

  @override
  Future<CommandResponse> setConversionMode({
    required String deviceId,
    required UPCEConversionMode mode,
  }) async {
    return sendCommand(deviceId, _upcEConversionModeCommands[mode]!);
  }

  @override
  Future<CommandResponse> setAddOnPlus2({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command = enabled ? enableUPCEPlus2 : disableUPCEPlus2;
    return sendCommand(deviceId, command);
  }

  @override
  Future<CommandResponse> setAddOnPlus5({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command = enabled ? enableUPCEPlus5 : disableUPCEPlus5;
    return sendCommand(deviceId, command);
  }
}
