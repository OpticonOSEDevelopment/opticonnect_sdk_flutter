import 'dart:async';

import 'package:flutter/material.dart';
import 'package:opticonnect_sdk/enums/ble_device_connection_state.dart';
import 'package:opticonnect_sdk_client/devices_manager.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

/// The main entry point of the app, demonstrating the OptiConnect SDK usage
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Opticonnect SDK Client Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const OpticonnectSDKClient(),
    );
  }
}

/// Main UI for demonstrating device discovery, connection, and settings
class OpticonnectSDKClient extends StatefulWidget {
  const OpticonnectSDKClient({super.key});

  @override
  OpticonnectSDKClientState createState() => OpticonnectSDKClientState();
}

class OpticonnectSDKClientState extends State<OpticonnectSDKClient>
    with WidgetsBindingObserver {
  final _devicesManager = DevicesManager();

  @override
  void initState() {
    super.initState();
    _initializeSDK();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.detached) {
      // App is terminating, clean up resources
      await _devicesManager.dispose();
    }
  }

  /// Initializes the OptiConnect SDK when the app starts
  Future<void> _initializeSDK() async {
    try {
      await _devicesManager.initialize();
    } catch (e) {
      debugPrint('Error initializing SDK: $e');
    }
  }

  /// Connects to a BLE device
  void _connectToDevice(String deviceId) async {
    try {
      await _devicesManager.connect(deviceId);
    } catch (e) {
      debugPrint('Error connecting to device: $e');
    }
  }

  /// Disconnects from a BLE device
  void _disconnectFromDevice(String deviceId) async {
    try {
      await _devicesManager.disconnect(deviceId);
    } catch (e) {
      debugPrint('Error disconnecting from device: $e');
    }
  }

  /// UI component for displaying the device's connection state
  Widget _buildConnectionState(String deviceId) {
    final connectionState = _devicesManager.connectionStates[deviceId];
    final isConnected = connectionState == BleDeviceConnectionState.connected;
    final isConnecting = connectionState == BleDeviceConnectionState.connecting;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isConnected
              ? Icons.check_circle
              : (isConnecting ? Icons.hourglass_empty : Icons.cancel),
          color: isConnected
              ? Colors.green
              : (isConnecting ? Colors.lightBlue : Colors.red),
        ),
        const SizedBox(width: 8),
        Text(
          isConnected
              ? 'Connected'
              : (isConnecting ? 'Connecting...' : 'Disconnected'),
          style: TextStyle(
            color: isConnected
                ? Colors.green
                : (isConnecting ? Colors.lightBlue : Colors.red),
          ),
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: isConnecting
              ? null // Disable the button while connecting
              : isConnected
                  ? () => _disconnectFromDevice(deviceId)
                  : () => _connectToDevice(deviceId),
          style: ElevatedButton.styleFrom(
            foregroundColor: isConnected ? Colors.red : Colors.green,
          ),
          child: Text(isConnected ? 'Disconnect' : 'Connect'),
        ),
      ],
    );
  }

  /// UI component for toggling the floodlight setting
  Widget _buildFloodlightToggleButton(String deviceId) {
    final isConnected = _devicesManager.connectionStates[deviceId] ==
        BleDeviceConnectionState.connected;

    return isConnected
        ? ElevatedButton(
            onPressed: () => _devicesManager.toggleFloodlight(deviceId),
            child: const Text('Toggle Floodlight'),
          )
        : const SizedBox();
  }

  /// UI component for toggling symbology (e.g., EAN-13) setting
  Widget _buildSymbologyToggleButton(String deviceId) {
    final isConnected = _devicesManager.connectionStates[deviceId] ==
        BleDeviceConnectionState.connected;

    return isConnected
        ? ElevatedButton(
            onPressed: () => _devicesManager.toggleSymbology(deviceId),
            child: const Text('Toggle Symbology (EAN-13)'),
          )
        : const SizedBox();
  }

  /// UI component for displaying barcode data and device info
  Widget _buildBarcodeDataAndDeviceInfo(String deviceId) {
    final deviceInfo = _devicesManager.deviceInfo[deviceId];
    final barcodeData = _devicesManager.barcodeData.isNotEmpty
        ? _devicesManager.barcodeData.last
        : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (barcodeData != null) ...[
          Text('Data: ${barcodeData.data}'),
          Text('Symbology: ${barcodeData.symbology}'),
          Text('Quantity: ${barcodeData.quantity}'),
          Text('Time of Scan: ${barcodeData.timeOfScan}'),
        ],
        if (deviceInfo != null) ...[
          const SizedBox(height: 16),
          const Text('Device Info:',
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text('MAC Address: ${deviceInfo.macAddress}'),
          Text('Serial Number: ${deviceInfo.serialNumber}'),
          Text('Local Name: ${deviceInfo.localName}'),
          Text('Firmware Version: ${deviceInfo.firmwareVersion}'),
        ] else ...[
          const Text('No device info available.'),
        ]
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _devicesManager,
      child: Consumer<DevicesManager>(
        builder: (context, deviceManager, child) {
          return MaterialApp(
            theme: ThemeData(primarySwatch: Colors.blue),
            home: Scaffold(
              appBar: AppBar(
                title: const Text('Opticonnect SDK Client Example'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Discovered Scanners',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      _devicesManager.discoveredDevices.isEmpty
                          ? const Text('No devices found.')
                          : Column(
                              children: [
                                ..._devicesManager.discoveredDevices.values
                                    .map((device) {
                                  final deviceId = device.deviceId;
                                  return Column(
                                    children: [
                                      ListTile(
                                        title: Text(device.name),
                                        subtitle: Text(deviceId),
                                        trailing:
                                            _buildConnectionState(deviceId),
                                      ),
                                      if (_devicesManager
                                              .connectionStates[deviceId] ==
                                          BleDeviceConnectionState.connected)
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16.0), // Align the buttons
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              _buildFloodlightToggleButton(
                                                  deviceId),
                                              const SizedBox(height: 8),
                                              _buildSymbologyToggleButton(
                                                  deviceId),
                                            ],
                                          ),
                                        ),
                                    ],
                                  );
                                }), // Convert the mapped widgets to a list.
                              ],
                            ),
                      const SizedBox(height: 20),
                      const Text(
                        'Latest Barcode Data',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      _devicesManager.barcodeData.isNotEmpty
                          ? _buildBarcodeDataAndDeviceInfo(
                              _devicesManager.barcodeData.last.deviceId)
                          : const Text('No barcode data available.'),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
