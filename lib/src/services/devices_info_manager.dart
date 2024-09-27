import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/scanner_command.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/services/scanner_commands_services/command_handlers_manager.dart';

@lazySingleton
class DevicesInfoManager {
  final CommandHandlersManager _commandHandlersManager;
  final AppLogger _appLogger;

  DevicesInfoManager(this._commandHandlersManager, this._appLogger);

  final Map<String, String> _macAddresses = {};
  final Map<String, String> _serialNumbers = {};
  final Map<String, String> _localNames = {};
  final Map<String, String> _firmwareVersions = {};

  Future<void> fetchDeviceInfo(String deviceId) async {
    await _fetchAndStoreInfo(deviceId, _macAddresses, directInputKeyM);
    await _fetchAndStoreInfo(deviceId, _serialNumbers, directInputKey5);
    await _fetchAndStoreInfo(deviceId, _localNames, directInputKeyN);
    await _fetchAndStoreInfo(deviceId, _firmwareVersions, directInputKey1);
  }

  Future<void> _fetchAndStoreInfo(
      String deviceId, Map<String, String> store, String parameter) async {
    try {
      if (!store.containsKey(deviceId)) {
        final result = await _commandHandlersManager.sendCommand(
            deviceId,
            ScannerCommand(transmitDeviceInformation,
                parameters: [parameter], sendFeedback: false));
        if (result.succeeded) {
          var fetchedData = result.response;
          // Format MAC address with semicolons
          if (parameter == directInputKeyM) {
            fetchedData = _formatMacAddress(fetchedData);
          }
          store[deviceId] = fetchedData;
          _appLogger.error('Device info fetched: $parameter: $fetchedData');
        }
      }
    } catch (e) {
      _appLogger.error('Failed to fetch device info: $e');
    }
  }

  String _formatMacAddress(String macAddress) {
    macAddress = macAddress.replaceAll(RegExp(r'[^0-9A-Fa-f]+$'), '');
    if (macAddress.length % 2 == 1) {
      throw FormatException('Invalid MAC address: $macAddress');
    }
    _appLogger.error('try formatting mac address: $macAddress');
    final buffer = StringBuffer();
    for (int i = 0; i < macAddress.length; i += 2) {
      buffer.write(macAddress.substring(i, i + 2));
      if (i + 2 < macAddress.length) {
        buffer.write(':');
      }
    }
    return buffer.toString();
  }
}