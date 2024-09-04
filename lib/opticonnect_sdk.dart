library opticonnect_sdk;

import 'package:opticonnect_sdk/entities/barcode_data.dart';
import 'package:opticonnect_sdk/entities/ble_discovered_device.dart';
import 'package:opticonnect_sdk/enums/ble_device_connection_state.dart';
import 'package:opticonnect_sdk/src/injection/injection.config.dart';
import 'package:opticonnect_sdk/src/services/ble_services/ble_connectivity_handler.dart';
import 'package:opticonnect_sdk/src/services/ble_services/ble_devices_discoverer.dart';
import 'package:opticonnect_sdk/src/services/ble_services/ble_devices_streams_handler.dart';

class OptiConnectSDK {
  static OptiConnectSDK? _instance;
  late final BleDevicesDiscoverer _bleDevicesDiscoverer;
  late final BleConnectivityHandler _bleConnectivityHandler;
  late final BleDevicesStreamsHandler _bleDevicesStreamsHandler;

  static OptiConnectSDK get instance {
    _instance ??= OptiConnectSDK._internal();
    return _instance!;
  }

  OptiConnectSDK._internal() {
    _initialize();
  }

  void _initialize() {
    configureSdkDependencyInjection();
    _bleDevicesDiscoverer = getIt<BleDevicesDiscoverer>();
    _bleConnectivityHandler = getIt<BleConnectivityHandler>();
    _bleDevicesStreamsHandler = getIt<BleDevicesStreamsHandler>();
  }

  Future<void> startDiscovery() async {
    await _bleDevicesDiscoverer.startDiscovery();
  }

  Future<void> stopDiscovery() async {
    await _bleDevicesDiscoverer.stopDiscovery();
  }

  Stream<BleDiscoveredDevice> get bleDeviceStream async* {
    await for (final results in _bleDevicesDiscoverer.bleDeviceStream) {
      yield results;
    }
  }

  Stream<BleDeviceConnectionState> listenToConnectionState(String deviceId) {
    return _bleConnectivityHandler.listenToConnectionState(deviceId);
  }

  BleDeviceConnectionState getConnectionState(String deviceId) {
    return _bleConnectivityHandler.getConnectionState(deviceId);
  }

  Future<void> connect(String deviceId) async {
    await _bleConnectivityHandler.connect(deviceId);
  }

  Future<void> disconnect(String deviceId) async {
    await _bleConnectivityHandler.disconnect(deviceId);
  }

  Future<Stream<BarcodeData>> subscribeToBarcodeDataStream(
      String deviceId) async {
    return _bleDevicesStreamsHandler.getBarcodeDataStream(deviceId);
  }

  Future<void> dispose() async {
    await _bleConnectivityHandler.dispose();
    await _bleDevicesDiscoverer.dispose();
  }
}
