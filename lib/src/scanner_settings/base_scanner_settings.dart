import 'package:flutter/foundation.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/entities/scanner_command.dart';
import 'package:opticonnect_sdk/opticonnect_sdk.dart';

abstract class BaseScannerSettings {
  @protected
  final OptiConnectSDK sdk;
  BaseScannerSettings(this.sdk);

  @protected
  Future<CommandResponse> sendCommand(String deviceId, String command,
      {List<String> parameters = const []}) {
    return sdk.settingsManager.executeCommand(
        deviceId, ScannerCommand(command, parameters: parameters));
  }
}
