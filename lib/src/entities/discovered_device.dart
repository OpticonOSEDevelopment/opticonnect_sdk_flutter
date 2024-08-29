class DiscoveredDevice {
  final String name;
  final String bluetoothId;
  final int rssi;
  final DateTime timeStamp;

  DiscoveredDevice({
    required this.name,
    required this.bluetoothId,
    required this.rssi,
    required this.timeStamp,
  });
}
