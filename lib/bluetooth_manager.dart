import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/entities/barcode_data.dart';
import 'package:opticonnect_sdk/entities/battery_level_status.dart';
import 'package:opticonnect_sdk/entities/ble_discovered_device.dart';
import 'package:opticonnect_sdk/enums/ble_device_connection_state.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/services/ble_services/ble_connectivity_handler.dart';
import 'package:opticonnect_sdk/src/services/ble_services/ble_devices_discoverer.dart';
import 'package:opticonnect_sdk/src/services/ble_services/streams/ble_devices_streams_handler.dart';

/// Manages Bluetooth operations such as device discovery, connection, disconnection,
/// and streaming data for BLE devices.
///
/// This class is responsible for handling all the Bluetooth-related operations and
/// can be injected as a lazy singleton using a dependency injection system.
///
/// It is recommended that you access this class via the `OptiConnect` class
/// and avoid direct initialization.
@lazySingleton
class BluetoothManager {
  final BleDevicesDiscoverer _bleDevicesDiscoverer;
  final BleConnectivityHandler _bleConnectivityHandler;
  final BleDevicesStreamsHandler _bleDevicesStreamsHandler;
  final AppLogger _appLogger;

  /// Constructs the [BluetoothManager] with injected dependencies.
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
  /// Attempts to establish a connection to the BLE device.
  Future<void> connect(String deviceId) async {
    try {
      await _bleConnectivityHandler.connect(deviceId);
    } catch (e) {
      _appLogger.error("Error connecting to device $deviceId: $e");
      rethrow;
    }
  }

  /// Disconnects from the BLE device with the given [deviceId].
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Disconnects the BLE device.
  Future<void> disconnect(String deviceId) async {
    try {
      await _bleConnectivityHandler.disconnect(deviceId);
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
  /// Returns a stream of [BarcodeData] received from the device.
  Future<Stream<BarcodeData>> subscribeToBarcodeDataStream(
      String deviceId) async {
    try {
      return _bleDevicesStreamsHandler.dataHandler.getStream(deviceId);
    } catch (e) {
      _appLogger.error("Error subscribing to barcode data stream: $e");
      rethrow;
    }
  }

  /// Subscribes to the battery percentage stream from the BLE device with the given [deviceId].
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a stream of battery percentage updates.
  Future<Stream<int>> subscribeToBatteryPercentageStream(
      String deviceId) async {
    try {
      return _bleDevicesStreamsHandler.batteryHandler
          .getBatteryPercentageStream(deviceId);
    } catch (e) {
      _appLogger.error("Error subscribing to battery percentage stream: $e");
      rethrow;
    }
  }

  /// Subscribes to the battery status stream from the BLE device with the given [deviceId].
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a stream of [BatteryLevelStatus] updates.
  Future<Stream<BatteryLevelStatus>> subscribeToBatteryStatusStream(
      String deviceId) async {
    try {
      return _bleDevicesStreamsHandler.batteryHandler
          .getBatteryStatusStream(deviceId);
    } catch (e) {
      _appLogger.error("Error subscribing to battery status stream: $e");
      rethrow;
    }
  }

  /// Gets the latest battery percentage for the given [deviceId].
  ///
  /// Returns the latest battery percentage, or a default value if not available.
  int getLatestBatteryPercentage(String deviceId) {
    try {
      return _bleDevicesStreamsHandler.batteryHandler
          .getLatestBatteryPercentage(deviceId);
    } catch (e) {
      _appLogger.error(
          'Error getting latest battery percentage for device $deviceId');
      rethrow;
    }
  }

  /// Gets the latest battery status for the given [deviceId].
  ///
  /// Returns the latest [BatteryLevelStatus], or a default value if not available.
  BatteryLevelStatus getLatestBatteryStatus(String deviceId) {
    try {
      return _bleDevicesStreamsHandler.batteryHandler
          .getLatestBatteryStatus(deviceId);
    } catch (e) {
      _appLogger
          .error('Error getting latest battery status for device $deviceId');
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
      _bleDevicesStreamsHandler.dispose();
    } catch (e) {
      _appLogger.error("Error disposing Bluetooth resources: $e");
      rethrow;
    }
  }
}
