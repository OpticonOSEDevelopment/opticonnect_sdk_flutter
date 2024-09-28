import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

@lazySingleton
class PermissionHandler {
  Future<bool> hasBluetoothPermissions() async {
    if (Platform.isAndroid) {
      if (await _getAndroidVersion() >= 12) {
        return await Permission.bluetoothScan.status.isGranted &&
            await Permission.bluetoothConnect.status.isGranted;
      } else {
        return await Permission.bluetooth.status.isGranted &&
            await Permission.location.status.isGranted;
      }
    } else if (Platform.isMacOS) {
      return true;
    } else {
      return !await Permission.bluetooth.isRestricted;
    }
  }

  Future<PermissionStatus> setBluetoothPermissions() async {
    Map<Permission, PermissionStatus> statuses;

    if (Platform.isAndroid) {
      if (await _getAndroidVersion() >= 12) {
        statuses = await [
          Permission.bluetoothScan,
          Permission.bluetoothConnect,
        ].request();
      } else {
        statuses = await [
          Permission.bluetooth,
          Permission.location,
        ].request();
      }
    } else {
      return Permission.bluetooth.request();
    }

    if (statuses.values.any((status) => status.isDenied)) {
      return PermissionStatus.denied;
    }

    return PermissionStatus.granted;
  }

  Future<bool> hasStoragePermissions() async {
    if (!Platform.isMacOS &&
        (!Platform.isAndroid || await _getAndroidVersion() <= 11)) {
      return Permission.storage.status.isGranted;
    } else {
      return true;
    }
  }

  Future<void> setStoragePermissions() async {
    if (!Platform.isMacOS &&
        (!Platform.isAndroid || await _getAndroidVersion() <= 11)) {
      await [Permission.storage].request();
    }
  }

  int _getVersion(String release) {
    final until = release.indexOf('.');
    String version;
    if (until != -1) {
      version = release.substring(0, until);
    } else {
      version = release;
    }
    return int.parse(version);
  }

  Future<int> _getAndroidVersion() async {
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    final release = androidInfo.version.release;
    return _getVersion(release);
  }
}
