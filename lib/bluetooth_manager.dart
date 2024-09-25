import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/entities/barcode_data.dart';
import 'package:opticonnect_sdk/entities/ble_discovered_device.dart';
import 'package:opticonnect_sdk/enums/ble_device_connection_state.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/services/ble_services/ble_connectivity_handler.dart';
import 'package:opticonnect_sdk/src/services/ble_services/ble_devices_discoverer.dart';
import 'package:opticonnect_sdk/src/services/ble_services/ble_devices_streams_handler.dart';

/// Manages Bluetooth operations such as device discovery, connection, disconnection,
/// and streaming data for BLE devices.
///
/// This class is responsible for handling all the Bluetooth-related operations and
/// can be injected as a lazy singleton using a dependency injection system.
///
@lazySingleton
class BluetoothManager {
  final BleDevicesDiscoverer _bleDevicesDiscoverer;
  final BleConnectivityHandler _bleConnectivityHandler;
  final BleDevicesStreamsHandler _bleDevicesStreamsHandler;
  final AppLogger _appLogger;

  /// Constructs the [BluetoothManager] with injected dependencies.
  ///
  /// This constructor is typically used with dependency injection to ensure
  /// that all required services (device discoverer, connectivity handler, and
  ///
  /// It is recommended that you access this class through the `OptiConnectSDK` and
  /// avoid initializing or modifying the settings manually.
  ///
  /// Example usage:
  /// ```dart
  /// final sdk = OptiConnectSDK.instance;
  /// sdk.initialize();
  /// final bluetoothManager = sdk.bluetoothManager;
  /// ```
  BluetoothManager(
    this._bleDevicesDiscoverer,
    this._bleConnectivityHandler,
    this._bleDevicesStreamsHandler,
    this._appLogger,
  );

  /// Starts the BLE device discovery process.
  ///
  /// This method begins the scanning process for nearby BLE devices.
  /// It logs the start and handles any errors that may occur during the discovery process.
  Future<void> startDiscovery() async {
    try {
      await _bleDevicesDiscoverer.startDiscovery();
      _appLogger.info("Discovery started successfully.");
    } catch (e) {
      _appLogger.error("Error starting discovery: $e");
      rethrow;
    }
  }

  /// Stops the BLE device discovery process.
  ///
  /// This method ends the BLE scanning process.
  Future<void> stopDiscovery() async {
    try {
      await _bleDevicesDiscoverer.stopDiscovery();
      _appLogger.info("Discovery stopped successfully.");
    } catch (e) {
      _appLogger.error("Error stopping discovery: $e");
      rethrow;
    }
  }

  /// A stream of [BleDiscoveredDevice] representing discovered BLE devices.
  ///
  /// Returns a stream of BLE devices discovered during the discovery process.
  Stream<BleDiscoveredDevice> get bleDeviceStream async* {
    try {
      await for (final results in _bleDevicesDiscoverer.bleDeviceStream) {
        yield results;
      }
    } catch (e) {
      _appLogger.error("Error in bleDeviceStream: $e");
      rethrow;
    }
  }

  /// Connects to the BLE device with the given [deviceId].
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Attempts to establish a connection to the BLE device and logs the result.
  Future<void> connect(String deviceId) async {
    try {
      await _bleConnectivityHandler.connect(deviceId);
      _appLogger.info("Connected to device $deviceId successfully.");
    } catch (e) {
      _appLogger.error("Error connecting to device $deviceId: $e");
      rethrow;
    }
  }

  /// Disconnects from the BLE device with the given [deviceId].
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Disconnects the BLE device and logs the result.
  Future<void> disconnect(String deviceId) async {
    try {
      await _bleConnectivityHandler.disconnect(deviceId);
      _appLogger.info("Disconnected from device $deviceId successfully.");
    } catch (e) {
      _appLogger.error("Error disconnecting from device $deviceId: $e");
      rethrow;
    }
  }

  /// Listens to the connection state of the BLE device with the given [deviceId].
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a stream of [BleDeviceConnectionState] indicating the connection state.
  Stream<BleDeviceConnectionState> listenToConnectionState(String deviceId) {
    try {
      return _bleConnectivityHandler.listenToConnectionState(deviceId);
    } catch (e) {
      _appLogger.error("Error listening to connection state: $e");
      rethrow;
    }
  }

  /// Subscribes to the barcode data stream from the BLE device with the given [deviceId].
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a stream of barcode data received from the device.
  Future<Stream<BarcodeData>> subscribeToBarcodeDataStream(
      String deviceId) async {
    try {
      return _bleDevicesStreamsHandler.getBarcodeDataStream(deviceId);
    } catch (e) {
      _appLogger.error("Error subscribing to barcode data stream: $e");
      rethrow;
    }
  }

  /// Cleans up BLE-related resources when no longer needed.
  ///
  /// This method disposes of the device discoverer and connectivity handler.
  Future<void> dispose() async {
    try {
      await _bleConnectivityHandler.dispose();
      await _bleDevicesDiscoverer.dispose();
      _appLogger.info("Bluetooth resources disposed successfully.");
    } catch (e) {
      _appLogger.error("Error disposing Bluetooth resources: $e");
      rethrow;
    }
  }
}
