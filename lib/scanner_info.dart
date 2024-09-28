import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/entities/device_info.dart';
import 'package:opticonnect_sdk/src/services/core/devices_info_manager.dart';

/// A class that provides information about a BLE scanner device.
///
/// The [ScannerInfo] class is used to retrieve detailed information about
/// a BLE scanner, such as MAC address, serial number, local name, and firmware version.
@lazySingleton
class ScannerInfo {
  final DevicesInfoManager _devicesInfoManager;

  /// Constructs the [ScannerInfo] class with the necessary dependencies through dependency injection.
  ScannerInfo(this._devicesInfoManager);

  /// Retrieves information about a BLE device.
  ///
  /// This method fetches the stored information about the device specified by [deviceId],
  /// including the MAC address, serial number, local name, and firmware version.
  ///
  /// [deviceId] - The unique identifier of the BLE device.
  ///
  /// Returns a [DeviceInfo] object containing detailed information about the device.
  DeviceInfo getInfo(String deviceId) {
    return _devicesInfoManager.getInfo(deviceId);
  }
}
