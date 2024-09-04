import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/entities/scanner_command.dart';
import 'package:opticonnect_sdk/src/entities/command.dart';

@lazySingleton
class CommandFactory {
  Command createCommand(ScannerCommand scannerCommand) {
    return Command(
      scannerCommand.code,
      callback: (String feedback, bool succeeded) async {
        await scannerCommand.callback.call(feedback, succeeded);
      },
      parameters: scannerCommand.parameters,
      ledFeedback: scannerCommand.ledFeedback,
      buzzerFeedback: scannerCommand.buzzerFeedback,
      vibrationFeedback: scannerCommand.vibrationFeedback,
    );
  }
}
