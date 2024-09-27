import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/base_scanner_settings.dart';

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
class IATASettings extends BaseScannerSettings {
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
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setCheckCD(
      String deviceId, IATACheckCDSettings setting) async {
    return sendCommand(deviceId, _checkCDCommands[setting]!);
  }

  /// Enables the transmission of the check digit for IATA symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, iataTransmitCd);
  }

  /// Disables the transmission of the check digit for IATA symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, iataDoNotTransmitCd);
  }
}
