library opticonnect_sdk;

import 'package:opticonnect_sdk/src/entities/discovered_device.dart';
import 'package:opticonnect_sdk/src/injection/injection.config.dart';
import 'package:opticonnect_sdk/src/services/ble_manager.dart';

class OptiConnectSDK {
  static OptiConnectSDK? _instance;
  late final BleManager _bleManager;

  static OptiConnectSDK get instance {
    _instance ??= OptiConnectSDK._internal();
    return _instance!;
  }

  OptiConnectSDK._internal() {
    _initialize();
  }

  void _initialize() {
    configureSdkDependencyInjection();
    _bleManager = getIt<BleManager>();
  }

  Future<void> startDiscovery() async {
    await _bleManager.startDiscovery();
  }

  Future<void> stopDiscovery() async {
    await _bleManager.stopDiscovery();
  }

  Stream<DiscoveredDevice> get bleDeviceStream async* {
    await for (final results in _bleManager.bleDeviceStream) {
      yield results;
    }
  }
}
