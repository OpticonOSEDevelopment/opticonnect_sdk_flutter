import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/settings_base.dart';

/// Enum representing the check digit validation settings for IATA symbology.
enum IATACheckCDSettings {
  doNetCheckCD,
  checkFCAndSNOnly,
  checkCPNFCAndSN,
  checkCPNACFCAndSN,
}

/// A class representing settings for IATA symbology.
///
/// This class provides methods to configure the check digit validation mode
/// and manage the transmission of check digits for IATA symbology.
@lazySingleton
class IATA extends SettingsBase {
  /// A map linking the check digit settings to their respective commands.
  final Map<IATACheckCDSettings, String> _checkCDCommands = {
    IATACheckCDSettings.doNetCheckCD: iataDoNotCheckCd,
    IATACheckCDSettings.checkFCAndSNOnly: iataCheckFCAndSNOnly,
    IATACheckCDSettings.checkCPNFCAndSN: iataCheckCPNFCAndSN,
    IATACheckCDSettings.checkCPNACFCAndSN: iataCheckCPNACFCAndSN,
  };

  /// Sets the check digit validation mode for IATA symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [setting] - The [IATACheckCDSettings] enum value representing the desired setting.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setCheckCD(
      String deviceId, IATACheckCDSettings setting) async {
    return sendCommand(deviceId, _checkCDCommands[setting]!);
  }

  /// Sets the transmission of the check digit for IATA symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the transmission of the check digit.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setTransmitCD(String deviceId,
      {required bool enabled}) async {
    final String command = enabled ? iataTransmitCd : iataDoNotTransmitCd;
    return sendCommand(deviceId, command);
  }
}
