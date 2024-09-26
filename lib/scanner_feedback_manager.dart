import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/src/injection/injection.config.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';

/// Manages the default feedback settings for a scanner, including LED, buzzer, and vibration feedback.
///
/// The feedback settings control the visual, auditory, and tactile feedback
/// that the scanner provides when executing certain commands, such as setting configuration options.
@lazySingleton
class ScannerFeedbackManager {
  bool _ledFeedback = true;

  /// Indicates whether LED feedback is enabled.
  ///
  /// When `true`, the scanner will emit a light (LED) as a form of feedback when executing commands.
  /// Default value is `true`.
  bool get ledFeedback => _ledFeedback;

  bool _buzzerFeedback = true;

  /// Indicates whether buzzer feedback is enabled.
  ///
  /// When `true`, the scanner will emit a sound (buzzer) as a form of feedback when executing commands.
  /// Default value is `true`.
  bool get buzzerFeedback => _buzzerFeedback;

  bool _vibrationFeedback = true;

  /// Indicates whether vibration feedback is enabled.
  ///
  /// When `true`, the scanner will vibrate as a form of feedback when executing commands, if the scanner supports vibration.
  /// Default value is `true`.
  bool get vibrationFeedback => _vibrationFeedback;

  /// Sets the feedback preferences for the scanner.
  ///
  /// Allows updating the individual feedback settings for LED, buzzer, and vibration.
  /// These settings are applied to the commands sent to the scanner to adjust scanner behavior.
  ///
  /// - [led]: Set this to `true` to enable LED feedback, or `false` to disable it. If `null`, the setting remains unchanged.
  /// - [buzzer]: Set this to `true` to enable buzzer feedback, or `false` to disable it. If `null`, the setting remains unchanged.
  /// - [vibration]: Set this to `true` to enable vibration feedback, or `false` to disable it. If `null`, the setting remains unchanged.
  void setFeedback({
    bool? led,
    bool? buzzer,
    bool? vibration,
  }) {
    if (led != null) _ledFeedback = led;
    if (buzzer != null) _buzzerFeedback = buzzer;
    if (vibration != null) _vibrationFeedback = vibration;
    final appLogger = getIt<AppLogger>();
    appLogger.warning(
        'Scanner feedback settings updated: LED=$ledFeedback, buzzer=$buzzerFeedback, vibration=$vibrationFeedback');
  }
}
