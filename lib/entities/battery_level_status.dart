import 'package:opticonnect_sdk/constants/battery_level_status_constants.dart';

class BatteryLevelStatus {
  final bool isBatteryPresent;
  final bool isWirelessCharging;
  final bool isWiredCharging;
  final bool isCharging;
  final int percentage; // -1 if not available

  BatteryLevelStatus({
    required this.isBatteryPresent,
    required this.isWirelessCharging,
    required this.isWiredCharging,
    required this.isCharging,
    required this.percentage,
  });

  factory BatteryLevelStatus._fromList(List<int> list) {
    final int powerState = (list[1] << 8) | list[2];

    return BatteryLevelStatus(
      isBatteryPresent: (powerState & bleBasBatteryPresentFlag) != 0,
      isWirelessCharging: (powerState & bleBasWirelessChargingFlag) != 0,
      isWiredCharging: (powerState & bleBasWiredChargingFlag) != 0,
      isCharging: (powerState & bleBasIsChargingFlag) != 0,
      percentage: ((list[0] & bleBasBatteryLevelFlag) != 0) ? list[3] : -1,
    );
  }
}
