part of 'package:opticonnect_sdk/entities/entities.dart';

/// Represents a command and its associated parameters for scanner settings.
///
/// This class is used to store a command and the list of parameters that
/// are associated with the command when interacting with a scanner.
///
/// It provides a structured way to store and access a command's details.
class CommandData {
  /// The command being executed or retrieved.
  ///
  /// This field stores the specific code of the command.
  String command;

  /// The list of parameters associated with the command.
  List<String> parameters;

  /// Constructs a [CommandData] instance with the given command.
  ///
  /// - [command]: The name or identifier of the command. The parameters
  ///   list is initialized as empty by default but can be filled as needed.
  CommandData(this.command) : parameters = [];
}
