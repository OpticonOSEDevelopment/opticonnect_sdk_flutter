part of 'package:opticonnect_sdk/enums/enums.dart';

/// An enum representing the connection state of a BLE device.
enum BleDeviceConnectionState {
  /// The device is disconnected.
  disconnected,

  /// The device is in the process of connecting.
  connecting,

  /// The device is connected.
  connected,

  /// The device is in the process of disconnecting.
  disconnecting,
}
