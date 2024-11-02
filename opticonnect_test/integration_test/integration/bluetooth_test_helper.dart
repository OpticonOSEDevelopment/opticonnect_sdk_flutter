import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:opticonnect_sdk/entities/entities.dart';
import 'package:opticonnect_sdk/enums/enums.dart';
import 'package:opticonnect_sdk/opticonnect.dart';
import 'package:permission_handler/permission_handler.dart';

/// A utility mixin for Bluetooth tests to handle setup, teardown, and common functions.
mixin BluetoothTestHelper {
  static const testDeviceMacAddress = "38:89:DC:0E:00:4F";

  Future<void> globalSetup() async {
    await Permission.bluetooth.request();
    await Permission.locationWhenInUse.request();

    // Initialize and start discovery
    await OptiConnect.initialize();
    await OptiConnect.bluetoothManager.startDiscovery();
    OptiConnect.scannerFeedback
        .set(led: false, buzzer: false, vibration: false);
  }

  Future<void> globalTeardown() async {
    await OptiConnect.bluetoothManager.stopDiscovery();
  }

  Future<void> setup() async {
    await OptiConnect.bluetoothManager.disconnect(testDeviceMacAddress);
    await waitForConnectionState(
      testDeviceMacAddress,
      BleDeviceConnectionState.disconnected,
      timeout: const Duration(seconds: 2),
    );
  }

  Future<void> teardown() async {
    await OptiConnect.bluetoothManager.disconnect(testDeviceMacAddress);
  }

  Future<BleDiscoveredDevice?> discoverDevice(String deviceId) async {
    final StreamController<BleDiscoveredDevice?> controller =
        StreamController<BleDiscoveredDevice?>();
    final subscription = OptiConnect.bluetoothManager.listenToDiscoveredDevices
        .listen((discoveredDevice) {
      if (discoveredDevice.deviceId == deviceId) {
        controller.add(discoveredDevice);
        controller.close();
      }
    });

    return controller.stream
        .timeout(const Duration(seconds: 60))
        .first
        .catchError((error) {
      subscription.cancel();
      return null;
    });
  }

  Future<bool> toggleDeviceConnectionState(
    String deviceId,
    BleDeviceConnectionState targetState, {
    required Duration timeout,
  }) async {
    final StreamController<BleDeviceConnectionState> connectionStateController =
        StreamController<BleDeviceConnectionState>();
    final subscription = OptiConnect.bluetoothManager
        .listenToConnectionState(deviceId)
        .listen((connectionState) {
      connectionStateController.add(connectionState);
    });

    if (targetState == BleDeviceConnectionState.connected) {
      await OptiConnect.bluetoothManager.connect(deviceId);
    } else if (targetState == BleDeviceConnectionState.disconnected) {
      await OptiConnect.bluetoothManager.disconnect(deviceId);
    } else {
      throw ArgumentError("Unsupported target state: $targetState");
    }

    try {
      return await connectionStateController.stream
              .firstWhere((state) => state == targetState)
              .timeout(timeout) ==
          targetState;
    } finally {
      await subscription.cancel();
      await connectionStateController.close();
    }
  }

  Future<void> waitForConnectionState(
      String deviceId, BleDeviceConnectionState expectedState,
      {required Duration timeout}) async {
    final connectionStateStream =
        OptiConnect.bluetoothManager.listenToConnectionState(deviceId);
    final connectionState = await connectionStateStream
        .firstWhere((state) => state == expectedState)
        .timeout(timeout,
            onTimeout: () => BleDeviceConnectionState.disconnected);
    expect(connectionState, expectedState,
        reason:
            "Device with MAC address $deviceId did not reach expected state $expectedState.");
  }
}
