import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/helpers/direct_input_keys_helper.dart';
import 'package:opticonnect_sdk/scanner_settings/scanner_settings.dart';
import 'package:opticonnect_sdk/src/injection/injection.config.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';

class ConnectionPoolSettings extends ScannerSettings {
  ConnectionPoolSettings(super.sdk);

  final _appLogger = getIt<AppLogger>();

  final List<String> reservedHexIds = [
    '0001',
    '0002',
    '0003',
    '30F4',
    '46F9',
    '9BE5',
  ];

  CommandResponse _validateHexId(String id) {
    final hexPattern = RegExp(r'^[0-9A-Fa-f]{4}$');
    if (!hexPattern.hasMatch(id)) {
      const msg = 'Invalid ID: must be a 4-character hexadecimal value.';
      _appLogger.warning(msg);
      return CommandResponse.failed(msg);
    }

    if (reservedHexIds.contains(id)) {
      final msg =
          'Invalid ID: ID is reserved. Reserved IDs are: ${reservedHexIds.join(', ')}.';
      _appLogger.warning(msg);
      return CommandResponse.failed(msg);
    }

    return CommandResponse.succeeded();
  }

  List<String> _getDirectInputKeysFromHexId(String hexId) {
    final upperHexId = hexId.toUpperCase();

    final keys = <String>[];

    for (var i = 0; i < upperHexId.length; i++) {
      final char = upperHexId[i];
      final directInputKey = DirectInputKeysHelper.charToDirectInputKey[char]!;
      keys.add(DirectInputKeysHelper.directInputKeyCodes[directInputKey]!);
    }

    return keys;
  }

  Future<CommandResponse> setId(String deviceId, String id) async {
    final validationResponse = _validateHexId(id);
    if (!validationResponse.succeeded) {
      return validationResponse;
    }
    final directInputKeys = _getDirectInputKeysFromHexId(id);
    return sendCommand(deviceId, setConnectionPoolId,
        parameters: directInputKeys);
  }

  Future<CommandResponse> resetId(String deviceId) async {
    final directInputKeys = _getDirectInputKeysFromHexId('0000');
    return sendCommand(deviceId, setConnectionPoolId,
        parameters: directInputKeys);
  }

  bool isValidHexId(String id) {
    final validationResponse = _validateHexId(id);
    return validationResponse.succeeded;
  }

  String getConnectionPoolQRData(String id) {
    if (!isValidHexId(id)) {
      return '';
    }
    final directInputKeys = _getDirectInputKeysFromHexId(id);
    return '@MENU_OPTO@ZZ@BBP@${directInputKeys.join('@')}@ZZ@OTPO_UNEM@';
  }
}
