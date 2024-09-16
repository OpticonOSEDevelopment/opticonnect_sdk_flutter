/// A class representing a BLE device discovered during scanning.
///
/// This class contains information about the device such as its name, unique device ID,
/// signal strength (RSSI), the time it was discovered, and the connection pool ID.
class BleDiscoveredDevice {
  /// The name of the BLE device.
  ///
  /// This is the name that the BLE device advertises.
  final String name;

  /// The unique identifier for the BLE device.
  ///
  /// A unique string (e.g., a MAC address or UUID) used to identify the device.
  final String deviceId;

  /// The signal strength of the BLE device, represented as RSSI (Received Signal Strength Indicator).
  ///
  /// The RSSI value indicates the strength of the signal from the BLE device, with higher values
  /// indicating a stronger signal.
  final int rssi;

  /// The timestamp when the device was discovered.
  ///
  /// This records the exact time when the device was discovered during the scanning process,
  /// useful for tracking scan events.
  final DateTime timeStamp;

  /// The connection pool ID associated with the device.
  ///
  /// The connection pool ID is a 4-character hexadecimal identifier used in connection pooling,
  /// which allows for automatic and exclusive connections to a device. It ensures that a scanner
  /// connects only to devices that match its connection pool ID.
  ///
  /// It is important to note that the client is responsible for filtering devices based on the
  /// connection pool ID retrieved in this object and comparing it with the expected ID in their
  /// application. The connection pool ID can be set using the `ConnectionPoolSettings` class,
  /// which allows you to configure or reset the pool ID for a scanner.
  final String connectionPoolId;

  /// Constructs a [BleDiscoveredDevice] instance with the provided information.
  ///
  /// - [name]: The name of the BLE device.
  /// - [deviceId]: The unique identifier of the BLE device.
  /// - [rssi]: The signal strength (RSSI) of the BLE device.
  /// - [timeStamp]: The time the device was discovered.
  /// - [connectionPoolId]: The connection pool ID of the device.
  BleDiscoveredDevice({
    required this.name,
    required this.deviceId,
    required this.rssi,
    required this.timeStamp,
    required this.connectionPoolId,
  });
}
