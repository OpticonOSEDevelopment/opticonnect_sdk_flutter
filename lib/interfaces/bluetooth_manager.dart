// bluetooth_manager.dart (interface)
import 'package:opticonnect_sdk/entities/barcode_data.dart';
import 'package:opticonnect_sdk/entities/battery_level_status.dart';
import 'package:opticonnect_sdk/entities/ble_discovered_device.dart';
import 'package:opticonnect_sdk/enums/ble_adapter_state.dart';
import 'package:opticonnect_sdk/enums/ble_device_connection_state.dart';

/// Manages Bluetooth operations such as device discovery, connection, disconnection,
/// and streaming data for BLE devices.
///
/// This class is responsible for handling all the Bluetooth-related operations.
abstract class BluetoothManager {
  /// A stream of [BleAdapterState] representing the state of the Bluetooth adapter.
  Stream<BleAdapterState> get adapterState;

  /// Checks if the Bluetooth adapter is currently scanning for devices (discovery).
  bool get isScanning;

  /// A stream of [bool] representing the scanning state.
  Stream<bool> get isScanningStream;

  /// Checks if Bluetooth is available on the device.
  Future<bool> get isBluetoothAvailable;

  /// Starts the BLE device discovery process.
  ///
  /// This method begins the scanning process for nearby BLE devices.
  /// It logs the start and handles any errors that may occur during the discovery process.
  Future<void> startDiscovery();

  /// Stops the BLE device discovery process.
  ///
  /// This method ends the BLE scanning process.
  Future<void> stopDiscovery();

  /// A stream of [BleDiscoveredDevice] representing discovered BLE devices.
  ///
  /// Returns a stream of BLE devices discovered during the discovery process.
  Stream<BleDiscoveredDevice> get bleDiscoveredDevicesStream;

  /// Connects to the BLE device with the given [deviceId].
  ///
  /// Attempts to establish a connection to the BLE device.
  Future<void> connect(String deviceId);

  /// Disconnects from the BLE device with the given [deviceId].
  ///
  /// Disconnects the BLE device.
  Future<void> disconnect(String deviceId);

  /// Listens to the connection state of the BLE device with the given [deviceId].
  ///
  /// Returns a stream of [BleDeviceConnectionState] indicating the connection state.
  Stream<BleDeviceConnectionState> listenToConnectionState(String deviceId);

  /// Subscribes to the barcode data stream from the BLE device with the given [deviceId].
  ///
  /// Returns a stream of [BarcodeData] received from the device.
  Future<Stream<BarcodeData>> subscribeToBarcodeDataStream(String deviceId);

  /// Subscribes to the battery percentage stream from the BLE device with the given [deviceId].
  ///
  /// Returns a stream of battery percentage updates.
  Future<Stream<int>> subscribeToBatteryPercentageStream(String deviceId);

  /// Subscribes to the battery status stream from the BLE device with the given [deviceId].
  ///
  /// Returns a stream of [BatteryLevelStatus] updates.
  Future<Stream<BatteryLevelStatus>> subscribeToBatteryStatusStream(
      String deviceId);

  /// Gets the latest battery percentage for the given [deviceId].
  ///
  /// Returns the latest battery percentage, or a default value if not available.
  int getLatestBatteryPercentage(String deviceId);

  /// Gets the latest battery status for the given [deviceId].
  ///
  /// Returns the latest [BatteryLevelStatus], or a default value if not available.
  BatteryLevelStatus getLatestBatteryStatus(String deviceId);

  /// Cleans up BLE-related resources when no longer needed.
  ///
  /// This method disposes of the device discoverer and connectivity handler.
  Future<void> dispose();
}
