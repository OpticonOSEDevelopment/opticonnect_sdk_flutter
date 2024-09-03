import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/entities/barcode_data.dart';
import 'package:opticonnect_sdk/enums/ble_device_connection_state.dart';
import 'package:opticonnect_sdk/src/services/ble_connection_states_service.dart';
import 'package:opticonnect_sdk/src/services/ble_devices_streams_handler.dart';

@lazySingleton
class BleConnectivityHandler {
  final BleConnectionStatesService _bleConnectionStatesService;
  final BleDevicesStreamsHandler _bleDevicesStreamsHandler;
  final Map<String, StreamSubscription<BluetoothConnectionState>?>
      _connectionStateSubscriptions = {};
  final Map<String, StreamSubscription<BarcodeData>?> _barcodeDataListeners =
      {};

  BleConnectivityHandler(
      this._bleConnectionStatesService, this._bleDevicesStreamsHandler);

  Future<void> connect(String deviceId) async {
    print('connect $deviceId');
    const int maxRetries = 3;
    int retryCount = 0;

    while (retryCount < maxRetries) {
      try {
        if (_bleConnectionStatesService.isConnecting(deviceId) ||
            _bleConnectionStatesService.isConnected(deviceId)) {
          return;
        }

        _bleConnectionStatesService.setConnectionState(
            deviceId,
            // ignore: deprecated_member_use
            BluetoothConnectionState.connecting);
        final bleDevice = BluetoothDevice.fromId(deviceId);

        await bleDevice.connect();

        _listenToConnectionStateUpdates(bleDevice);
        return;
      } catch (e) {
        retryCount++;
        print('Failed to connect to device: $e');
        if (retryCount >= maxRetries) {
          _bleConnectionStatesService.setConnectionState(
              deviceId, BluetoothConnectionState.disconnected);
          print('Max retry attempts reached. Giving up.');
          throw Exception(
              'Failed to connect to device $deviceId after $retryCount attempts: $e');
        } else {
          print('Retrying connection... Attempt $retryCount of $maxRetries');
          _bleConnectionStatesService.setConnectionState(
              deviceId, BluetoothConnectionState.disconnected);
          await Future.delayed(const Duration(milliseconds: 500));
        }
      }
    }
  }

  Future<void> _listenToConnectionStateUpdates(BluetoothDevice device) async {
    final deviceId = device.remoteId.str;

    await _connectionStateSubscriptions[deviceId]?.cancel();

    _connectionStateSubscriptions[deviceId] =
        device.connectionState.listen((BluetoothConnectionState state) async {
      _bleConnectionStatesService.setConnectionState(deviceId, state);

      print('now state: $state');

      switch (state) {
        case BluetoothConnectionState.connected:
          await startListeningToBarcodeDataStream(deviceId);
          break;
        case BluetoothConnectionState.disconnected:
          await _processDisconnect(device);
          break;
        default:
          break;
      }
    });
  }

  Future<void> startListeningToBarcodeDataStream(String deviceId) async {
    try {
      final barcodeDataStream =
          await _bleDevicesStreamsHandler.getBarcodeDataStream(deviceId);

      _barcodeDataListeners[deviceId] = barcodeDataStream.listen((barcodeData) {
        print(
            'Received barcode data from device $deviceId: ${barcodeData.data}');
      });

      print('Started listening to barcode data stream for device $deviceId');
    } catch (e) {
      print(
          'Failed to start listening to barcode data stream for device $deviceId: $e');
      throw Exception(
          'Failed to start listening to barcode data stream for device $deviceId: $e');
    }
  }

  Stream<BleDeviceConnectionState> listenToConnectionState(String deviceId) {
    return _bleConnectionStatesService.connectionStateStream(deviceId).map(
      (BluetoothConnectionState state) {
        return mapBluetoothConnectionState(state);
      },
    );
  }

  BleDeviceConnectionState getConnectionState(String deviceId) {
    return mapBluetoothConnectionState(
        _bleConnectionStatesService.getConnectionState(deviceId));
  }

  Future<void> _processDisconnect(BluetoothDevice device) async {
    print('process disconnect...');
    await _connectionStateSubscriptions[device.remoteId.str]?.cancel();
    _connectionStateSubscriptions.remove(device.remoteId.str);

    await _barcodeDataListeners[device.remoteId.str]?.cancel();
    _barcodeDataListeners.remove(device.remoteId.str);

    _bleDevicesStreamsHandler.removeDataProcessor(device.remoteId.str);
  }

  Future<void> disconnect(String deviceId) async {
    print('disconnect $deviceId');
    if (_bleConnectionStatesService.isDisconnected(deviceId)) {
      return;
    }

    try {
      final bleDevice = BluetoothDevice.fromId(deviceId);

      _bleConnectionStatesService.setConnectionState(
          deviceId,
          // ignore: deprecated_member_use
          BluetoothConnectionState.disconnecting);

      await bleDevice.disconnect();

      print('disconnected');
    } catch (e) {
      print('Failed to disconnect from device: $e');
      throw Exception('Failed to disconnect from device $deviceId: $e');
    } finally {
      await _connectionStateSubscriptions[deviceId]?.cancel();
      _connectionStateSubscriptions.remove(deviceId);
    }
  }

  Future<void> dispose() async {
    for (final deviceId in _connectionStateSubscriptions.keys.toList()) {
      await disconnect(deviceId);
    }

    _bleConnectionStatesService.dispose();
  }
}
