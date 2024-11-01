import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/helpers/direct_input_keys_helper.dart';
import 'package:opticonnect_sdk/interfaces/scanner_settings/connection_pool.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/interfaces/settings_base.dart';

@LazySingleton(as: ConnectionPool)
class ConnectionPoolImpl extends SettingsBase implements ConnectionPool {
  final AppLogger _appLogger;

  // Cache for device connection pool IDs
  final Map<String, String> _connectionPoolIds = {};

  ConnectionPoolImpl(this._appLogger);

  @override
  final List<String> reservedIds = [
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

    if (reservedIds.contains(id)) {
      final msg =
          'Invalid ID: ID is reserved. Reserved IDs are: ${reservedIds.join(', ')}.';
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

  @override
  Future<CommandResponse> setId(
      {required String deviceId, required String poolId}) async {
    final validationResponse = _validateHexId(poolId);
    if (!validationResponse.succeeded) {
      return validationResponse;
    }
    final directInputKeys = _getDirectInputKeysFromHexId(poolId);
    final result = await sendCommand(deviceId, setConnectionPoolId,
        parameters: directInputKeys);
    if (result.succeeded) {
      _cacheId(deviceId, poolId); // Cache the ID if successful
    }
    return result;
  }

  @override
  void cacheId(String deviceId, String poolId) {
    _cacheId(deviceId, poolId);
  }

  @override
  String getId(String deviceId) {
    return _connectionPoolIds[deviceId] ?? '0000';
  }

  @override
  Future<CommandResponse> resetId(String deviceId) async {
    _cacheId(deviceId, '0000'); // Reset to "0000" in cache
    final directInputKeys = _getDirectInputKeysFromHexId('0000');
    return sendCommand(deviceId, setConnectionPoolId,
        parameters: directInputKeys);
  }

  @override
  bool isValidId(String poolId) {
    final validationResponse = _validateHexId(poolId);
    return validationResponse.succeeded;
  }

  @override
  String getConnectionPoolQRData(String poolId) {
    if (!isValidId(poolId)) {
      return '';
    }
    final directInputKeys = _getDirectInputKeysFromHexId(poolId);
    return '@MENU_OPTO@ZZ@BBP@${directInputKeys.join('@')}@ZZ@OTPO_UNEM@';
  }

  // Cache the ID locally
  void _cacheId(String deviceId, String poolId) {
    _connectionPoolIds[deviceId] = poolId;
  }
}
