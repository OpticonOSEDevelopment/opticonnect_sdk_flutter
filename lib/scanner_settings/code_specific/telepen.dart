import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/settings_base.dart';

/// Enum representing the code modes for Telepen symbology.
enum TelepenCodeMode {
  numericMode,
  asciiMode,
}

/// A class representing settings for Telepen symbology.
///
/// This class provides methods to configure the code mode for Telepen symbology.
@lazySingleton
class Telepen extends SettingsBase {
  /// A map linking the Telepen code modes to their corresponding commands.
  final Map<TelepenCodeMode, String> _telepenCodeModeCommands = {
    TelepenCodeMode.numericMode: telepenNumericMode,
    TelepenCodeMode.asciiMode: telepenASCIIMode,
  };

  /// Sets the code mode for Telepen symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [mode] - The desired Telepen code mode.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setMode(
      {required deviceId, required TelepenCodeMode mode}) async {
    return sendCommand(deviceId, _telepenCodeModeCommands[mode]!);
  }
}
