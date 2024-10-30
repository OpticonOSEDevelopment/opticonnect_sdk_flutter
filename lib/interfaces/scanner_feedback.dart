/// Configures the feedback behavior of the scanner when executing commands.
///
/// This interface provides methods to manage feedback settings such as LED, buzzer,
/// and vibration.
abstract class ScannerFeedback {
  /// Indicates whether LED feedback is enabled.
  ///
  /// When `true`, the scanner will emit a light (LED) as a form of feedback when executing commands.
  bool get led;

  /// Indicates whether buzzer feedback is enabled.
  ///
  /// When `true`, the scanner will emit a sound (buzzer) as a form of feedback when executing commands.
  bool get buzzer;

  /// Indicates whether vibration feedback is enabled.
  ///
  /// When `true`, the scanner will vibrate as a form of feedback when executing commands, if supported.
  bool get vibration;

  /// Sets the feedback preferences for the scanner.
  ///
  /// Allows updating the individual feedback settings for LED, buzzer, and vibration.
  /// These settings adjust the scanner's feedback behavior accordingly.
  ///
  /// - [led]: Set this to `true` to enable LED feedback, or `false` to disable it. If `null`, the setting remains unchanged.
  /// - [buzzer]: Set this to `true` to enable buzzer feedback, or `false` to disable it. If `null`, the setting remains unchanged.
  /// - [vibration]: Set this to `true` to enable vibration feedback, or `false` to disable it. If `null`, the setting remains unchanged.
  void set({bool? led, bool? buzzer, bool? vibration});
}
