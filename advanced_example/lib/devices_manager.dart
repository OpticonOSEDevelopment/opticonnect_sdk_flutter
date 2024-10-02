import 'dart:async';

import 'package:flutter/material.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/barcode_data.dart';
import 'package:opticonnect_sdk/entities/battery_level_status.dart';
import 'package:opticonnect_sdk/entities/ble_discovered_device.dart';
import 'package:opticonnect_sdk/entities/command_data.dart';
import 'package:opticonnect_sdk/entities/device_info.dart';
import 'package:opticonnect_sdk/enums/ble_adapter_state.dart';
import 'package:opticonnect_sdk/enums/ble_device_connection_state.dart';
import 'package:opticonnect_sdk/enums/symbology_type.dart';
import 'package:opticonnect_sdk/opticonnect.dart';
import 'package:opticonnect_sdk/scanner_settings/read_options.dart';

/// Manages discovered devices, connection states, and scanner settings
class DevicesManager extends ChangeNotifier {
  final Map<String, BleDiscoveredDevice> discoveredDevices = {};
  final Map<String, BleDeviceConnectionState> connectionStates = {};
  final Map<String, DeviceInfo> deviceInfo = {};
  final Map<String, StreamSubscription> _connectionSubscriptions = {};
  final Map<String, StreamSubscription> _barcodeSubscriptions = {};
  final Map<String, List<BarcodeData>> receivedBarcodeData = {};
  final Map<String, bool> floodlightStatus = {};
  final Map<String, bool> symbologyStatus = {};

  // Battery related data
  final Map<String, int> batteryPercentages = {};
  final Map<String, BatteryLevelStatus> batteryStatuses = {};
  final Map<String, StreamSubscription<int>> _batteryPercentageSubscriptions =
      {};
  final Map<String, StreamSubscription<BatteryLevelStatus>>
      _batteryStatusSubscriptions = {};

  StreamSubscription? _bleDevicesDiscoveryStream;
  StreamSubscription<BleAdapterState>? _adapterStateStream;

  /// Initializes the OptiConnect SDK and starts discovering devices
  Future<void> initialize() async {
    await OptiConnect.initialize();
    OptiConnect.scannerFeedback.set(buzzer: true, led: true, vibration: true);
    await Future.delayed(const Duration(seconds: 5));
    await _startDiscovery();
  }

  /// Connect to the selected BLE device
  Future<void> connect(String deviceId) async {
    await OptiConnect.bluetoothManager.connect(deviceId);
  }

  /// Disconnect from the selected BLE device
  Future<void> disconnect(String deviceId) async {
    OptiConnect.bluetoothManager.disconnect(deviceId);
  }

  Future<void> startDiscovery() async {
    await OptiConnect.bluetoothManager.startDiscovery();
  }

  /// Starts BLE device discovery when BLE is enabled and listens for new devices
  Future<void> _startDiscovery() async {
    _adapterStateStream?.cancel();
    _adapterStateStream =
        OptiConnect.bluetoothManager.adapterState.listen((state) async {
      if (state == BleAdapterState.on || state == BleAdapterState.unknown) {
        await OptiConnect.bluetoothManager.startDiscovery();
        _bleDevicesDiscoveryStream = OptiConnect
            .bluetoothManager.bleDiscoveredDevicesStream
            .listen((device) {
          if (!_connectionSubscriptions.containsKey(device.deviceId)) {
            discoveredDevices[device.deviceId] = device;
            connectionStates[device.deviceId] =
                BleDeviceConnectionState.disconnected;
            _startListeningToConnectionState(device.deviceId);
            notifyListeners();
          }
        });
        _adapterStateStream?.cancel();
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
        deviceInfo[deviceId] = OptiConnect.scannerInfo.getInfo(deviceId);
        _startListeningToBarcodeData(deviceId);
        _startListeningToBatteryData(deviceId);
      } else if (state == BleDeviceConnectionState.disconnected) {
        _stopListeningToBarcodeData(deviceId);
        _stopListeningToBatteryData(deviceId);
      }
    });
  }

  /// Starts listening to the barcode data stream from the device
  void _startListeningToBarcodeData(String deviceId) async {
    if (!_barcodeSubscriptions.containsKey(deviceId)) {
      receivedBarcodeData.putIfAbsent(deviceId, () => []);
      final barcodeStream = await OptiConnect.bluetoothManager
          .subscribeToBarcodeDataStream(deviceId);
      _barcodeSubscriptions[deviceId] = barcodeStream.listen((data) {
        receivedBarcodeData[deviceId]!.add(data);
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

  /// Starts listening to battery data streams (percentage and status)
  void _startListeningToBatteryData(String deviceId) async {
    // Battery percentage
    final batteryPercentageStream = await OptiConnect.bluetoothManager
        .subscribeToBatteryPercentageStream(deviceId);
    _batteryPercentageSubscriptions[deviceId] =
        batteryPercentageStream.listen((percentage) {
      batteryPercentages[deviceId] = percentage;
      notifyListeners();
    });
    batteryPercentages[deviceId] =
        OptiConnect.bluetoothManager.getLatestBatteryPercentage(deviceId);

    // Battery status
    final batteryStatusStream = await OptiConnect.bluetoothManager
        .subscribeToBatteryStatusStream(deviceId);
    _batteryStatusSubscriptions[deviceId] =
        batteryStatusStream.listen((status) {
      batteryStatuses[deviceId] = status;
      notifyListeners();
    });
    batteryStatuses[deviceId] =
        OptiConnect.bluetoothManager.getLatestBatteryStatus(deviceId);
  }

  /// Stops listening to battery data when the device is disconnected
  void _stopListeningToBatteryData(String deviceId) {
    _batteryPercentageSubscriptions[deviceId]?.cancel();
    _batteryStatusSubscriptions[deviceId]?.cancel();
    _batteryPercentageSubscriptions.remove(deviceId);
    _batteryStatusSubscriptions.remove(deviceId);
  }

  /// Disposes the subscriptions and OptiConnect SDK
  @override
  Future<void> dispose() async {
    await OptiConnect.dispose();
    for (final subscription in _connectionSubscriptions.values) {
      subscription.cancel();
    }
    for (final subscription in _barcodeSubscriptions.values) {
      subscription.cancel();
    }
    for (final subscription in _batteryPercentageSubscriptions.values) {
      subscription.cancel();
    }
    for (final subscription in _batteryStatusSubscriptions.values) {
      subscription.cancel();
    }
    _bleDevicesDiscoveryStream?.cancel();
    super.dispose();
  }
}
