import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/src/constants/ble_constants.dart';
import 'package:opticonnect_sdk/src/entities/discovered_device.dart';
import 'package:opticonnect_sdk/src/services/permission_handler.dart';
import 'package:permission_handler/permission_handler.dart';

@lazySingleton
class BleManager {
  final PermissionHandler _permissionHandler;
  StreamController<DiscoveredDevice>? _deviceDiscoveryStreamController;

  BleManager(this._permissionHandler);

  Future<void> _checkBluetoothPermissions() async {
    if (!await _permissionHandler.hasBluetoothPermissions()) {
      final permissionStatus =
          await _permissionHandler.setBluetoothPermissions();
      if (permissionStatus != PermissionStatus.granted) {
        throw Exception('Bluetooth permissions not granted.');
      }
    }
  }

  /// Starts BLE discovery with the specified service UUID.
  Future<void> startDiscovery() async {
    try {
      await _checkBluetoothPermissions();

      // Check if a scan is already running and stop it
      if (FlutterBluePlus.isScanningNow) {
        await stopDiscovery(); // Ensure any ongoing scan is stopped first
      }

      // Initialize the StreamController if it isn't already initialized
      _deviceDiscoveryStreamController ??= StreamController<DiscoveredDevice>();

      // Start BLE discovery
      await FlutterBluePlus.startScan(
        removeIfGone: const Duration(seconds: 2),
        withServices: [
          Guid(scannerServiceUuid),
        ],
      );

      FlutterBluePlus.scanResults.listen((results) {
        for (final result in results) {
          final discoveredDevice = DiscoveredDevice(
            name: result.device.platformName,
            bluetoothId: result.device.remoteId.toString(),
            rssi: result.rssi,
            timeStamp: DateTime.now(),
          );

          if (_isValidDeviceName(discoveredDevice.name)) {
            // Add the discovered device to the stream
            _deviceDiscoveryStreamController!.add(discoveredDevice);
          }
        }
      });
    } catch (e) {
      print('Failed to start BLE discovery: $e');
      throw Exception('Failed to start BLE discovery: $e');
    }
  }

  /// Stops BLE discovery and cancels the discovery stream subscription.
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

  /// Provides a stream of discovered BLE devices.
  Stream<DiscoveredDevice> get bleDeviceStream {
    if (_deviceDiscoveryStreamController != null) {
      return _deviceDiscoveryStreamController!.stream;
    }
    throw Exception(
        'BLE discovery has not been started. Please call startDiscovery() before accessing the stream.');
  }

  /// Checks if the device name is valid.
  bool _isValidDeviceName(String deviceName) {
    return deviceName.trim().isNotEmpty;
  }
}
