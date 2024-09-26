library opticonnect_sdk;

import 'package:opticonnect_sdk/bluetooth_manager.dart';
import 'package:opticonnect_sdk/scanner_feedback_manager.dart';
import 'package:opticonnect_sdk/scanner_settings_manager.dart';
import 'package:opticonnect_sdk/src/injection/injection.config.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/services/scanner_settings_services/scanner_settings_handler.dart';

/// The main class for interacting with Opticon's BLE OPN-2500 and OPN-6000 scanners.
/// Provides methods to discover, connect, and manage devices.
class OptiConnectSDK {
  static OptiConnectSDK? _instance;

  late final ScannerSettingsManager _scannerSettingsManager;
  late final ScannerSettingsHandler _scannerSettingsHandler;
  late final ScannerFeedbackManager _scannerFeedbackManager;
  late final BluetoothManager _bluetoothManager;
  late final AppLogger _appLogger;

  bool _isInitialized = false;

  static OptiConnectSDK get instance {
    _instance ??= OptiConnectSDK._internal();
    return _instance!;
  }

  OptiConnectSDK._internal();

  /// Initializes the SDK and sets up the necessary services.
  ///
  /// This method should be called before using any other methods.
  /// It configures BLE device discovery, connectivity handlers, and
  /// scanner settings.
  Future<void> initialize() async {
    configureSdkDependencyInjection();

    _scannerSettingsManager = ScannerSettingsManager(this);
    await _scannerSettingsManager.initialize();

    _scannerSettingsHandler = getIt<ScannerSettingsHandler>();
    await _scannerSettingsHandler.initialize();

    _scannerFeedbackManager = ScannerFeedbackManager();

    _bluetoothManager = getIt<BluetoothManager>();

    _appLogger = getIt<AppLogger>();

    _isInitialized = true;
  }

  /// Checks if the SDK is initialized before proceeding.
  void _ensureInitialized() {
    if (!_isInitialized) {
      throw StateError(
          'OptiConnectSDK has not been initialized. Call initialize() before using other methods.');
    }
  }

  /// Public property getter for [settingsManager].
  ScannerSettingsManager get settingsManager {
    _ensureInitialized(); // Check if SDK is initialized before accessing
    return _scannerSettingsManager;
  }

  ScannerFeedbackManager get feedbackManager {
    _ensureInitialized(); // Check if SDK is initialized before accessing
    return _scannerFeedbackManager;
  }

  /// Public property getter for [bluetoothManager].
  BluetoothManager get bluetoothManager {
    _ensureInitialized(); // Check if SDK is initialized before accessing
    return _bluetoothManager;
  }

  /// Disposes of the SDK resources, stopping any active processes.
  ///
  /// This method should be called when the SDK is no longer needed to
  /// clean up resources such as BLE connections and discovery.
  ///
  /// After calling this method, the SDK will need to be initialized again.
  Future<void> dispose() async {
    try {
      _ensureInitialized();
      await _bluetoothManager.dispose();
      _appLogger.info("SDK disposed successfully.");
      _isInitialized = false;
    } catch (e) {
      _appLogger.error("Error disposing SDK: $e");
      rethrow;
    }
  }
}
