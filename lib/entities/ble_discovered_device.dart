class BleDiscoveredDevice {
  final String name;
  final String deviceId;
  final int rssi;
  final DateTime timeStamp;

  BleDiscoveredDevice({
    required this.name,
    required this.deviceId,
    required this.rssi,
    required this.timeStamp,
  });
}
