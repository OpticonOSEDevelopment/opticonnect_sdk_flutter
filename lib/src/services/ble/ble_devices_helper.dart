import 'dart:io';

import 'package:flutter_blue_plus_windows/flutter_blue_plus_windows.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class BleDevicesHelper {
  BluetoothDevice getDeviceFromId(String deviceId) {
    var device = BluetoothDevice.fromId(deviceId);
    if (Platform.isWindows) {
      device = BluetoothDeviceWindows(
        remoteId: device.remoteId,
      );
    }
    return device;
  }
}
