part of 'package:opticonnect_sdk/entities/entities.dart';

/// Represents the battery status of a device, including various indicators
/// such as charging status, fault status, and battery percentage.
///
/// This class provides detailed information about the battery's state, which
/// can be useful for monitoring the power conditions of a scanning device.
class BatteryLevelStatus {
  /// Indicates whether the battery is present in the device.
  ///
  /// If `true`, the battery is present; otherwise, it is not.
  final bool isBatteryPresent;

  /// Indicates whether the device is charging wirelessly.
  ///
  /// If `true`, the device is wirelessly charging. Note that both
  /// `isWirelessCharging` and `isWiredCharging` can be `false` if the device
  /// is not charging by either method.
  final bool isWirelessCharging;

  /// Indicates whether the device is charging via a wired connection.
  ///
  /// If `true`, the device is wired charging. This can be useful to differentiate
  /// between wired and wireless charging statuses.
  final bool isWiredCharging;

  /// Indicates whether the battery is currently charging, regardless of the method.
  ///
  /// If `true`, the battery is actively charging (either wired or wirelessly).
  /// This can help provide an overview of the charging state without specifying
  /// the charging method.
  final bool isCharging;

  /// Indicates whether the battery has a fault.
  ///
  /// If `true`, there is an issue with the battery that may affect performance
  /// or longevity. This status is important for diagnostics and preventive maintenance.
  final bool isBatteryFaulty;

  /// The current battery level as a percentage.
  ///
  /// Represents the charge level of the battery on a scale from 0 to 100.
  /// If the battery percentage is unavailable, this field is set to -1.
  /// This value is commonly used to display battery status to users or for power
  /// management purposes.
  final int percentage;

  /// Constructs a [BatteryLevelStatus] object containing information about the battery's
  /// state, charging method, and percentage.
  ///
  /// - [isBatteryPresent]: Indicates if the battery is physically present.
  /// - [isWirelessCharging]: Shows if the device is charging wirelessly.
  /// - [isWiredCharging]: Shows if the device is charging via a wired connection.
  /// - [isCharging]: Indicates if the device is currently charging.
  /// - [isBatteryFaulty]: Indicates if there is a fault in the battery.
  /// - [percentage]: The battery level as a percentage, or -1 if unavailable.
  BatteryLevelStatus({
    required this.isBatteryPresent,
    required this.isWirelessCharging,
    required this.isWiredCharging,
    required this.isCharging,
    required this.isBatteryFaulty,
    required this.percentage,
  });
}
