part of 'package:opticonnect_sdk/entities.dart';

/// A class representing the RGB color values for the LED.
class LEDColor {
  /// Red component of the RGB color, ranging from 0 to 255.
  final int red;

  /// Green component of the RGB color, ranging from 0 to 255.
  final int green;

  /// Blue component of the RGB color, ranging from 0 to 255.
  final int blue;

  /// Constructs an [LEDColor] with the specified red, green, and blue values and checks the arguments.
  LEDColor({required this.red, required this.green, required this.blue}) {
    if (red < 0 || red > 255) {
      throw ArgumentError.value(
          red, 'red', 'The red value must be between 0 and 255.');
    }
    if (green < 0 || green > 255) {
      throw ArgumentError.value(
          green, 'green', 'The green value must be between 0 and 255.');
    }
    if (blue < 0 || blue > 255) {
      throw ArgumentError.value(
          blue, 'blue', 'The blue value must be between 0 and 255.');
    }
  }

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
