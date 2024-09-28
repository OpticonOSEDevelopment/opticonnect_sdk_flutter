import 'dart:async';

import 'package:flutter_blue_plus_windows/flutter_blue_plus_windows.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class BleConnectionStatesService {
  final Map<String, StreamController<BluetoothConnectionState>>
      _connectionControllers = {};
  final Map<String, BluetoothConnectionState> _connectionStates = {};

  bool isConnected(String deviceId) {
    return _connectionStates[deviceId] == BluetoothConnectionState.connected;
  }

  bool isDisconnected(String deviceId) {
    return _connectionStates[deviceId] == BluetoothConnectionState.disconnected;
  }

  bool isConnecting(String deviceId) {
    // ignore: deprecated_member_use
    return _connectionStates[deviceId] == BluetoothConnectionState.connecting;
  }

  BluetoothConnectionState getConnectionState(String deviceId) {
    return _connectionStates[deviceId] ?? BluetoothConnectionState.disconnected;
  }

  void _setConnectionStateController(String deviceId) {
    if (!_connectionControllers.containsKey(deviceId)) {
      _connectionControllers[deviceId] =
          StreamController<BluetoothConnectionState>.broadcast();
    }
  }

  Stream<BluetoothConnectionState> connectionStateStream(String deviceId) {
    _setConnectionStateController(deviceId);
    return _connectionControllers[deviceId]!.stream;
  }

  void setConnectionState(String deviceId, BluetoothConnectionState state,
      {bool notifySubscribers = true}) {
    _setConnectionStateController(deviceId);
    _connectionControllers[deviceId]?.add(state);
    _connectionStates[deviceId] = state;
  }

  void closeConnectionController(String deviceId) {
    _connectionControllers[deviceId]?.close();
    _connectionControllers.remove(deviceId);
    _connectionStates.remove(deviceId);
  }

  void dispose() {
    _connectionControllers.forEach((deviceId, controller) {
      controller.close();
    });
    _connectionControllers.clear();
    _connectionStates.clear();
  }
}
