import 'dart:async';

import 'package:flutter/material.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/barcode_data.dart';
import 'package:opticonnect_sdk/entities/ble_discovered_device.dart';
import 'package:opticonnect_sdk/entities/command_data.dart';
import 'package:opticonnect_sdk/enums/ble_device_connection_state.dart';
import 'package:opticonnect_sdk/enums/symbology_type.dart';
import 'package:opticonnect_sdk/opticonnect.dart';
import 'package:opticonnect_sdk/scanner_settings/read_options.dart';

/// Manages discovered devices, connection states, and scanner settings
class DevicesManager extends ChangeNotifier {
  final Map<String, BleDiscoveredDevice> discoveredDevices = {};
  final Map<String, BleDeviceConnectionState> connectionStates = {};
  final List<BarcodeData> barcodeData = [];
  final Map<String, StreamSubscription> _connectionSubscriptions = {};
  final Map<String, StreamSubscription> _barcodeSubscriptions = {};
  final Map<String, bool> floodlightStatus = {};
  final Map<String, bool> symbologyStatus = {};

  /// Initializes the OptiConnect SDK and starts discovering devices
  Future<void> initialize() async {
    await OptiConnect.initialize();
    OptiConnect.scannerFeedback.set(buzzer: true, led: true, vibration: true);
    await _startDiscovery();
  }

  /// Starts BLE device discovery and listens for new devices
  Future<void> _startDiscovery() async {
    await OptiConnect.bluetoothManager.startDiscovery();
    OptiConnect.bluetoothManager.bleDeviceStream.listen((device) {
      if (!_connectionSubscriptions.containsKey(device.deviceId)) {
        // New discovered device
        discoveredDevices[device.deviceId] = device;
        connectionStates[device.deviceId] =
            BleDeviceConnectionState.disconnected;
        _startListeningToConnectionState(device.deviceId);
        notifyListeners();
      }
    });
  }

  /// Starts listening to the connection state of the device
  void _startListeningToConnectionState(String deviceId) {
    if (_connectionSubscriptions.containsKey(deviceId)) {
      _connectionSubscriptions[deviceId]!.cancel();
    }
    _connectionSubscriptions[deviceId] = OptiConnect.bluetoothManager
        .listenToConnectionState(deviceId)
        .listen((state) {
      connectionStates[deviceId] = state;
      notifyListeners();
      if (state == BleDeviceConnectionState.connected) {
        _startListeningToBarcodeData(deviceId);
      } else if (state == BleDeviceConnectionState.disconnected) {
        _stopListeningToBarcodeData(deviceId);
      }
    });
  }

  /// Starts listening to the barcode data stream from the device
  void _startListeningToBarcodeData(String deviceId) async {
    if (!_barcodeSubscriptions.containsKey(deviceId)) {
      final barcodeStream = await OptiConnect.bluetoothManager
          .subscribeToBarcodeDataStream(deviceId);
      _barcodeSubscriptions[deviceId] = barcodeStream.listen((data) {
        barcodeData.add(data);
        notifyListeners();
      });
    }
  }

  /// Stops listening to barcode data when the device is disconnected
  void _stopListeningToBarcodeData(String deviceId) {
    if (_barcodeSubscriptions.containsKey(deviceId)) {
      _barcodeSubscriptions[deviceId]!.cancel();
      _barcodeSubscriptions.remove(deviceId);
    }
  }

  /// Toggles the floodlight setting of the device
  Future<void> toggleFloodlight(String deviceId) async {
    bool floodlightEnabled = floodlightStatus[deviceId] ?? false;
    if (!floodlightStatus.containsKey(deviceId)) {
      List<CommandData> settings =
          await OptiConnect.scannerSettings.getSettings(deviceId);
      floodlightEnabled =
          !settings.any((c) => c.command.contains(disableFloodlight));
    }

    await OptiConnect.scannerSettings.readOptions.setIlluminationMode(
        deviceId: deviceId,
        mode: floodlightEnabled
            ? IlluminationMode.disableFloodlight
            : IlluminationMode.enableFloodlight);
    floodlightStatus[deviceId] = !floodlightEnabled;
    notifyListeners();
  }

  /// Toggles a symbology (for example, EAN-13) for the device
  Future<void> toggleSymbology(String deviceId) async {
    final symbologyEnabled = symbologyStatus[deviceId] ?? true;
    await OptiConnect.scannerSettings.symbology.setSymbology(
        deviceId: deviceId,
        type: SymbologyType.ean13,
        enabled: !symbologyEnabled);
    symbologyStatus[deviceId] = !symbologyEnabled;
    notifyListeners();
  }

  @override
  void dispose() {
    for (var subscription in _connectionSubscriptions.values) {
      subscription.cancel();
    }
    for (var subscription in _barcodeSubscriptions.values) {
      subscription.cancel();
    }
    super.dispose();
  }
}
