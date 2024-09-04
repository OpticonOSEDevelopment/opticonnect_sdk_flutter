import 'package:opticonnect_sdk/src/entities/command.dart';

abstract class CommandBytesProvider {
  List<int> getCommandBytes(Command command);
}
