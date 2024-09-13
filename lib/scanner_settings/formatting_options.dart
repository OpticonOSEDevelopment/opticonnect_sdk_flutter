import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/enums/direct_input_key.dart';
import 'package:opticonnect_sdk/scanner_settings/scanner_settings.dart';
import 'package:opticonnect_sdk/src/injection/injection.config.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';

class FormattingOptions extends ScannerSettings {
  final _appLogger = getIt<AppLogger>();

  FormattingOptions(super.sdk);

  List<String> _getDirectInputKeysCodes(
      List<DirectInputKey> keys, int maxChars) {
    if (keys.length > maxChars) {
      _appLogger.warning(
          'Preamble length is more than $maxChars characters. Cut off the excess characters.');
      keys = keys.sublist(0, maxChars);
    }

    return keys
        .map((k) {
          final code = directInputKeyCodes[k];

          if (code == null) {
            _appLogger
                .warning('No corresponding code found for DirectInputKey: $k');
          }

          return code;
        })
        .whereType<String>()
        .toList();
  }

  List<String> _getDirectInputKeysCodesFromString(String input, int maxChars) {
    if (input.length > maxChars) {
      _appLogger.warning(
          'Length is more than $maxChars characters. Cut off the excess characters.');
      input = input.substring(0, maxChars);
    }

    final List<DirectInputKey> directInputKeys = [];
    for (var char in input.split('')) {
      final key = charToDirectInputKey[char];

      if (key != null) {
        directInputKeys.add(key);
      } else {
        _appLogger.warning('Unrecognized character "$char".');
      }
    }

    return _getDirectInputKeysCodes(directInputKeys, maxChars);
  }

  Future<CommandResponse> setPreambleFromKeys(
      String deviceId, List<DirectInputKey> keys) async {
    final directInputKeysCodes = _getDirectInputKeysCodes(keys, 8);
    return sendCommand(deviceId, preamble, parameters: directInputKeysCodes);
  }

  Future<CommandResponse> setPreambleFromString(
      String deviceId, String preamble) {
    final directInputKeysCodes =
        _getDirectInputKeysCodesFromString(preamble, 8);
    return sendCommand(deviceId, preamble, parameters: directInputKeysCodes);
  }

  Future<CommandResponse> clearPreamble(String deviceId) async {
    return sendCommand(deviceId, preamble);
  }

  Future<CommandResponse> setPrefixFromKeys(
      String deviceId, List<DirectInputKey> keys) async {
    final directInputKeysCodes = _getDirectInputKeysCodes(keys, 4);
    return sendCommand(deviceId, prefixAllCodes,
        parameters: directInputKeysCodes);
  }

  Future<CommandResponse> setPrefixFromString(
      String deviceId, String prefix) async {
    final directInputKeysCodes = _getDirectInputKeysCodesFromString(prefix, 4);
    return sendCommand(deviceId, prefixAllCodes,
        parameters: directInputKeysCodes);
  }

  Future<CommandResponse> clearPrefix(String deviceId) async {
    return sendCommand(deviceId, prefixAllCodes);
  }

  Future<CommandResponse> setSuffixFromKeys(
      String deviceId, List<DirectInputKey> keys) async {
    final directInputKeysCodes = _getDirectInputKeysCodes(keys, 4);
    return sendCommand(deviceId, suffixAllCodes,
        parameters: directInputKeysCodes);
  }

  Future<CommandResponse> setSuffixFromString(
      String deviceId, String suffix) async {
    final directInputKeysCodes = _getDirectInputKeysCodesFromString(suffix, 4);
    return sendCommand(deviceId, suffixAllCodes,
        parameters: directInputKeysCodes);
  }

  Future<CommandResponse> clearSuffix(String deviceId) async {
    return sendCommand(deviceId, suffixAllCodes);
  }

  Future<CommandResponse> setPostambleFromKeys(
      String deviceId, List<DirectInputKey> keys) async {
    final directInputKeysCodes = _getDirectInputKeysCodes(keys, 8);
    return sendCommand(deviceId, postamble, parameters: directInputKeysCodes);
  }

  Future<CommandResponse> setPostambleFromString(
      String deviceId, String postamble) async {
    final directInputKeysCodes =
        _getDirectInputKeysCodesFromString(postamble, 8);
    return sendCommand(deviceId, postamble, parameters: directInputKeysCodes);
  }

  Future<CommandResponse> clearPostamble(String deviceId) async {
    return sendCommand(deviceId, postamble);
  }
}
