import 'package:flutter_blue_plus/flutter_blue_plus.dart';

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

/// Maps a [BluetoothConnectionState] from the Flutter Blue Plus library to a custom [BleDeviceConnectionState].
///
/// This function converts the connection state returned by Flutter Blue into a more readable custom enum.
///
/// - [state]: The [BluetoothConnectionState] provided by Flutter Blue.
/// - Returns: The corresponding [BleDeviceConnectionState] based on the [BluetoothConnectionState].
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
