import 'package:flutter_blue_plus/flutter_blue_plus.dart';

enum BleDeviceConnectionState {
  disconnected,
  connecting,
  connected,
  disconnecting,
}

BleDeviceConnectionState mapBluetoothConnectionState(
    BluetoothConnectionState state) {
  switch (state) {
    case BluetoothConnectionState.connected:
      return BleDeviceConnectionState.connected;
    case BluetoothConnectionState.disconnected:
      return BleDeviceConnectionState.disconnected;
    // ignore: deprecated_member_use
    case BluetoothConnectionState.connecting:
      return BleDeviceConnectionState.connecting;
    // ignore: deprecated_member_use
    case BluetoothConnectionState.disconnecting:
      return BleDeviceConnectionState.disconnecting;
    default:
      return BleDeviceConnectionState.disconnected;
  }
}
