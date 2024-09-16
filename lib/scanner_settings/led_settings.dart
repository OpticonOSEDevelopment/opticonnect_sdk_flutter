import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/base_scanner_settings.dart';

/// A class representing the RGB color values for the LED.
class LEDColor {
  /// Red component of the RGB color, ranging from 0 to 255.
  final int red;

  /// Green component of the RGB color, ranging from 0 to 255.
  final int green;

  /// Blue component of the RGB color, ranging from 0 to 255.
  final int blue;

  /// Constructs an [LEDColor] with the specified red, green, and blue values.
  LEDColor({required this.red, required this.green, required this.blue});

  /// Converts an integer value to a hexadecimal string.
  ///
  /// - [value]: The integer value to convert, which should represent one of the RGB color components.
  /// - Returns: A string in hexadecimal format, with a leading `$` and two digits.
  String toHex(int value) {
    return '\$${value.toRadixString(16).padLeft(2, '0').toUpperCase()}';
  }

  /// Converts the RGB color values into a list of strings, each representing one of the color components in hexadecimal format.
  ///
  /// - Returns: A list of hexadecimal strings representing the red, green, and blue components of the color.
  List<String> toParameters() {
    return [toHex(red), toHex(green), toHex(blue)];
  }
}

/// A class responsible for controlling LED settings on the scanner.
class LEDSettings extends BaseScannerSettings {
  /// Constructs an [LEDSettings] instance, requiring the SDK to be passed to the base class.
  LEDSettings(super.sdk);

  /// Tests the LED by setting the color temporarily (non-persistent).
  ///
  /// - [deviceId]: The ID of the BLE device.
  /// - [color]: The [LEDColor] object that contains the red, green, and blue values.
  ///
  /// - Returns: A [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> testLED(String deviceId, LEDColor color) async {
    final parameters = color.toParameters();
    return sendCommand(deviceId, nonPersistentSetLED, parameters: parameters);
  }

  /// Sets the LED color permanently (persistent).
  ///
  /// - [deviceId]: The ID of the BLE device.
  /// - [color]: The [LEDColor] object that contains the red, green, and blue values.
  ///
  /// - Returns: A [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setLED(String deviceId, LEDColor color) async {
    final parameters = color.toParameters();
    return sendCommand(deviceId, persistentSetLED, parameters: parameters);
  }
}
