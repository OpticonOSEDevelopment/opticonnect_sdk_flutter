import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:opticonnect_sdk/enums/ble_device_connection_state.dart';
import 'package:opticonnect_sdk_client/devices_manager.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const OptiConnectSDKClient());
}

class OptiConnectSDKClient extends StatelessWidget {
  const OptiConnectSDKClient({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const OpticonnectSDKClient(),
    );
  }
}

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
      await _devicesManager.dispose();
    }
  }

  Future<void> _initializeSDK() async {
    try {
      await _devicesManager.initialize();
    } catch (e) {
      debugPrint('Error initializing SDK: $e');
    }
  }

  Widget _buildConnectionState(String deviceId) {
    final connectionState = _devicesManager.connectionStates[deviceId];
    final isConnected = connectionState == BleDeviceConnectionState.connected;
    final isConnecting = connectionState == BleDeviceConnectionState.connecting;

    return Container(
      decoration: BoxDecoration(
        color: isConnected
            ? Colors.green.shade100
            : (isConnecting ? Colors.blue.shade100 : Colors.red.shade100),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isConnected
                ? Icons.check_circle
                : (isConnecting ? Icons.hourglass_empty : Icons.cancel),
            color: isConnected
                ? Colors.green
                : (isConnecting ? Colors.blue : Colors.red),
          ),
          const SizedBox(width: 8),
          Text(
            isConnected
                ? 'Connected'
                : (isConnecting ? 'Connecting...' : 'Disconnected'),
            style: TextStyle(
              color: isConnected
                  ? Colors.green
                  : (isConnecting ? Colors.blue : Colors.red),
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: isConnecting
                ? null
                : isConnected
                    ? () => _disconnectFromDevice(deviceId)
                    : () => _connectToDevice(deviceId),
            style: ElevatedButton.styleFrom(
              backgroundColor: isConnected ? Colors.red : Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            child: Text(isConnected ? 'Disconnect' : 'Connect',
                style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

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

  String _formatToLocalTime(String isoDateString) {
    DateTime dateTime = DateTime.parse(isoDateString).toLocal();
    return DateFormat.yMd().add_jm().format(dateTime);
  }

  Widget _buildBarcodeDataAndDeviceInfo(String deviceId) {
    final deviceInfo = _devicesManager.deviceInfo[deviceId];
    final barcodeData = _devicesManager.receivedBarcodeData.isNotEmpty
        ? _devicesManager.receivedBarcodeData[deviceId]?.lastOrNull
        : null;

    final batteryPercentage =
        _devicesManager.batteryPercentages[deviceId] ?? -1;
    final batteryStatus = _devicesManager.batteryStatuses[deviceId];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (barcodeData != null) ...[
          _buildDataCard(
            title: 'Latest Barcode Data',
            content: [
              Text('Data: ${barcodeData.data}'),
              Text('Symbology: ${barcodeData.symbology}'),
              Text('Quantity: ${barcodeData.quantity}'),
              Text(
                  'Time of scan: ${_formatToLocalTime(barcodeData.timeOfScan)}'),
            ],
          ),
        ],
        if (deviceInfo != null) ...[
          const SizedBox(height: 16),
          _buildDataCard(
            title: 'Device Info',
            content: [
              Text('MAC Address: ${deviceInfo.macAddress}'),
              Text('Serial Number: ${deviceInfo.serialNumber}'),
              Text('Local Name: ${deviceInfo.localName}'),
              Text('Firmware Version: ${deviceInfo.firmwareVersion}'),
              const Divider(), // Optional divider for better separation
              Text(
                'Battery Percentage: ${batteryPercentage == -1 ? 'N/A' : '$batteryPercentage%'}',
              ),
              if (batteryStatus != null) ...[
                Text('Battery Present: ${batteryStatus.isBatteryPresent}'),
                Text('Battery Faulty: ${batteryStatus.isBatteryFaulty}'),
                Text('Wireless Charging: ${batteryStatus.isWirelessCharging}'),
                Text('Wired Charging: ${batteryStatus.isWiredCharging}'),
                Text('Charging: ${batteryStatus.isCharging}'),
              ] else ...[
                const Text('No battery status available.'),
              ],
            ],
          ),
        ] else ...[
          const Text('No device info available.'),
        ]
      ],
    );
  }

  Widget _buildDataCard(
      {required String title, required List<Widget> content}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(),
            ...content,
          ],
        ),
      ),
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
                actions: [
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: _devicesManager.startDiscovery,
                    tooltip: 'Start Discovery',
                  ),
                ],
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
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(device.name),
                                            LayoutBuilder(
                                              builder: (context, constraints) {
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(height: 4),
                                                    _buildConnectionState(
                                                        deviceId),
                                                  ],
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (_devicesManager
                                              .connectionStates[deviceId] ==
                                          BleDeviceConnectionState.connected)
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              _buildFloodlightToggleButton(
                                                  deviceId),
                                              const SizedBox(height: 8),
                                              _buildSymbologyToggleButton(
                                                  deviceId),
                                              _buildBarcodeDataAndDeviceInfo(
                                                  deviceId),
                                            ],
                                          ),
                                        ),
                                    ],
                                  );
                                }),
                              ],
                            ),
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

  void _connectToDevice(String deviceId) async {
    try {
      await _devicesManager.connect(deviceId);
    } catch (e) {
      debugPrint('Error connecting to device: $e');
    }
  }

  void _disconnectFromDevice(String deviceId) async {
    try {
      await _devicesManager.disconnect(deviceId);
    } catch (e) {
      debugPrint('Error disconnecting from device: $e');
    }
  }
}
