import 'package:flutter/foundation.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/entities/scanner_command.dart';
import 'package:opticonnect_sdk/opticonnect.dart';
import 'package:opticonnect_sdk/scanner_feedback_manager.dart';
import 'package:opticonnect_sdk/src/injection/injection.config.dart';

abstract class BaseScannerSettings {
  final ScannerFeedbackManager feedbackManager =
      getIt<ScannerFeedbackManager>();

  @protected
  final OptiConnect sdk = OptiConnect.instance;

  @protected
  Future<CommandResponse> sendCommand(String deviceId, String command,
      {List<String> parameters = const []}) {
    return sdk.settingsManager.executeCommand(
        deviceId,
        ScannerCommand(command,
            parameters: parameters,
            ledFeedback: feedbackManager.ledFeedback,
            buzzerFeedback: feedbackManager.buzzerFeedback,
            vibrationFeedback: feedbackManager.vibrationFeedback));
  }
}