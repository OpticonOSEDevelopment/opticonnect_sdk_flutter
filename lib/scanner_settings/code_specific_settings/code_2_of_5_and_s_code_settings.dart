import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/base_scanner_settings.dart';

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
class Code2Of5AndSCodeSettings extends BaseScannerSettings {
  Code2Of5AndSCodeSettings(super.sdk);

  /// A map linking the data length options to their corresponding commands.
  final Map<DataLength, String> _dataLengthCommands = {
    DataLength.oneCharacter: twoOfFiveAndSCodeMinimumLengthOneChar,
    DataLength.threeCharacters: twoOfFiveAndSCodeMinimumLengthThreeChars,
    DataLength.fiveCharacters: twoOfFiveAndSCodeMinimumLengthFiveChars,
  };

  /// Enables the space check for Industrial 2 of 5 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableSpaceCheck(String deviceId) async {
    return sendCommand(
        deviceId, twoOfFiveAndSCodeEnableSpaceCheckIndustrial2of5);
  }

  /// Disables the space check for Industrial 2 of 5 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableSpaceCheck(String deviceId) async {
    return sendCommand(
        deviceId, twoOfFiveAndSCodeDisableSpaceCheckIndustrial2of5);
  }

  /// Transmits the S-Code as Interleaved 2 of 5.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> transmitSCodeAsInterleaved(String deviceId) async {
    return sendCommand(deviceId, twoOfFiveAndSCodeTransmitAsInterleaved2of5);
  }

  /// Does not transmit the S-Code as Interleaved 2 of 5.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> doNotTransmitSCodeAsInterleaved(
      String deviceId) async {
    return sendCommand(
        deviceId, twoOfFiveAndSCodeDoNotTransmitAsInterleaved2of5);
  }

  /// Sets the minimum data length for Code 2 of 5 and S-Code symbologies.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [dataLength] - The [DataLength] enum value representing the minimum data length.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setMinimumDataLength(
      String deviceId, DataLength dataLength) async {
    return sendCommand(deviceId, _dataLengthCommands[dataLength]!);
  }
}
