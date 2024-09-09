library opticonnect_sdk;

import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/barcode_data.dart';
import 'package:opticonnect_sdk/entities/ble_discovered_device.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/entities/scanner_command.dart';
import 'package:opticonnect_sdk/enums/ble_device_connection_state.dart';
import 'package:opticonnect_sdk/scanner_settings.dart';
import 'package:opticonnect_sdk/src/injection/injection.config.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/services/ble_services/ble_connectivity_handler.dart';
import 'package:opticonnect_sdk/src/services/ble_services/ble_devices_discoverer.dart';
import 'package:opticonnect_sdk/src/services/ble_services/ble_devices_streams_handler.dart';
import 'package:opticonnect_sdk/src/services/scanner_commands_services/command_handlers_manager.dart';
import 'package:opticonnect_sdk/src/services/scanner_settings_services/scanner_settings_handler.dart';

class OptiConnectSDK {
  static OptiConnectSDK? _instance;
  late final ScannerSettings scannerSettings;
  late final BleDevicesDiscoverer _bleDevicesDiscoverer;
  late final BleConnectivityHandler _bleConnectivityHandler;
  late final BleDevicesStreamsHandler _bleDevicesStreamsHandler;
  late final CommandHandlersManager _commandHandlersManager;
  late final ScannerSettingsHandler _scannerSettingsHandler;
  late final AppLogger _appLogger;

  static OptiConnectSDK get instance {
    _instance ??= OptiConnectSDK._internal();
    return _instance!;
  }

  OptiConnectSDK._internal();

  Future<void> initialize() async {
    scannerSettings = ScannerSettings(this);

    configureSdkDependencyInjection();
    _bleDevicesDiscoverer = getIt<BleDevicesDiscoverer>();
    _bleConnectivityHandler = getIt<BleConnectivityHandler>();
    _bleDevicesStreamsHandler = getIt<BleDevicesStreamsHandler>();
    _commandHandlersManager = getIt<CommandHandlersManager>();
    _scannerSettingsHandler = getIt<ScannerSettingsHandler>();
    _appLogger = getIt<AppLogger>();

    await _scannerSettingsHandler.initialize();
  }

  Future<void> startDiscovery() async {
    try {
      await _bleDevicesDiscoverer.startDiscovery();
      _appLogger.info("Discovery started successfully.");
    } catch (e) {
      _appLogger.error("Error starting discovery: $e");
      rethrow;
    }
  }

  Future<void> stopDiscovery() async {
    try {
      await _bleDevicesDiscoverer.stopDiscovery();
      _appLogger.info("Discovery stopped successfully.");
    } catch (e) {
      _appLogger.error("Error stopping discovery: $e");
      rethrow;
    }
  }

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

  Stream<BleDeviceConnectionState> listenToConnectionState(String deviceId) {
    try {
      return _bleConnectivityHandler.listenToConnectionState(deviceId);
    } catch (e) {
      _appLogger.error("Error listening to connection state: $e");
      rethrow;
    }
  }

  BleDeviceConnectionState getConnectionState(String deviceId) {
    try {
      return _bleConnectivityHandler.getConnectionState(deviceId);
    } catch (e) {
      _appLogger.error("Error getting connection state: $e");
      rethrow;
    }
  }

  Future<void> connect(String deviceId) async {
    try {
      await _bleConnectivityHandler.connect(deviceId);
      _appLogger.info("Connected to device $deviceId successfully.");
    } catch (e) {
      _appLogger.error("Error connecting to device $deviceId: $e");
      rethrow;
    }
  }

  Future<void> disconnect(String deviceId) async {
    try {
      await _bleConnectivityHandler.disconnect(deviceId);
      _appLogger.info("Disconnected from device $deviceId successfully.");
    } catch (e) {
      _appLogger.error("Error disconnecting from device $deviceId: $e");
      rethrow;
    }
  }

  Future<Stream<BarcodeData>> subscribeToBarcodeDataStream(
      String deviceId) async {
    try {
      return _bleDevicesStreamsHandler.getBarcodeDataStream(deviceId);
    } catch (e) {
      _appLogger.error("Error subscribing to barcode data stream: $e");
      rethrow;
    }
  }

  Future<CommandResponse> sendCommand(
      String deviceId, ScannerCommand command) async {
    try {
      return await _commandHandlersManager.sendCommand(deviceId, command);
    } catch (e) {
      _appLogger.error("Error sending command to device $deviceId: $e");
      rethrow;
    }
  }

  Future<bool> persistSettings(String deviceId) async {
    try {
      final result = await _commandHandlersManager.sendCommand(
          deviceId, ScannerCommand(saveSettings));
      return result.succeeded;
    } catch (e) {
      _appLogger.error("Error persisting settings for device $deviceId: $e");
      rethrow;
    }
  }

  Future<void> dispose() async {
    try {
      await _bleConnectivityHandler.dispose();
      await _bleDevicesDiscoverer.dispose();
      _appLogger.info("SDK disposed successfully.");
    } catch (e) {
      _appLogger.error("Error disposing SDK: $e");
      rethrow;
    }
  }
}
