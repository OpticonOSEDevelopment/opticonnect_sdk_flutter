part of 'package:opticonnect_sdk/entities.dart';

/// A class representing basic information about a BLE device.
/// This class holds the information fetched from a BLE device, such as
/// its MAC address, serial number, local name, and firmware version.
class DeviceInfo {
  /// The unique identifier (BLE device ID) for the device.
  final String deviceId;

  /// The MAC address of the device.
  final String macAddress;

  /// The serial number of the device.
  final String serialNumber;

  /// The local name (advertising name) of the device.
  final String localName;

  /// The firmware version of the device.
  final String firmwareVersion;

  /// Constructs a [DeviceInfo] instance with all relevant details about the device.
  DeviceInfo({
    required this.deviceId,
    required this.macAddress,
    required this.serialNumber,
    required this.localName,
    required this.firmwareVersion,
  });

  @override
  String toString() {
    return 'DeviceInfo(deviceId: $deviceId, macAddress: $macAddress, '
        'serialNumber: $serialNumber, localName: $localName, '
        'firmwareVersion: $firmwareVersion)';
  }
}
