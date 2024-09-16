import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/entities/ble_discovered_device.dart';
import 'package:opticonnect_sdk/src/constants/ble_constants.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/services/permission_handler.dart';
import 'package:permission_handler/permission_handler.dart';

@lazySingleton
class BleDevicesDiscoverer {
  final PermissionHandler _permissionHandler;
  final AppLogger _appLogger;

  StreamController<BleDiscoveredDevice>? _deviceDiscoveryStreamController;

  BleDevicesDiscoverer(this._permissionHandler, this._appLogger);

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
      final adapterState = await FlutterBluePlus.adapterState.first;
      if (adapterState != BluetoothAdapterState.on) {
        throw Exception('Bluetooth is not enabled.');
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
          final discoveredDevice = BleDiscoveredDevice(
            name: result.device.platformName,
            deviceId: result.device.remoteId.toString(),
            rssi: result.rssi,
            timeStamp: DateTime.now(),
            connectionPoolId: _getConnectionPoolIdFromManufacturerData(
              result.advertisementData.manufacturerData,
            ),
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
        'BLE discovery has not been started. Please call startDiscovery() before accessing the stream.');
  }

  bool _isValidDeviceName(String deviceName) {
    return deviceName.trim().isNotEmpty;
  }

  Future<void> dispose() async {
    await stopDiscovery();
  }
}
