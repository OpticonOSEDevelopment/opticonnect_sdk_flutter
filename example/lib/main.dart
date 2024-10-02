import 'package:flutter/material.dart';
import 'package:opticonnect_sdk/entities/barcode_data.dart';
import 'package:opticonnect_sdk/enums/ble_device_connection_state.dart';
import 'package:opticonnect_sdk/opticonnect.dart';

void main() {
  runApp(const OptiConnectApp());
}

class OptiConnectApp extends StatelessWidget {
  const OptiConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const OptiConnectExample(),
    );
  }
}

class OptiConnectExample extends StatefulWidget {
  const OptiConnectExample({super.key});

  @override
  OptiConnectExampleState createState() => OptiConnectExampleState();
}

class OptiConnectExampleState extends State<OptiConnectExample> {
  String _deviceId = '';
  String _connectionStatus = 'Disconnected';
  String _barcodeData = '';
  bool _isConnecting = false;

  @override
  void initState() {
    super.initState();
    _initializeOptiConnectSDK();
  }

  Future<void> _initializeOptiConnectSDK() async {
    try {
      await OptiConnect.initialize();
      await OptiConnect.bluetoothManager.startDiscovery();
      OptiConnect.bluetoothManager.bleDiscoveredDevicesStream.listen((device) {
        setState(() {
          _deviceId = device.deviceId;
          _connectToDevice(_deviceId);
        });
      });
    } catch (e) {
      debugPrint('Error initializing SDK: $e');
    }
  }

  Future<void> _connectToDevice(String deviceId) async {
    if (_isConnecting) {
      return;
    }
    _isConnecting = true;
    try {
      OptiConnect.bluetoothManager
          .listenToConnectionState(deviceId)
          .listen((state) {
        setState(() {
          if (state == BleDeviceConnectionState.connected) {
            _connectionStatus = 'Connected';
            _listenToBarcodeDataStream(deviceId);
          } else if (state == BleDeviceConnectionState.connecting) {
            _connectionStatus = 'Connecting...';
          } else {
            _connectionStatus = 'Disconnected';
          }
        });
      });
      await OptiConnect.bluetoothManager.connect(deviceId);
      await Future.delayed(const Duration(seconds: 3));
      _isConnecting = false;
    } catch (e) {
      debugPrint('Error connecting to device: $e');
    }
  }

  Future<void> _listenToBarcodeDataStream(String deviceId) async {
    try {
      final barcodeStream = await OptiConnect.bluetoothManager
          .subscribeToBarcodeDataStream(deviceId);
      barcodeStream.listen((BarcodeData barcode) {
        setState(() {
          _barcodeData = barcode.data;
        });
      });
    } catch (e) {
      debugPrint('Error scanning barcode: $e');
    }
  }

  Future<void> _disconnectDevice() async {
    if (_deviceId.isNotEmpty) {
      await OptiConnect.bluetoothManager.disconnect(_deviceId);
      setState(() {
        _connectionStatus = 'Disconnected';
        _barcodeData = '';
      });
    }
  }

  @override
  void dispose() async {
    await OptiConnect.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OptiConnect SDK Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Device: $_deviceId',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              'Connection Status: $_connectionStatus',
              style: TextStyle(
                fontSize: 18,
                color: _connectionStatus == 'Connected'
                    ? Colors.green
                    : Colors.red,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed:
                  _connectionStatus == 'Connected' ? _disconnectDevice : null,
              child: const Text('Disconnect'),
            ),
            const SizedBox(height: 24),
            Text(
              'Latest Barcode Data: $_barcodeData',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
