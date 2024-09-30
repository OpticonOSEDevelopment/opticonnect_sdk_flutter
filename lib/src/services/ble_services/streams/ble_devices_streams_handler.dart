import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/src/services/ble_services/streams/battery/battery_handler.dart';
import 'package:opticonnect_sdk/src/services/ble_services/streams/data/data_handler.dart';

@lazySingleton
class BleDevicesStreamsHandler {
  final BatteryHandler batteryHandler;
  final DataHandler dataHandler;

  BleDevicesStreamsHandler(
    this.batteryHandler,
    this.dataHandler,
  );

  void dispose() {
    batteryHandler.dispose();
    dataHandler.dispose();
  }

  void disposeForDevice(String deviceId) {
    batteryHandler.disposeForDevice(deviceId);
    dataHandler.disposeForDevice(deviceId);
  }
}
