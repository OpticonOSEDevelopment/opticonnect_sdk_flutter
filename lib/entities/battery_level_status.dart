class BatteryLevelStatus {
  final bool isBatteryPresent;
  final bool isWirelessCharging;
  final bool isWiredCharging;
  final bool isCharging;
  final bool isBatteryFaulty;
  final int percentage; // -1 if not available

  BatteryLevelStatus({
    required this.isBatteryPresent,
    required this.isWirelessCharging,
    required this.isWiredCharging,
    required this.isCharging,
    required this.isBatteryFaulty,
    required this.percentage,
  });
}
