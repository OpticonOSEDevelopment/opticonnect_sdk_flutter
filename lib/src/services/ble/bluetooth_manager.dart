// src/ble_services/bluetooth_manager_impl.dart
import 'package:flutter_blue_plus_windows/flutter_blue_plus_windows.dart';
import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/entities/barcode_data.dart';
import 'package:opticonnect_sdk/entities/battery_level_status.dart';
import 'package:opticonnect_sdk/entities/ble_discovered_device.dart';
import 'package:opticonnect_sdk/enums/ble_adapter_state.dart';
import 'package:opticonnect_sdk/enums/ble_device_connection_state.dart';
import 'package:opticonnect_sdk/interfaces/bluetooth_manager.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/services/ble/ble_connectivity_handler.dart';
import 'package:opticonnect_sdk/src/services/ble/ble_devices_discoverer.dart';
import 'package:opticonnect_sdk/src/services/ble/streams/ble_devices_streams_handler.dart';

@LazySingleton(as: BluetoothManager)
class BluetoothManagerImpl implements BluetoothManager {
  final BleDevicesDiscoverer _bleDevicesDiscoverer;
  final BleConnectivityHandler _bleConnectivityHandler;
  final BleDevicesStreamsHandler _bleDevicesStreamsHandler;
  final AppLogger _appLogger;

  BluetoothManagerImpl(
    this._bleDevicesDiscoverer,
    this._bleConnectivityHandler,
    this._bleDevicesStreamsHandler,
    this._appLogger,
  );

  @override
  Stream<BleAdapterState> get adapterState => FlutterBluePlus.adapterState
      .map((state) => BleAdapterState.values[state.index]);

  @override
  bool get isScanning => FlutterBluePlus.isScanningNow;

  @override
  Stream<bool> get isScanningStream => FlutterBluePlus.isScanning;

  @override
  Future<bool> get isBluetoothAvailable async {
    return (await FlutterBluePlus.adapterState.first) ==
        BluetoothAdapterState.on;
  }

  @override
  Future<void> startDiscovery() async {
    try {
      await _bleDevicesDiscoverer.startDiscovery();
    } catch (e) {
      _appLogger.error("Error starting discovery: $e");
      rethrow;
    }
  }

  @override
  Future<void> stopDiscovery() async {
    try {
      await _bleDevicesDiscoverer.stopDiscovery();
    } catch (e) {
      _appLogger.error("Error stopping discovery: $e");
      rethrow;
    }
  }

  @override
  Stream<BleDiscoveredDevice> get bleDiscoveredDevicesStream async* {
    try {
      await for (final results in _bleDevicesDiscoverer.bleDeviceStream) {
        yield results;
      }
    } catch (e) {
      _appLogger.error("Error in bleDeviceStream: $e");
      rethrow;
    }
  }

  @override
  Future<void> connect(String deviceId) async {
    try {
      await _bleConnectivityHandler.connect(deviceId);
    } catch (e) {
      _appLogger.error("Error connecting to device $deviceId: $e");
      rethrow;
    }
  }

  @override
  Future<void> disconnect(String deviceId) async {
    try {
      await _bleConnectivityHandler.disconnect(deviceId);
    } catch (e) {
      _appLogger.error("Error disconnecting from device $deviceId: $e");
      rethrow;
    }
  }

  @override
  Stream<BleDeviceConnectionState> listenToConnectionState(String deviceId) {
    try {
      return _bleConnectivityHandler.listenToConnectionState(deviceId);
    } catch (e) {
      _appLogger.error("Error listening to connection state: $e");
      rethrow;
    }
  }

  @override
  Future<Stream<BarcodeData>> subscribeToBarcodeDataStream(
      String deviceId) async {
    try {
      return _bleDevicesStreamsHandler.dataHandler.getStream(deviceId);
    } catch (e) {
      _appLogger.error("Error subscribing to barcode data stream: $e");
      rethrow;
    }
  }

  @override
  Future<Stream<int>> subscribeToBatteryPercentageStream(
      String deviceId) async {
    try {
      return _bleDevicesStreamsHandler.batteryHandler
          .getBatteryPercentageStream(deviceId);
    } catch (e) {
      _appLogger.error("Error subscribing to battery percentage stream: $e");
      rethrow;
    }
  }

  @override
  Future<Stream<BatteryLevelStatus>> subscribeToBatteryStatusStream(
      String deviceId) async {
    try {
      return _bleDevicesStreamsHandler.batteryHandler
          .getBatteryStatusStream(deviceId);
    } catch (e) {
      _appLogger.error("Error subscribing to battery status stream: $e");
      rethrow;
    }
  }

  @override
  int getLatestBatteryPercentage(String deviceId) {
    try {
      return _bleDevicesStreamsHandler.batteryHandler
          .getLatestBatteryPercentage(deviceId);
    } catch (e) {
      _appLogger.error(
          'Error getting latest battery percentage for device $deviceId');
      rethrow;
    }
  }

  @override
  BatteryLevelStatus getLatestBatteryStatus(String deviceId) {
    try {
      return _bleDevicesStreamsHandler.batteryHandler
          .getLatestBatteryStatus(deviceId);
    } catch (e) {
      _appLogger
          .error('Error getting latest battery status for device $deviceId');
      rethrow;
    }
  }

  @override
  Future<void> dispose() async {
    try {
      await _bleConnectivityHandler.dispose();
      await _bleDevicesDiscoverer.dispose();
      _bleDevicesStreamsHandler.dispose();
    } catch (e) {
      _appLogger.error("Error disposing Bluetooth resources: $e");
      rethrow;
    }
  }
}
