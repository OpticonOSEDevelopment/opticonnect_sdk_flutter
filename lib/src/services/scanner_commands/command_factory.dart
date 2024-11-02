import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/entities/entities.dart';
import 'package:opticonnect_sdk/src/entities/command.dart';

@lazySingleton
class CommandFactory {
  Command createCommand(ScannerCommand scannerCommand) {
    return Command(
      scannerCommand.code,
      parameters: scannerCommand.parameters,
      sendFeedback: scannerCommand.sendFeedback,
      ledFeedback: scannerCommand.ledFeedback,
      buzzerFeedback: scannerCommand.buzzerFeedback,
      vibrationFeedback: scannerCommand.vibrationFeedback,
    );
  }
}
