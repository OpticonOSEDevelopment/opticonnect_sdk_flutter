import 'package:opticonnect_sdk/src/entities/command.dart';

class RawCommand extends Command {
  RawCommand(
    super.code, {
    super.parameters,
    super.ledFeedback,
    super.buzzerFeedback,
    super.vibrationFeedback,
    super.sendFeedback,
  }) {
    final buffer = StringBuffer();
    buffer.write(code);
    parsedData = buffer.toString();
  }
}
