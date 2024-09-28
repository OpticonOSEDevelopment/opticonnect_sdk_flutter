import 'package:injectable/injectable.dart';

/// Configures the feedback behavior of the scanner when executing commands.
///
/// This method allows you to update the individual feedback settings for LED, buzzer,
/// and vibration. The feedback is applied when the scanner executes certain commands,
/// controlling the visual (LED), auditory (buzzer), and tactile (vibration) responses.
@lazySingleton
class ScannerFeedback {
  bool _led = true;

  /// Indicates whether LED feedback is enabled.
  ///
  /// When `true`, the scanner will emit a light (LED) as a form of feedback when executing commands.
  /// Default value is `true`.
  bool get led => _led;

  bool _buzzer = true;

  /// Indicates whether buzzer feedback is enabled.
  ///
  /// When `true`, the scanner will emit a sound (buzzer) as a form of feedback when executing commands.
  /// Default value is `true`.
  bool get buzzer => _buzzer;

  bool _vibration = true;

  /// Indicates whether vibration feedback is enabled.
  ///
  /// When `true`, the scanner will vibrate as a form of feedback when executing commands, if the scanner supports vibration.
  /// Default value is `true`.
  bool get vibration => _vibration;

  /// Sets the feedback preferences for the scanner.
  ///
  /// Allows updating the individual feedback settings for LED, buzzer, and vibration.
  /// These settings are applied to the commands sent to the scanner to adjust scanner feedback behavior.
  ///
  /// - [led]: Set this to `true` to enable LED feedback, or `false` to disable it. If `null`, the setting remains unchanged.
  /// - [buzzer]: Set this to `true` to enable buzzer feedback, or `false` to disable it. If `null`, the setting remains unchanged.
  /// - [vibration]: Set this to `true` to enable vibration feedback, or `false` to disable it. If `null`, the setting remains unchanged.
  void set({
    bool? led,
    bool? buzzer,
    bool? vibration,
  }) {
    if (led != null) _led = led;
    if (buzzer != null) _buzzer = buzzer;
    if (vibration != null) _vibration = vibration;
  }
}
