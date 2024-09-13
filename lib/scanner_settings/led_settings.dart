import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/scanner_settings/scanner_settings.dart';

class LEDColor {
  final int red;
  final int green;
  final int blue;

  LEDColor({required this.red, required this.green, required this.blue});

  String toHex(int value) {
    return '\$${value.toRadixString(16).padLeft(2, '0').toUpperCase()}';
  }

  List<String> toParameters() {
    return [toHex(red), toHex(green), toHex(blue)];
  }
}

class LEDSettings extends ScannerSettings {
  LEDSettings(super.sdk);

  Future<CommandResponse> testLED(String deviceId, LEDColor color) async {
    final parameters = color.toParameters();
    return sendCommand(deviceId, nonPersistentSetLED, parameters: parameters);
  }

  Future<CommandResponse> setLED(String deviceId, LEDColor color) async {
    final parameters = color.toParameters();
    return sendCommand(deviceId, persistentSetLED, parameters: parameters);
  }
}
