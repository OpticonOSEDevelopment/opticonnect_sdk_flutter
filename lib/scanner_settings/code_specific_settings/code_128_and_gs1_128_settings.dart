import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/base_scanner_settings.dart';

/// Enum representing the various modes for Code 128 and GS1-128 symbologies.
enum Code128Mode {
  disableGS1128,
  enableGS1128Only,
  enableGS1128IfPossible,
}

/// A class representing settings for Code 128 and GS1-128 symbologies.
///
/// This class provides methods to configure the mode and manage concatenation for
/// these symbologies.
class Code128AndGS1128Settings extends BaseScannerSettings {
  Code128AndGS1128Settings(super.sdk);

  /// A map linking the modes to their corresponding commands.
  final Map<Code128Mode, String> _modeCommands = {
    Code128Mode.disableGS1128: code128DisableGS1_128,
    Code128Mode.enableGS1128Only: code128EnableGS1_128Only,
    Code128Mode.enableGS1128IfPossible: code128EnableGS1_128IfPossible,
  };

  /// Sets the mode for Code 128 and GS1-128 symbologies.
  Future<CommandResponse> setMode(String deviceId, Code128Mode mode) async {
    return sendCommand(deviceId, _modeCommands[mode]!);
  }

  /// Enables concatenation for Code 128 symbology.
  Future<CommandResponse> enableConcatenation(String deviceId) async {
    return sendCommand(deviceId, code128EnableConcatenation);
  }

  /// Disables concatenation for Code 128 symbology.
  Future<CommandResponse> disableConcatenation(String deviceId) async {
    return sendCommand(deviceId, code128DisableConcatenation);
  }
}
