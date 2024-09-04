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
    if (!command.sendFeedback) {
      return [];
    }

    final List<Command> feedbackCommands = [];

    if (sendAckFeedback && command.buzzerFeedback) {
      feedbackCommands.add(Command(goodReadBuzzer, sendFeedback: false));
    }

    if (sendAckFeedback && command.ledFeedback) {
      feedbackCommands.add(Command(goodReadLed, sendFeedback: false));
    }

    if ((sendNakFeedback || sendAckFeedback) && command.vibrationFeedback) {
      feedbackCommands.add(Command(workVibration, sendFeedback: false));
    }

    if (sendNakFeedback && command.buzzerFeedback) {
      feedbackCommands.add(Command(badReadBuzzer, sendFeedback: false));
    }

    if (sendNakFeedback && command.ledFeedback) {
      feedbackCommands.add(Command(badReadLed, sendFeedback: false));
    }

    return feedbackCommands;
  }
}
