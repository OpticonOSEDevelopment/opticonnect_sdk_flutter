class BleDiscoveredDevice {
  final String name;
  final String deviceId;
  final int rssi;
  final DateTime timeStamp;
  final String connectionPoolId;

  BleDiscoveredDevice({
    required this.name,
    required this.deviceId,
    required this.rssi,
    required this.timeStamp,
    required this.connectionPoolId,
  });
}
