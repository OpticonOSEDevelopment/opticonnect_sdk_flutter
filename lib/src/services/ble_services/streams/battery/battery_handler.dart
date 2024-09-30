import 'package:flutter_blue_plus_windows/flutter_blue_plus_windows.dart';
import 'package:injectable/injectable.dart';
import 'package:mutex/mutex.dart';
import 'package:opticonnect_sdk/entities/battery_level_status.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/services/ble_services/constants/ble_uuids.dart';
import 'package:opticonnect_sdk/src/services/ble_services/streams/battery/battery_listener.dart';

@lazySingleton
class BatteryHandler {
  final AppLogger _appLogger;
  final Map<String, BatteryListener> _batteryListeners = {};
  final Mutex _mutex = Mutex();

  BatteryHandler(this._appLogger);

  Future<Stream<int>> getBatteryPercentageStream(String deviceId) async {
    final batteryListener = _getBatteryListener(deviceId);
    if (batteryListener == null) {
      _appLogger.error('Battery listener not found for device: $deviceId');
      return const Stream.empty();
    }
    return batteryListener.batteryPercentageStream;
  }

  Future<Stream<BatteryLevelStatus>> getBatteryStatusStream(
      String deviceId) async {
    final batteryListener = _getBatteryListener(deviceId);
    if (batteryListener == null) {
      _appLogger.error('Battery listener not found for device: $deviceId');
      return const Stream.empty();
    }
    return batteryListener.batteryStatusStream;
  }

  int getLatestBatteryPercentage(String deviceId) {
    final batteryListener = _getBatteryListener(deviceId);
    if (batteryListener == null) {
      _appLogger.error('Battery listener not found for device: $deviceId');
      return -1;
    }
    return batteryListener.latestBatteryPercentage;
  }

  BatteryLevelStatus getLatestBatteryStatus(String deviceId) {
    final batteryListener = _getBatteryListener(deviceId);
    if (batteryListener == null) {
      _appLogger.error('Battery listener not found for device: $deviceId');
      return BatteryLevelStatus(
        isBatteryPresent: false,
        isWirelessCharging: false,
        isWiredCharging: false,
        isCharging: false,
        isBatteryFaulty: false,
        percentage: -1,
      ); // Default status
    }
    return batteryListener.latestBatteryStatus;
  }

  Future<BatteryListener> addBatteryListener(
    String deviceId,
    BluetoothService batteryService,
  ) async {
    try {
      await _mutex.protect(() async {
        // Fetch the battery characteristics
        final batteryLevelCharacteristic =
            batteryService.characteristics.firstWhere(
          (c) => c.uuid.str128 == batteryLevelCharacteristicUuid,
          orElse: () =>
              throw Exception('Battery level characteristic not found'),
        );

        final batteryStatusCharacteristic =
            batteryService.characteristics.firstWhere(
          (c) => c.uuid.str128 == batteryLevelStatusCharacteristicUuid,
          orElse: () =>
              throw Exception('Battery status characteristic not found'),
        );

        // Create and initialize the BatteryListener
        final batteryListener = BatteryListener(
          batteryLevelCharacteristic: batteryLevelCharacteristic,
          batteryStatusCharacteristic: batteryStatusCharacteristic,
          deviceId: deviceId,
        );

        await batteryListener.initialize();

        _batteryListeners[deviceId] = batteryListener;
      });
      return _batteryListeners[deviceId]!;
    } catch (e) {
      final msg =
          'Failed to initialize battery listener for device $deviceId: $e';
      _appLogger.error(msg);
      throw Exception(msg);
    }
  }

  void removeBatteryListener(String deviceId) {
    _batteryListeners.remove(deviceId);
  }

  BatteryListener? _getBatteryListener(String deviceId) {
    return _batteryListeners[deviceId];
  }

  void dispose() {
    for (var listener in _batteryListeners.values) {
      listener.dispose();
    }
    _batteryListeners.clear();
  }

  void disposeForDevice(String deviceId) {
    if (_batteryListeners.containsKey(deviceId)) {
      _batteryListeners[deviceId]!.dispose();
      _batteryListeners.remove(deviceId);
    }
  }
}
