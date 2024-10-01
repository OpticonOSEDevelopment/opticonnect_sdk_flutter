import 'dart:async';

import 'package:flutter_blue_plus_windows/flutter_blue_plus_windows.dart';
import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/entities/ble_discovered_device.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/services/ble_services/constants/ble_uuids.dart';
import 'package:opticonnect_sdk/src/services/core/permission_handler.dart';
import 'package:permission_handler/permission_handler.dart';

@lazySingleton
class BleDevicesDiscoverer {
  final PermissionHandler _permissionHandler;
  final AppLogger _appLogger;

  StreamController<BleDiscoveredDevice>? _deviceDiscoveryStreamController;

  BleDevicesDiscoverer(this._permissionHandler, this._appLogger);

  final Map<String, String> _connectionPoolIds = {};

  Future<void> _checkBluetoothPermissions() async {
    if (!await _permissionHandler.hasBluetoothPermissions()) {
      final permissionStatus =
          await _permissionHandler.setBluetoothPermissions();
      if (permissionStatus != PermissionStatus.granted) {
        throw Exception('Bluetooth permissions not granted.');
      }
    }
  }

  void _cacheConnectionPoolId(
      String deviceId, Map<int, List<int>> manufacturerData) {
    final connectionPoolId = _getConnectionPoolIdFromManufacturerData(
      manufacturerData,
    );
    if (connectionPoolId.isNotEmpty) {
      _connectionPoolIds[deviceId] = connectionPoolId;
    }
  }

  Future<void> startDiscovery() async {
    try {
      bool isBluetoothEnabled = await _ensureBluetoothEnabledOrListen();
      if (!isBluetoothEnabled) {
        // Bluetooth is off and we are waiting for it to turn on
        return;
      }

      await _checkBluetoothPermissions();

      if (FlutterBluePlus.isScanningNow) {
        await stopDiscovery();
      }

      _deviceDiscoveryStreamController ??=
          StreamController<BleDiscoveredDevice>();

      await FlutterBluePlus.startScan(
        removeIfGone: const Duration(seconds: 2),
        continuousUpdates: true,
        withServices: [
          Guid(scannerServiceUuid),
        ],
        androidScanMode: AndroidScanMode.lowPower,
      );

      FlutterBluePlus.scanResults.listen((results) {
        for (final result in results) {
          final deviceId = result.device.remoteId.str;

          _cacheConnectionPoolId(
              deviceId, result.advertisementData.manufacturerData);

          final discoveredDevice = BleDiscoveredDevice(
            name: result.device.platformName,
            deviceId: deviceId,
            rssi: result.rssi,
            timeStamp: DateTime.now(),
            connectionPoolId: _connectionPoolIds.containsKey(deviceId)
                ? _connectionPoolIds[deviceId]!
                : '',
          );
          if (_isValidDeviceName(discoveredDevice.name)) {
            _deviceDiscoveryStreamController!.add(discoveredDevice);
          }
        }
      });
    } catch (e) {
      _appLogger.error('Failed to start BLE discovery: $e');
      throw Exception('Failed to start BLE discovery: $e');
    }
  }

  Future<bool> _ensureBluetoothEnabledOrListen() async {
    final adapterState = await FlutterBluePlus.adapterState.first;

    if (adapterState == BluetoothAdapterState.off) {
      _appLogger.error('Bluetooth is not enabled. Waiting for it to turn on.');

      FlutterBluePlus.adapterState.listen((state) async {
        _appLogger.error('Bluetooth state changed to: $state');
        if (state == BluetoothAdapterState.on) {
          _appLogger.info('Bluetooth is enabled. Starting discovery.');
          await startDiscovery(); // Start discovery when Bluetooth turns on
        }
      });

      return false;
    }

    return true;
  }

  String _getConnectionPoolIdFromManufacturerData(
      Map<int, List<int>> manufacturerData) {
    if (manufacturerData.isNotEmpty) {
      final firstKey = manufacturerData.keys.first;
      final dataList = manufacturerData[firstKey];

      if (dataList != null && dataList.length >= 2) {
        final connectionPoolIdBuffer = StringBuffer();
        for (int i = 0; i < 2; i++) {
          final byte = dataList[i];
          final leastSigHex = byte & 0x0F;
          final mostSigHex = (byte & 0xF0) >> 4;
          connectionPoolIdBuffer.write(mostSigHex.toRadixString(16));
          connectionPoolIdBuffer.write(leastSigHex.toRadixString(16));
        }
        return connectionPoolIdBuffer.toString();
      }
    }
    return '';
  }

  Future<void> stopDiscovery() async {
    try {
      await FlutterBluePlus.stopScan();
      await _deviceDiscoveryStreamController?.close();
      _deviceDiscoveryStreamController = null;
    } catch (e) {
      _appLogger.error('Failed to stop BLE discovery: $e');
      throw Exception('Failed to stop BLE discovery: $e');
    }
  }

  Stream<BleDiscoveredDevice> get bleDeviceStream {
    if (_deviceDiscoveryStreamController != null) {
      return _deviceDiscoveryStreamController!.stream;
    }
    throw Exception(
        'BLE discovery has not been started. Please call startDiscovery() before accessing the stream and ensure Bluetooth is enabled.');
  }

  bool _isValidDeviceName(String deviceName) {
    return deviceName.trim().isNotEmpty;
  }

  Future<void> dispose() async {
    await stopDiscovery();
  }
}