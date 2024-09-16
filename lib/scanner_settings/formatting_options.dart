import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/enums/direct_input_key.dart';
import 'package:opticonnect_sdk/helpers/direct_input_keys_helper.dart';
import 'package:opticonnect_sdk/src/injection/injection.config.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/scanner_settings/base_scanner_settings.dart';

/// A class responsible for configuring formatting options such as preambles, prefixes, suffixes, and postambles.
///
/// This class allows the setting of these formatting options using direct input keys or strings
/// and sends the corresponding commands to the BLE device.
class FormattingOptions extends BaseScannerSettings {
  final _appLogger = getIt<AppLogger>();

  /// Creates a [FormattingOptions] object for handling formatting settings of the scanner.
  ///
  /// - [sdk]: The instance of the SDK to communicate with the scanner.
  FormattingOptions(super.sdk);

  /// Converts a list of [DirectInputKey] into their corresponding input key codes.
  ///
  /// - [keys]: A list of [DirectInputKey] values to convert.
  /// - [maxChars]: The maximum allowed number of characters.
  ///
  /// If the number of characters exceeds [maxChars], it trims the list.
  List<String> _getDirectInputKeysCodes(
      List<DirectInputKey> keys, int maxChars) {
    if (keys.length > maxChars) {
      _appLogger.warning(
          'Length is more than $maxChars characters. Cut off the excess characters.');
      keys = keys.sublist(0, maxChars);
    }

    return keys
        .map((k) {
          final code = DirectInputKeysHelper.directInputKeyCodes[k];

          if (code == null) {
            _appLogger
                .warning('No corresponding code found for DirectInputKey: $k');
          }

          return code;
        })
        .whereType<String>()
        .toList();
  }

  /// Converts a string into a list of corresponding input key codes.
  ///
  /// - [input]: The input string to convert.
  /// - [maxChars]: The maximum allowed number of characters.
  ///
  /// Any unrecognized characters will be logged and ignored.
  List<String> _getDirectInputKeysCodesFromString(String input, int maxChars) {
    if (input.length > maxChars) {
      _appLogger.warning(
          'Length is more than $maxChars characters. Cut off the excess characters.');
      input = input.substring(0, maxChars);
    }

    final List<DirectInputKey> directInputKeys = [];
    for (var char in input.split('')) {
      final key = DirectInputKeysHelper.charToDirectInputKey[char];

      if (key != null) {
        directInputKeys.add(key);
      } else {
        _appLogger.warning('Unrecognized character "$char".');
      }
    }

    return _getDirectInputKeysCodes(directInputKeys, maxChars);
  }

  /// Sets the preamble formatting using a list of [DirectInputKey].
  ///
  /// - [deviceId]: The ID of the BLE device.
  /// - [keys]: A list of [DirectInputKey] values to be used for the preamble.
  ///
  /// The preamble can have a maximum of 8 characters.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setPreambleFromKeys(
      String deviceId, List<DirectInputKey> keys) async {
    final directInputKeysCodes = _getDirectInputKeysCodes(keys, 8);
    return sendCommand(deviceId, preamble, parameters: directInputKeysCodes);
  }

  /// Sets the preamble formatting using a string.
  ///
  /// - [deviceId]: The ID of the BLE device.
  /// - [preamble]: A string to be used as the preamble.
  ///
  /// The preamble can have a maximum of 8 characters.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setPreambleFromString(
      String deviceId, String preamble) {
    final directInputKeysCodes =
        _getDirectInputKeysCodesFromString(preamble, 8);
    return sendCommand(deviceId, preamble, parameters: directInputKeysCodes);
  }

  /// Clears the preamble formatting on the device.
  ///
  /// - [deviceId]: The ID of the BLE device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> clearPreamble(String deviceId) async {
    return sendCommand(deviceId, preamble);
  }

  /// Sets the prefix formatting using a list of [DirectInputKey].
  ///
  /// - [deviceId]: The ID of the BLE device.
  /// - [keys]: A list of [DirectInputKey] values to be used for the prefix.
  ///
  /// The prefix can have a maximum of 4 characters.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setPrefixFromKeys(
      String deviceId, List<DirectInputKey> keys) async {
    final directInputKeysCodes = _getDirectInputKeysCodes(keys, 4);
    return sendCommand(deviceId, prefixAllCodes,
        parameters: directInputKeysCodes);
  }

  /// Sets the prefix formatting using a string.
  ///
  /// - [deviceId]: The ID of the BLE device.
  /// - [prefix]: A string to be used as the prefix.
  ///
  /// The prefix can have a maximum of 4 characters.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setPrefixFromString(
      String deviceId, String prefix) async {
    final directInputKeysCodes = _getDirectInputKeysCodesFromString(prefix, 4);
    return sendCommand(deviceId, prefixAllCodes,
        parameters: directInputKeysCodes);
  }

  /// Clears the prefix formatting on the device.
  ///
  /// - [deviceId]: The ID of the BLE device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> clearPrefix(String deviceId) async {
    return sendCommand(deviceId, prefixAllCodes);
  }

  /// Sets the suffix formatting using a list of [DirectInputKey].
  ///
  /// - [deviceId]: The ID of the BLE device.
  /// - [keys]: A list of [DirectInputKey] values to be used for the suffix.
  ///
  /// The suffix can have a maximum of 4 characters.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setSuffixFromKeys(
      String deviceId, List<DirectInputKey> keys) async {
    final directInputKeysCodes = _getDirectInputKeysCodes(keys, 4);
    return sendCommand(deviceId, suffixAllCodes,
        parameters: directInputKeysCodes);
  }

  /// Sets the suffix formatting using a string.
  ///
  /// - [deviceId]: The ID of the BLE device.
  /// - [suffix]: A string to be used as the suffix.
  ///
  /// The suffix can have a maximum of 4 characters.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setSuffixFromString(
      String deviceId, String suffix) async {
    final directInputKeysCodes = _getDirectInputKeysCodesFromString(suffix, 4);
    return sendCommand(deviceId, suffixAllCodes,
        parameters: directInputKeysCodes);
  }

  /// Clears the suffix formatting on the device.
  ///
  /// - [deviceId]: The ID of the BLE device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> clearSuffix(String deviceId) async {
    return sendCommand(deviceId, suffixAllCodes);
  }

  /// Sets the postamble formatting using a list of [DirectInputKey].
  ///
  /// - [deviceId]: The ID of the BLE device.
  /// - [keys]: A list of [DirectInputKey] values to be used for the postamble.
  ///
  /// The postamble can have a maximum of 8 characters.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setPostambleFromKeys(
      String deviceId, List<DirectInputKey> keys) async {
    final directInputKeysCodes = _getDirectInputKeysCodes(keys, 8);
    return sendCommand(deviceId, postamble, parameters: directInputKeysCodes);
  }

  /// Sets the postamble formatting using a string.
  ///
  /// - [deviceId]: The ID of the BLE device.
  /// - [postamble]: A string to be used as the postamble.
  ///
  /// The postamble can have a maximum of 8 characters.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setPostambleFromString(
      String deviceId, String postamble) async {
    final directInputKeysCodes =
        _getDirectInputKeysCodesFromString(postamble, 8);
    return sendCommand(deviceId, postamble, parameters: directInputKeysCodes);
  }

  /// Clears the postamble formatting on the device.
  ///
  /// - [deviceId]: The ID of the BLE device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> clearPostamble(String deviceId) async {
    return sendCommand(deviceId, postamble);
  }
}
