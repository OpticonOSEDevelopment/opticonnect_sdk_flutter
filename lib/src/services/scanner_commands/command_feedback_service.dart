import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/interfaces/scanner_feedback.dart';
import 'package:opticonnect_sdk/src/entities/command.dart';

@lazySingleton
class CommandFeedbackService {
  final ScannerFeedback _scannerFeedback;

  CommandFeedbackService(this._scannerFeedback);

  List<Command> generateFeedbackCommands(
    bool sendAckFeedback,
    bool sendNakFeedback,
    Command command,
  ) {
    if (!command.sendFeedback) {
      return [];
    }

    final List<Command> feedbackCommands = [];

    final bool ledFeedback = command.ledFeedback ?? _scannerFeedback.led;
    final bool buzzerFeedback =
        command.buzzerFeedback ?? _scannerFeedback.buzzer;
    final bool vibrationFeedback =
        command.vibrationFeedback ?? _scannerFeedback.vibration;

    if (sendAckFeedback && buzzerFeedback) {
      feedbackCommands.add(Command(goodReadBuzzer, sendFeedback: false));
    }

    if (sendAckFeedback && ledFeedback) {
      feedbackCommands.add(Command(goodReadLed, sendFeedback: false));
    }

    if ((sendNakFeedback || sendAckFeedback) && vibrationFeedback) {
      feedbackCommands.add(Command(workVibration, sendFeedback: false));
    }

    if (sendNakFeedback && buzzerFeedback) {
      feedbackCommands.add(Command(badReadBuzzer, sendFeedback: false));
    }

    if (sendNakFeedback && ledFeedback) {
      feedbackCommands.add(Command(badReadLed, sendFeedback: false));
    }

    return feedbackCommands;
  }
}
