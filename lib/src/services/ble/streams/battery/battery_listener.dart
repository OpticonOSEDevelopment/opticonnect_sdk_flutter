import 'dart:async';

import 'package:flutter_blue_plus_windows/flutter_blue_plus_windows.dart';
import 'package:opticonnect_sdk/entities/entities.dart';
import 'package:opticonnect_sdk/src/injection/injection.config.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/services/ble/streams/battery/constants/battery_level_status_flags.dart';

class BatteryListener {
  final BluetoothCharacteristic batteryLevelCharacteristic;
  final BluetoothCharacteristic batteryStatusCharacteristic;
  final String deviceId;
  final _appLogger = getIt<AppLogger>();

  late BatteryLevelStatus _latestBatteryStatus;
  late int _latestBatteryPercentage;

  final StreamController<BatteryLevelStatus> _batteryStatusStreamController =
      StreamController<BatteryLevelStatus>.broadcast();
  final StreamController<int> _batteryPercentageStreamController =
      StreamController<int>.broadcast();

  StreamSubscription<List<int>>? _batteryLevelSubscription;
  StreamSubscription<List<int>>? _batteryStatusSubscription;

  BatteryListener({
    required this.batteryLevelCharacteristic,
    required this.batteryStatusCharacteristic,
    required this.deviceId,
  });

  // Streams for external access
  Stream<BatteryLevelStatus> get batteryStatusStream =>
      _batteryStatusStreamController.stream;

  Stream<int> get batteryPercentageStream =>
      _batteryPercentageStreamController.stream;

  // Getters for the latest values
  BatteryLevelStatus get latestBatteryStatus => _latestBatteryStatus;
  int get latestBatteryPercentage => _latestBatteryPercentage;

  Future<void> initialize() async {
    try {
      await _initializeBatteryLevel();
      await _initializeBatteryStatus();

      await batteryLevelCharacteristic.setNotifyValue(true);
      _batteryLevelSubscription =
          batteryLevelCharacteristic.lastValueStream.listen((value) {
        if (value.isNotEmpty) {
          _latestBatteryPercentage = value.first;
          _batteryPercentageStreamController.add(_latestBatteryPercentage);
        }
      });

      await batteryStatusCharacteristic.setNotifyValue(true);
      _batteryStatusSubscription =
          batteryStatusCharacteristic.lastValueStream.listen((value) {
        if (value.isNotEmpty) {
          final batteryStatus = _parseBatteryLevelStatus(value);
          _latestBatteryStatus = batteryStatus;
          _batteryStatusStreamController.add(batteryStatus);
        }
      });
    } catch (e) {
      _appLogger.error('Failed to initialize battery listener: $e');
    }
  }

  Future<void> _initializeBatteryLevel() async {
    try {
      final List<int> value = await batteryLevelCharacteristic.read();
      if (value.isNotEmpty) {
        _latestBatteryPercentage = value.first;
      }
    } catch (e) {
      _appLogger.error('Error reading battery level: $e');
      _latestBatteryPercentage = 0;
    }
  }

  Future<void> _initializeBatteryStatus() async {
    try {
      final List<int> value = await batteryStatusCharacteristic.read();
      if (value.isNotEmpty) {
        _latestBatteryStatus = _parseBatteryLevelStatus(value);
      }
    } catch (e) {
      _appLogger.error('Error reading battery status: $e');
      _latestBatteryStatus = BatteryLevelStatus(
        isBatteryPresent: false,
        isWirelessCharging: false,
        isWiredCharging: false,
        isCharging: false,
        isBatteryFaulty: false,
        percentage: 0,
      );
    }
  }

  BatteryLevelStatus _parseBatteryLevelStatus(List<int> list) {
    final int powerState = (list[1] << 8) | list[2];

    return BatteryLevelStatus(
      isBatteryPresent: (powerState & bleBasBatteryPresentFlag) != 0,
      isWirelessCharging: (powerState & bleBasWirelessChargingFlag) != 0,
      isWiredCharging: (powerState & bleBasWiredChargingFlag) != 0,
      isCharging: (powerState & bleBasIsChargingFlag) != 0,
      isBatteryFaulty: (powerState & bleBasBatteryFaultFlag) != 0,
      percentage: ((list[0] & bleBasBatteryLevelFlag) != 0) ? list[3] : -1,
    );
  }

  void dispose() {
    _batteryLevelSubscription?.cancel();
    _batteryStatusSubscription?.cancel();
    _batteryStatusStreamController.close();
    _batteryPercentageStreamController.close();
  }
}
