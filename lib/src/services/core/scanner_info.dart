// src/services/core/scanner_info_impl.dart
import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/entities/entities.dart';
import 'package:opticonnect_sdk/interfaces/interfaces.dart';
import 'package:opticonnect_sdk/src/services/core/devices_info_manager.dart';

@LazySingleton(as: ScannerInfo)
class ScannerInfoImpl implements ScannerInfo {
  final DevicesInfoManager _devicesInfoManager;

  /// Constructs the [ScannerInfoImpl] class with necessary dependencies.
  ScannerInfoImpl(this._devicesInfoManager);

  @override
  DeviceInfo getInfo(String deviceId) {
    return _devicesInfoManager.getInfo(deviceId);
  }
}
