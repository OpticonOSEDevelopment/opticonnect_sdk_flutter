import 'dart:async';

import 'package:flutter_blue_plus_windows/flutter_blue_plus_windows.dart';
import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/entities.dart';
import 'package:opticonnect_sdk/interfaces.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/services/ble/constants/ble_uuids.dart';
import 'package:opticonnect_sdk/src/services/core/permission_handler.dart';
import 'package:permission_handler/permission_handler.dart';

@lazySingleton
class BleDevicesDiscoverer {
  final PermissionHandler _permissionHandler;
  final ConnectionPool _connectionPool;
  final AppLogger _appLogger;

  StreamController<BleDiscoveredDevice>? _deviceDiscoveryStreamController =
      StreamController<BleDiscoveredDevice>.broadcast();

  BleDevicesDiscoverer(
      this._permissionHandler, this._connectionPool, this._appLogger);

  Future<void> _checkBluetoothPermissions() async {
    if (!await _permissionHandler.hasBluetoothPermissions()) {
      final permissionStatus =
          await _permissionHandler.setBluetoothPermissions();
      if (permissionStatus != PermissionStatus.granted) {
        throw Exception('Bluetooth permissions not granted.');
      }
    }
  }

  Future<void> startDiscovery() async {
    try {
      await _checkBluetoothPermissions();

      final isBluetoothEnabled = await _waitForBluetoothEnabled();
      if (!isBluetoothEnabled) {
        _appLogger
            .warning('Bluetooth is not enabled or ready. Aborting discovery.');
        return;
      }

      if (FlutterBluePlus.isScanningNow) {
        await stopDiscovery();
      }

      _deviceDiscoveryStreamController ??=
          StreamController<BleDiscoveredDevice>.broadcast();

      await FlutterBluePlus.startScan(
        removeIfGone: const Duration(seconds: 2),
        continuousUpdates: true,
        withServices: [Guid(scannerServiceUuid), Guid(opcServiceUuid)],
        androidScanMode: AndroidScanMode.lowPower,
      );

      _listenToScanResults();
    } catch (e) {
      _appLogger.error('Failed to start BLE discovery: $e');
      throw Exception('Failed to start BLE discovery: $e');
    }
  }

  Future<bool> _waitForBluetoothEnabled() async {
    final initialBluetoothState = await FlutterBluePlus.adapterState.first;

    if (initialBluetoothState == BluetoothAdapterState.on) {
      return true;
    }

    _appLogger.info('Waiting for Bluetooth to turn on...');

    try {
      await FlutterBluePlus.adapterState
          .where((state) => state == BluetoothAdapterState.on)
          .first
          .timeout(
        const Duration(seconds: 8),
        onTimeout: () {
          _appLogger.warning(
              'Bluetooth did not turn on in time. Proceeding with discovery attempt.');
          return BluetoothAdapterState
              .unknown; // Return unknown state if timeout occurs
        },
      );
      return true;
    } catch (e) {
      _appLogger.error('Error while waiting for Bluetooth: $e');
      return false;
    }
  }

  void _listenToScanResults() {
    FlutterBluePlus.scanResults.listen((results) {
      for (final result in results) {
        final deviceId = result.device.remoteId.str;

        // Cache the connection pool ID
        final poolId = _getConnectionPoolIdFromManufacturerData(
            result.advertisementData.manufacturerData);

        if (_connectionPool.getId(deviceId) != poolId && poolId.length == 4) {
          _connectionPool.cacheId(deviceId, poolId);
        }

        // Create a discovered device object
        final discoveredDevice = BleDiscoveredDevice(
          name: result.device.platformName,
          deviceId: deviceId,
          rssi: result.rssi,
          timeStamp: DateTime.now(),
          connectionPoolId: poolId,
        );

        // Validate the device name before adding it to the stream
        if (_isValidDeviceName(discoveredDevice.name)) {
          _deviceDiscoveryStreamController!.add(discoveredDevice);
        }
      }
    });
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
    if (_deviceDiscoveryStreamController != null &&
        !_deviceDiscoveryStreamController!.isClosed) {
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
