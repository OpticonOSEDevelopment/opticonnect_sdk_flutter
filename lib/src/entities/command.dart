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

  Command(
    super.code, {
    super.parameters,
    super.sendFeedback = true,
    super.ledFeedback,
    super.buzzerFeedback,
    super.vibrationFeedback,
  }) {
    buildParsedData();
  }

  @protected
  void buildParsedData() {
    final buffer = StringBuffer();
    buffer.write(code);

    for (int i = 0; i < parameters.length; i++) {
      buffer.addCommand(parameters[i]);
    }
    parsedData = buffer.toString();
  }

  bool retried = false;
}
