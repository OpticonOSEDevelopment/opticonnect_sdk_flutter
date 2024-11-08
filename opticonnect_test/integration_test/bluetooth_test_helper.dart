import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:opticonnect_sdk/entities.dart';
import 'package:opticonnect_sdk/enums.dart';
import 'package:opticonnect_sdk/opticonnect.dart';
import 'package:permission_handler/permission_handler.dart';

/// A utility mixin for Bluetooth tests to handle setup, teardown, and common functions.
mixin BluetoothTestHelper {
  static const testDeviceMacAddress = "38:89:DC:0E:00:4F";
  StreamSubscription<BleDiscoveredDevice>? bleDiscoverySubscription;
  StreamSubscription<BleDeviceConnectionState>? connectionStateSubscription;

  Future<void> globalSetup() async {
    await Permission.bluetooth.request();
    await Permission.locationWhenInUse.request();

    // Initialize and start discovery
    await OptiConnect.initialize();
    await OptiConnect.bluetoothManager.startDiscovery();
    OptiConnect.scannerFeedback
        .set(led: false, buzzer: false, vibration: false);

    print('BluetoothTestHelper.globalSetup() completed');
  }

  Future<void> globalTeardown() async {
    print('BluetoothTestHelper.globalTeardown() started');
    await OptiConnect.bluetoothManager.stopDiscovery();
    print('BluetoothTestHelper.globalTeardown() completed');
  }

  Future<void> setup() async {
    await OptiConnect.bluetoothManager.disconnect(testDeviceMacAddress);
    await waitForConnectionState(
      testDeviceMacAddress,
      BleDeviceConnectionState.disconnected,
      timeout: const Duration(seconds: 2),
    );
    print('BluetoothTestHelper.setup() completed');
  }

  Future<void> teardown() async {
    print('BluetoothTestHelper.teardown() started');
    if (bleDiscoverySubscription != null) {
      await bleDiscoverySubscription?.cancel();
      bleDiscoverySubscription = null;
    }

    if (connectionStateSubscription != null) {
      await connectionStateSubscription?.cancel();
      connectionStateSubscription = null;
    }

    // Disconnect the device after all subscriptions are canceled
    await OptiConnect.bluetoothManager.disconnect(testDeviceMacAddress);
    print('BluetoothTestHelper.teardown() completed');
  }

  Future<BleDiscoveredDevice?> discoverDevice(String deviceId) async {
    final StreamController<BleDiscoveredDevice?> controller =
        StreamController<BleDiscoveredDevice?>();

    // Assign the subscription globally, convert to broadcast stream for multiple listeners
    bleDiscoverySubscription = OptiConnect
        .bluetoothManager.listenToDiscoveredDevices
        .listen((discoveredDevice) {
      if (discoveredDevice.deviceId == deviceId) {
        controller.add(discoveredDevice);
        bleDiscoverySubscription?.cancel(); // Cancel to stop further events
      }
    });

    // Return the first event or null if timed out
    return controller.stream
        .timeout(const Duration(seconds: 60))
        .first
        .catchError((error) {
      bleDiscoverySubscription
          ?.cancel(); // Ensure subscription is canceled on error
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

    await Future.delayed(const Duration(seconds: 2));

    // Assign the connection subscription globally, convert to broadcast stream for multiple listeners
    connectionStateSubscription = OptiConnect.bluetoothManager
        .listenToConnectionState(deviceId)
        .asBroadcastStream() // Convert to broadcast
        .listen((connectionState) {
      connectionStateController.add(connectionState);
    });

    if (targetState == BleDeviceConnectionState.connected) {
      await retry(() => OptiConnect.bluetoothManager.connect(deviceId));
    } else if (targetState == BleDeviceConnectionState.disconnected) {
      await retry(() => OptiConnect.bluetoothManager.disconnect(deviceId));
    } else {
      throw ArgumentError("Unsupported target state: $targetState");
    }

    try {
      return await connectionStateController.stream
              .firstWhere((state) => state == targetState)
              .timeout(timeout) ==
          targetState;
    } finally {
      await connectionStateSubscription?.cancel();
      await connectionStateController.close();
      connectionStateSubscription = null; // Reset subscription after use
    }
  }

  /// Retries the provided action with a delay between each attempt.
  Future<void> retry(Future<void> Function() action,
      {int retries = 3, Duration delay = const Duration(seconds: 2)}) async {
    for (var attempt = 0; attempt < retries; attempt++) {
      try {
        await action();
        return;
      } catch (e) {
        if (attempt == retries - 1) rethrow;
        await Future.delayed(delay * (attempt + 1)); // Exponential backoff
      }
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
