extension CommandBufferExtension on StringBuffer {
  void addCommand(String command) {
    if (command.length == 4) {
      writeAll([']', command]);
    } else if (command.length == 3) {
      writeAll(['[', command]);
    } else {
      write(command);
    }
  }
}
