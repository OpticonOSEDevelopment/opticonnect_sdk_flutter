part of 'package:opticonnect_sdk/interfaces/interfaces.dart';

/// Manages connection pool settings for BLE devices.
///
/// Connection Pooling allows exclusive connections of scanners to devices by using
/// a 4-character hexadecimal ID. This ensures secure, automatic connections in environments
/// with multiple scanners across different devices.
abstract class ConnectionPool {
  /// A list of reserved 4-character hexadecimal IDs that cannot be used for connection pooling.
  ///
  /// These IDs are predefined and should not be assigned to devices.
  List<String> get reservedIds;

  /// Sets the connection pool ID to the specified 4-character hexadecimal value.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [poolId] - A valid 4-character hexadecimal connection pool ID.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setId(
      {required String deviceId, required String poolId});

  /// Caches the connection pool ID for the specified device.
  /// This is used to store the connection pool ID for a device without setting it.
  /// It will be called automatically whenever [setId] is executed to update the cache.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [poolId] - A valid 4-character hexadecimal connection pool ID.
  void cacheId(String deviceId, String poolId);

  /// Retrieves the connection pool ID of the specified device.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [String] containing the connection pool ID.
  String getId(String deviceId);

  /// Sends the reset command to the device, resetting the connection pool ID to '0000'.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> resetId(String deviceId);

  /// Checks if the given ID is a valid 4-character hexadecimal value.
  ///
  /// [poolId] - The connection pool ID to validate.
  ///
  /// Returns `true` if the ID is valid, `false` otherwise.
  bool isValidId(String poolId);

  /// Generates a configuration command string that can be encoded into a QR code.
  ///
  /// The QR code data contains information to configure the device with the provided
  /// connection pool ID when scanned.
  ///
  /// [poolId] - A valid 4-character hexadecimal connection pool ID.
  ///
  /// Returns the QR code data string, or an empty string if the ID is invalid.
  String getConnectionPoolQRData(String poolId);
}
