import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/entities/base_command.dart';
import 'package:opticonnect_sdk/src/extensions/command_buffer_extension.dart';

class Command extends BaseCommand {
  final Completer<CommandResponse> completer = Completer<CommandResponse>();
  @protected
  late final String parsedData;
  String get data => parsedData;

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
    final finalCode = formatCode(code);
    buffer.write(finalCode);

    for (int i = 0; i < parameters.length; i++) {
      buffer.addCommand(parameters[i]);
    }
    parsedData = buffer.toString();
  }

  static String formatCode(String code) {
    if (code.length == 3) {
      return '[$code';
    } else if (code.length == 4) {
      return ']$code';
    } else {
      return code;
    }
  }

  bool retried = false;
}
