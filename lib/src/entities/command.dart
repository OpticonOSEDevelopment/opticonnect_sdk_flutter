import 'dart:async';

import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/entities/base_command.dart';
import 'package:opticonnect_sdk/src/extensions/command_buffer_extension.dart';

class Command extends BaseCommand {
  final Completer<CommandResponse> completer = Completer<CommandResponse>();
  late final String _data;
  String get data => _data;

  final bool sendFeedback;

  Command(
    super.code, {
    this.sendFeedback = true,
    super.parameters,
    super.ledFeedback,
    super.buzzerFeedback,
    super.vibrationFeedback,
  }) {
    final buffer = StringBuffer();

    String finalCode = code;

    if (code.length == 3) {
      finalCode = '[$code';
    } else if (code.length == 4) {
      finalCode = ']$code';
    }

    buffer.write(finalCode);
    for (int i = 0; i < parameters.length; i++) {
      buffer.addCommand(parameters[i]);
    }
    _data = buffer.toString();
  }

  bool retried = false;
}
