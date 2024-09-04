import 'package:opticonnect_sdk/src/entities/base_command.dart';

class ScannerCommand extends BaseCommand {
  ScannerCommand(
    super.code, {
    super.callback,
    super.parameters,
    super.ledFeedback,
    super.buzzerFeedback,
    super.vibrationFeedback,
  });
}
