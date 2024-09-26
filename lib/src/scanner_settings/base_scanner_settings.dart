import 'package:flutter/foundation.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/entities/scanner_command.dart';
import 'package:opticonnect_sdk/opticonnect_sdk.dart';
import 'package:opticonnect_sdk/scanner_feedback_manager.dart';
import 'package:opticonnect_sdk/src/injection/injection.config.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';

abstract class BaseScannerSettings {
  @protected
  final OptiConnectSDK sdk;
  BaseScannerSettings(this.sdk);

  late final ScannerFeedbackManager feedbackManager =
      getIt<ScannerFeedbackManager>();

  @protected
  Future<CommandResponse> sendCommand(String deviceId, String command,
      {List<String> parameters = const []}) {
    final appLogger = getIt<AppLogger>();
    appLogger.warning(
        'current feedback: ${feedbackManager.ledFeedback} ${feedbackManager.buzzerFeedback} ${feedbackManager.vibrationFeedback}');
    return sdk.settingsManager.executeCommand(
        deviceId,
        ScannerCommand(command,
            parameters: parameters,
            ledFeedback: feedbackManager.ledFeedback,
            buzzerFeedback: feedbackManager.buzzerFeedback,
            vibrationFeedback: feedbackManager.vibrationFeedback));
  }
}
