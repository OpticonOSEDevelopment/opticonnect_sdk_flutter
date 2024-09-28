import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/settings_base.dart';

/// Enum representing the various modes for Code 128 and GS1-128 symbologies.
enum Code128GS1128Mode {
  disableGS1128,
  enableGS1128Only,
  enableGS1128IfPossible,
}

/// Enum representing the various modes for GS1-128 Conversion.
enum GS1128ConversionMode {
  disableConversion,
  enableMode1,
  enableMode2,
  enableMode3,
  enableMode4,
}

/// A class representing settings for Code 128 and GS1-128 symbologies.
///
/// This class provides methods to configure the mode and manage concatenation for
/// these symbologies.
@lazySingleton
class Code128AndGS1128 extends SettingsBase {
  /// A map linking the modes to their corresponding commands.
  final Map<Code128GS1128Mode, String> _modeCommands = {
    Code128GS1128Mode.disableGS1128: code128DisableGS1_128,
    Code128GS1128Mode.enableGS1128Only: code128EnableGS1_128Only,
    Code128GS1128Mode.enableGS1128IfPossible: code128EnableGS1_128IfPossible,
  };

  /// A map linking the GS1-128 conversion modes to their corresponding commands.
  final Map<GS1128ConversionMode, String> _gs1ConversionCommands = {
    GS1128ConversionMode.disableConversion: code128DisableGS1_128Conversion,
    GS1128ConversionMode.enableMode1: code128EnableGS1_128ConversionMode1,
    GS1128ConversionMode.enableMode2: code128EnableGS1_128ConversionMode2,
    GS1128ConversionMode.enableMode3: code128EnableGS1_128ConversionMode3,
    GS1128ConversionMode.enableMode4: code128EnableGS1_128ConversionMode4,
  };

  /// Sets the mode for Code 128 and GS1-128 symbologies.
  ///
  /// [deviceId] is the identifier of the device.
  /// [mode] is the Code 128 GS1-128 mode to be set.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setGS1128Mode(
      String deviceId, Code128GS1128Mode mode) async {
    return sendCommand(deviceId, _modeCommands[mode]!);
  }

  /// Sets the conversion mode for GS1-128 symbology.
  ///
  /// [deviceId] is the identifier of the device.
  /// [mode] is the conversion mode to be set for GS1-128.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setGS1128ConversionMode(
      String deviceId, GS1128ConversionMode mode) async {
    return sendCommand(deviceId, _gs1ConversionCommands[mode]!);
  }

  /// Enables concatenation for Code 128 symbology.
  ///
  /// [deviceId] is the identifier of the device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableConcatenation(String deviceId) async {
    return sendCommand(deviceId, code128EnableConcatenation);
  }

  /// Disables concatenation for Code 128 symbology.
  ///
  /// [deviceId] is the identifier of the device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableConcatenation(String deviceId) async {
    return sendCommand(deviceId, code128DisableConcatenation);
  }

  /// Enables the output of the leading ]C1 character in Code 128.
  ///
  /// [deviceId] is the identifier of the device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableLeadingC1Output(String deviceId) async {
    return sendCommand(deviceId, code128EnableLeadingC1Output);
  }

  /// Disables the output of the leading ]C1 character in Code 128.
  ///
  /// [deviceId] is the identifier of the device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableLeadingC1Output(String deviceId) async {
    return sendCommand(deviceId, code128DisableLeadingC1Output);
  }
}
