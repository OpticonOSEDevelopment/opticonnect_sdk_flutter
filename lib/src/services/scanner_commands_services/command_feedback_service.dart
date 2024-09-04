import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/src/entities/command.dart';

@lazySingleton
class CommandFeedbackService {
  List<Command> generateFeedbackCommands(
    bool sendAckFeedback,
    bool sendNakFeedback,
    Command command,
  ) {
    final List<Command> feedbackCommands = [];

    if (sendAckFeedback && command.buzzerFeedback) {
      feedbackCommands.add(Command(goodReadBuzzer));
    }

    if (sendAckFeedback && command.ledFeedback) {
      feedbackCommands.add(Command(goodReadLed));
    }

    if ((sendNakFeedback || sendAckFeedback) && command.vibrationFeedback) {
      feedbackCommands.add(Command(workVibration));
    }

    if (sendNakFeedback && command.buzzerFeedback) {
      feedbackCommands.add(Command(badReadBuzzer));
    }

    if (sendNakFeedback && command.ledFeedback) {
      feedbackCommands.add(Command(badReadLed));
    }

    return feedbackCommands;
  }
}
