import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/enums/scanner_settings/code_specific/iata.dart';
import 'package:opticonnect_sdk/interfaces/scanner_settings/code_specific/iata.dart';
import 'package:opticonnect_sdk/src/interfaces/settings_base.dart';

/// Implementation of the [IATA] interface for settings related to IATA symbology.
///
/// This class provides methods to configure the check digit validation mode
/// and manage the transmission of check digits for IATA symbology.
@LazySingleton(as: IATA)
class IATAImpl extends SettingsBase implements IATA {
  /// A map linking the check digit settings to their respective commands.
  final Map<IATACheckCDSettings, String> _checkCDCommands = {
    IATACheckCDSettings.doNetCheckCD: iataDoNotCheckCd,
    IATACheckCDSettings.checkFCAndSNOnly: iataCheckFCAndSNOnly,
    IATACheckCDSettings.checkCPNFCAndSN: iataCheckCPNFCAndSN,
    IATACheckCDSettings.checkCPNACFCAndSN: iataCheckCPNACFCAndSN,
  };

  @override
  Future<CommandResponse> setCheckCD({
    required String deviceId,
    required IATACheckCDSettings setting,
  }) async {
    return sendCommand(deviceId, _checkCDCommands[setting]!);
  }

  @override
  Future<CommandResponse> setTransmitCD({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command = enabled ? iataTransmitCd : iataDoNotTransmitCd;
    return sendCommand(deviceId, command);
  }
}
