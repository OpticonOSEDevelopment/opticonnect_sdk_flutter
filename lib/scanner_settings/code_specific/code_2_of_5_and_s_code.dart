import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/settings_base.dart';

/// Enum representing the minimum data length for Code 2 of 5 and S-Code symbologies.
enum DataLength {
  oneCharacter, // GE
  threeCharacters, // GF
  fiveCharacters // GI
}

/// A class representing settings for Code 2 of 5 and S-Code symbologies.
///
/// This class provides methods to configure space checks, data length, and S-code
/// transmission for Code 2 of 5 and S-Code symbologies.
@lazySingleton
class Code2Of5AndSCode extends SettingsBase {
  /// A map linking the data length options to their corresponding commands.
  final Map<DataLength, String> _dataLengthCommands = {
    DataLength.oneCharacter: twoOfFiveAndSCodeMinimumLengthOneChar,
    DataLength.threeCharacters: twoOfFiveAndSCodeMinimumLengthThreeChars,
    DataLength.fiveCharacters: twoOfFiveAndSCodeMinimumLengthFiveChars,
  };

  /// Sets the space check mode for Industrial 2 of 5 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the space check.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setSpaceCheck(
      {required deviceId, required bool enabled}) async {
    final String command = enabled
        ? twoOfFiveAndSCodeEnableSpaceCheckIndustrial2of5
        : twoOfFiveAndSCodeDisableSpaceCheckIndustrial2of5;
    return sendCommand(deviceId, command);
  }

  /// Sets the transmission mode of S-Code as Interleaved 2 of 5.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to transmit (`true`) or not transmit (`false`) the S-Code as Interleaved 2 of 5.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setSCodeTransmissionAsInterleaved(
      {required deviceId, required bool enabled}) async {
    final String command = enabled
        ? twoOfFiveAndSCodeTransmitAsInterleaved2of5
        : twoOfFiveAndSCodeDoNotTransmitAsInterleaved2of5;
    return sendCommand(deviceId, command);
  }

  /// Sets the minimum data length for Code 2 of 5 and S-Code symbologies.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [dataLength] - The [DataLength] enum value representing the minimum data length.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setMinimumDataLength(
      {required deviceId, required DataLength dataLength}) async {
    return sendCommand(deviceId, _dataLengthCommands[dataLength]!);
  }
}
