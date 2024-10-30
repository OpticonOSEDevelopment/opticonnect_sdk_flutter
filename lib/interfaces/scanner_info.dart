import 'package:opticonnect_sdk/entities/device_info.dart';

/// Provides information about a BLE scanner device.
///
/// This interface allows retrieval of details about a BLE scanner,
/// such as MAC address, serial number, local name, and firmware version.
abstract class ScannerInfo {
  /// Retrieves information about a BLE device.
  ///
  /// This method fetches the stored information about the device specified by [deviceId],
  /// including the MAC address, serial number, local name, and firmware version.
  ///
  /// [deviceId] - The unique identifier of the BLE device.
  ///
  /// Returns a [DeviceInfo] object containing detailed information about the device.
  DeviceInfo getInfo(String deviceId);
}
