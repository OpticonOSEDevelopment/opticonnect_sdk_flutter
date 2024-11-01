import 'package:flutter/foundation.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/entities/scanner_command.dart';
import 'package:opticonnect_sdk/interfaces/scanner_feedback.dart';
import 'package:opticonnect_sdk/opticonnect.dart';
import 'package:opticonnect_sdk/src/injection/injection.config.dart';

abstract class SettingsBase {
  final ScannerFeedback _scannerFeedback = getIt<ScannerFeedback>();

  @protected
  Future<CommandResponse> sendCommand(String deviceId, String command,
      {List<String> parameters = const [], bool sendFeedback = true}) {
    return OptiConnect.scannerSettings.executeCommand(
        deviceId,
        ScannerCommand(command,
            parameters: parameters,
            sendFeedback: sendFeedback,
            ledFeedback: _scannerFeedback.led,
            buzzerFeedback: _scannerFeedback.buzzer,
            vibrationFeedback: _scannerFeedback.vibration));
  }
}