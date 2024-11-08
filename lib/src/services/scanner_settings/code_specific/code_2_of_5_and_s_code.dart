import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants.dart';
import 'package:opticonnect_sdk/entities.dart';
import 'package:opticonnect_sdk/enums.dart';
import 'package:opticonnect_sdk/interfaces.dart';
import 'package:opticonnect_sdk/src/interfaces/settings_base.dart';

/// Implementation for managing Code 2 of 5 and S-Code symbology settings.
@LazySingleton(as: Code2Of5AndSCode)
class Code2Of5AndSCodeImpl extends SettingsBase implements Code2Of5AndSCode {
  /// A map linking the data length options to their corresponding commands.
  final Map<DataLength, String> _dataLengthCommands = {
    DataLength.oneCharacter: twoOfFiveAndSCodeMinimumLengthOneChar,
    DataLength.threeCharacters: twoOfFiveAndSCodeMinimumLengthThreeChars,
    DataLength.fiveCharacters: twoOfFiveAndSCodeMinimumLengthFiveChars,
  };

  @override
  Future<CommandResponse> setSpaceCheck(
      {required String deviceId, required bool enabled}) async {
    final String command = enabled
        ? twoOfFiveAndSCodeEnableSpaceCheckIndustrial2of5
        : twoOfFiveAndSCodeDisableSpaceCheckIndustrial2of5;
    return sendCommand(deviceId, command);
  }

  @override
  Future<CommandResponse> setSCodeTransmissionAsInterleaved(
      {required String deviceId, required bool enabled}) async {
    final String command = enabled
        ? twoOfFiveAndSCodeTransmitAsInterleaved2of5
        : twoOfFiveAndSCodeDoNotTransmitAsInterleaved2of5;
    return sendCommand(deviceId, command);
  }

  @override
  Future<CommandResponse> setMinimumDataLength(
      {required String deviceId, required DataLength dataLength}) async {
    return sendCommand(deviceId, _dataLengthCommands[dataLength]!);
  }
}
