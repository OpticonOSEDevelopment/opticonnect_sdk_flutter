import 'dart:async';

import 'package:flutter_blue_plus_windows/flutter_blue_plus_windows.dart';
import 'package:injectable/injectable.dart';
import 'package:mutex/mutex.dart';
import 'package:opticonnect_sdk/enums/ble_device_connection_state.dart';
import 'package:opticonnect_sdk/src/constants/ble_constants.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/services/ble_services/ble_connection_states_service.dart';
import 'package:opticonnect_sdk/src/services/ble_services/ble_devices_helper.dart';
import 'package:opticonnect_sdk/src/services/ble_services/ble_devices_streams_handler.dart';
import 'package:opticonnect_sdk/src/services/core/devices_info_manager.dart';
import 'package:opticonnect_sdk/src/services/scanner_commands_services/command_executors_manager.dart';

@lazySingleton
class BleConnectivityHandler {
  final BleConnectionStatesService _bleConnectionStatesService;
  final BleDevicesStreamsHandler _bleDevicesStreamsHandler;
  final BleDevicesHelper _bleDevicesHelper;
  final CommandExecutorsManager _commandExecutorsManager;
  final DevicesInfoManager _devicesInfoManager;
  final AppLogger _appLogger;
  final Map<String, StreamSubscription<BluetoothConnectionState>?>
      _connectionStateSubscriptions = {};
  final _connectionMutexes = <String, Mutex>{};

  BleConnectivityHandler(
      this._bleConnectionStatesService,
      this._bleDevicesStreamsHandler,
      this._bleDevicesHelper,
      this._commandExecutorsManager,
      this._devicesInfoManager,
      this._appLogger);

  Future<void> connect(String deviceId) async {
    _connectionMutexes.putIfAbsent(deviceId, () => Mutex());
    _connectionMutexes[deviceId]!.protect(() async {
      final bleDevice = _bleDevicesHelper.getDeviceFromId(deviceId);

      if (bleDevice.isConnected) {
        try {
          await bleDevice.disconnect();
        } catch (e) {
          _appLogger.error('Failed to disconnect from device: $e');
          throw Exception('Failed to disconnect from device $deviceId: $e');
        }
      }

      const int maxRetries = 3;
      int retryCount = 0;

      while (retryCount < maxRetries) {
        try {
          _bleConnectionStatesService.setConnectionState(
              deviceId,
              // ignore: deprecated_member_use
              BluetoothConnectionState.connecting);

          await bleDevice.connect(timeout: const Duration(seconds: 10));

          _listenToConnectionStateUpdates(bleDevice);
          return;
        } catch (e) {
          retryCount++;
          _appLogger.warning('Failed to connect to device: $e');
          if (retryCount >= maxRetries) {
            _bleConnectionStatesService.setConnectionState(
                deviceId, BluetoothConnectionState.disconnected);
            _appLogger.error('Max retry attempts reached. Giving up.');
            throw Exception(
                'Failed to connect to device $deviceId after $retryCount attempts: $e');
          } else {
            _appLogger.info(
                'Retrying connection... Attempt $retryCount of $maxRetries');
            _bleConnectionStatesService.setConnectionState(
                deviceId, BluetoothConnectionState.disconnected);
            await Future.delayed(const Duration(milliseconds: 500));
          }
        }
      }
    });
  }

  Future<void> _listenToConnectionStateUpdates(BluetoothDevice device) async {
    final deviceId = device.remoteId.str;

    await _connectionStateSubscriptions[deviceId]?.cancel();

    try {
      _connectionStateSubscriptions[deviceId] =
          device.connectionState.listen((BluetoothConnectionState state) async {
        bool notifySubscribers = true;
        switch (state) {
          case BluetoothConnectionState.connected:
            if (!await _initDevice(deviceId)) {
              state = BluetoothConnectionState.disconnected;
              notifySubscribers = false;
            }
            break;
          case BluetoothConnectionState.disconnected:
            await _processDisconnect(deviceId);
            break;
          default:
            break;
        }

        _bleConnectionStatesService.setConnectionState(deviceId, state,
            notifySubscribers: notifySubscribers);
      });
    } catch (e) {
      _appLogger.error(
          'Failed to listen to connection state updates for device $deviceId: $e');
      _processDisconnect(deviceId);
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

  Future<bool> _initDevice(String deviceId) async {
    try {
      final bleDevice = _bleDevicesHelper.getDeviceFromId(deviceId);

      final services = await bleDevice.discoverServices();
      BluetoothService? opcService;

      for (final service in services) {
        if (service.uuid.str128 == opcServiceUuid) {
          opcService = service;
          break;
        }
      }

      if (opcService == null) {
        await disconnect(deviceId);
        throw ('OPC service not found for device $deviceId');
      }

      await _bleDevicesStreamsHandler.addDataProcessor(deviceId, opcService);
      _commandExecutorsManager.createCommandExecutor(deviceId);
      await _devicesInfoManager.fetchInfo(deviceId);
    } catch (e) {
      _appLogger.error('Failed to initialize device $deviceId: $e');
      await disconnect(deviceId);
      return false;
    }
    return true;
  }

  Future<void> disconnect(String deviceId) async {
    if (_bleConnectionStatesService.isDisconnected(deviceId)) {
      return;
    }

    try {
      final bleDevice = _bleDevicesHelper.getDeviceFromId(deviceId);

      _bleConnectionStatesService.setConnectionState(
          deviceId,
          // ignore: deprecated_member_use
          BluetoothConnectionState.disconnecting);

      await bleDevice.disconnect();
    } catch (e) {
      _appLogger.error('Failed to disconnect from device: $e');
      throw Exception('Failed to disconnect from device $deviceId: $e');
    } finally {
      await _connectionStateSubscriptions[deviceId]?.cancel();
      _connectionStateSubscriptions.remove(deviceId);
      await _processDisconnect(deviceId);
    }
  }

  Future<void> _processDisconnect(String deviceId) async {
    _commandExecutorsManager.disposeCommandExecutor(deviceId);
    await _connectionStateSubscriptions[deviceId]?.cancel();
    _connectionStateSubscriptions.remove(deviceId);

    _bleDevicesStreamsHandler.removeDataProcessor(deviceId);
  }

  Future<void> dispose() async {
    for (final deviceId in _connectionStateSubscriptions.keys.toList()) {
      await disconnect(deviceId);
    }

    _bleConnectionStatesService.dispose();
  }
}
