import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/entities/ble_discovered_device.dart';
import 'package:opticonnect_sdk/src/constants/ble_constants.dart';
import 'package:opticonnect_sdk/src/services/permission_handler.dart';
import 'package:permission_handler/permission_handler.dart';

@lazySingleton
class BleDevicesDiscoverer {
  final PermissionHandler _permissionHandler;
  StreamController<BleDiscoveredDevice>? _deviceDiscoveryStreamController;

  BleDevicesDiscoverer(this._permissionHandler);

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
        withServices: [
          Guid(scannerServiceUuid),
        ],
      );

      FlutterBluePlus.scanResults.listen((results) {
        for (final result in results) {
          final discoveredDevice = BleDiscoveredDevice(
            name: result.device.platformName,
            deviceId: result.device.remoteId.toString(),
            rssi: result.rssi,
            timeStamp: DateTime.now(),
          );

          if (_isValidDeviceName(discoveredDevice.name)) {
            _deviceDiscoveryStreamController!.add(discoveredDevice);
          }
        }
      });
    } catch (e) {
      print('Failed to start BLE discovery: $e');
      throw Exception('Failed to start BLE discovery: $e');
    }
  }

  Future<void> stopDiscovery() async {
    try {
      await FlutterBluePlus.stopScan();
      await _deviceDiscoveryStreamController?.close();
      _deviceDiscoveryStreamController = null;
    } catch (e) {
      print('Failed to stop BLE discovery: $e');
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
