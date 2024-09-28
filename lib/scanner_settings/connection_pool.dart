import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/helpers/direct_input_keys_helper.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/scanner_settings/settings_base.dart';

/// A class to manage connection pool settings for BLE devices.
///
/// Connection Pooling enables the exclusive connection of scanners to devices by using
/// a 4-character hexadecimal ID. This ensures automatic and secure connections, especially
/// in environments where multiple scanners are used across different devices.
///
/// This class allows setting and resetting the connection pool ID, validating hex IDs,
/// and generating the corresponding QR data for a connection pool.
///
/// Example usage:
///
/// - Use [setHexId] to set a specific hex ID for the device.
/// - Use [resetHexId] to reset the device's connection pool ID to the default '0000'.
/// - Use [getConnectionPoolQRData] to generate QR code data based on the current connection pool ID.
@lazySingleton
class ConnectionPool extends SettingsBase {
  final AppLogger _appLogger;

  ConnectionPool(this._appLogger);

  /// A list of reserved 4-character hexadecimal IDs that cannot be used for connection pooling.
  ///
  /// These reserved IDs are predefined and should not be assigned to devices.
  final List<String> reservedHexIds = [
    '0001',
    '0002',
    '0003',
    '30F4',
    '46F9',
    '9BE5',
  ];

  /// Validates whether the provided ID is a valid 4-character hexadecimal value.
  ///
  /// - Checks if the ID matches the hexadecimal format.
  /// - Verifies that the ID is not one of the reserved IDs.
  ///
  /// Returns a [CommandResponse] indicating whether the ID is valid or not.
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

  /// Converts the provided 4-character hexadecimal ID into a list of direct input key codes.
  ///
  /// The [DirectInputKeysHelper] is used to map each character in the hexadecimal string to
  /// its corresponding direct input key code. The resulting key codes are used in the
  /// command parameters when setting the connection pool ID.
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

  /// Sets the connection pool ID to the specified 4-character hexadecimal value.
  ///
  /// The ID must pass validation checks for both format and reserved ID status. If the validation
  /// succeeds, the ID is converted into direct input key codes and sent to the device.
  ///
  /// [deviceId] - The identifier of the target device.

  /// - [id]: A valid 4-character hexadecimal connection pool ID.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setHexId(String deviceId, String id) async {
    final validationResponse = _validateHexId(id);
    if (!validationResponse.succeeded) {
      return validationResponse;
    }
    final directInputKeys = _getDirectInputKeysFromHexId(id);
    final result = await sendCommand(deviceId, setConnectionPoolId,
        parameters: directInputKeys);
    if (!result.succeeded) {
      return result;
    } else {
      return sendCommand(deviceId, saveSettings);
    }
  }

  /// Sends the reset command to the device, which reverts the connection pool ID to the default ('0000').
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> resetHexId(String deviceId) async {
    final directInputKeys = _getDirectInputKeysFromHexId('0000');
    return sendCommand(deviceId, setConnectionPoolId,
        parameters: directInputKeys);
  }

  /// Checks if the given ID is a valid 4-character hexadecimal value.
  ///
  /// This method returns a boolean indicating whether the ID passes validation.
  ///
  /// - [id]: The ID to validate.
  ///
  /// Returns `true` if the ID is valid, `false` otherwise.
  bool isValidHexId(String id) {
    final validationResponse = _validateHexId(id);
    return validationResponse.succeeded;
  }

  /// Generates a configuration command string that can be encoded into a QR code.
  /// The QR code data contains the necessary information to configure the device with the provided
  /// connection pool ID when scanned.
  ///
  /// [id] - A valid 4-character hexadecimal connection pool ID.
  ///
  /// Returns the QR code data string, or an empty string if the ID is invalid.
  String getConnectionPoolQRData(String id) {
    if (!isValidHexId(id)) {
      return '';
    }
    final directInputKeys = _getDirectInputKeysFromHexId(id);
    return '@MENU_OPTO@ZZ@BBP@${directInputKeys.join('@')}@ZZ@OTPO_UNEM@';
  }
}
