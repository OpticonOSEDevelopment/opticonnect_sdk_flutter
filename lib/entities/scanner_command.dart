import 'package:opticonnect_sdk/src/entities/base_command.dart';

/// A class representing a scanner command, inheriting from [BaseCommand].
///
/// This class is used to create specific scanner commands with optional parameters for LED, buzzer, and vibration feedback.
class ScannerCommand extends BaseCommand {
  /// Constructs a [ScannerCommand] with the given command code and optional feedback settings.
  ///
  /// - [code]: The command code to be sent to the scanner.
  /// - [parameters]: Optional parameters to be included with the command.
  /// - [ledFeedback]: Optional feedback to indicate LED usage during command execution.
  /// - [buzzerFeedback]: Optional feedback to indicate buzzer usage during command execution.
  /// - [vibrationFeedback]: Optional feedback to indicate vibration usage during command execution.
  ScannerCommand(
    super.code, {
    super.parameters,
    super.ledFeedback,
    super.buzzerFeedback,
    super.vibrationFeedback,
  });
}
