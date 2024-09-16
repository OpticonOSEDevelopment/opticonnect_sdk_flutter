import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/base_scanner_settings.dart';

/// Enum representing the code modes for Telepen symbology.
enum TelepenCodeMode {
  numericMode,
  asciiMode,
}

/// A class representing settings for Telepen symbology.
///
/// This class provides methods to configure the code mode for Telepen symbology.
class TelepenSettings extends BaseScannerSettings {
  TelepenSettings(super.sdk);

  /// A map linking the Telepen code modes to their corresponding commands.
  final Map<TelepenCodeMode, String> _telepenCodeModeCommands = {
    TelepenCodeMode.numericMode: telepenNumericMode,
    TelepenCodeMode.asciiMode: telepenASCIIMode,
  };

  /// Sets the code mode for Telepen symbology.
  ///
  /// [deviceId] is the ID of the BLE device, and [setting] is the desired Telepen code mode.
  Future<CommandResponse> setMode(
      String deviceId, TelepenCodeMode setting) async {
    return sendCommand(deviceId, _telepenCodeModeCommands[setting]!);
  }
}
