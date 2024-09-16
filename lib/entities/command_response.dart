/// A class representing the response of a command sent to a device.
class CommandResponse {
  /// The response message from the command.
  ///
  /// If the command fails, this contains the error message. If successful, this may be empty.
  final String response;

  /// A flag indicating whether the command succeeded or failed.
  final bool succeeded;

  /// Constructs a [CommandResponse] with a response message and a success flag.
  ///
  /// - [response]: The response message, which may contain details about the success or failure.
  /// - [succeeded]: A boolean indicating if the operation succeeded (`true`) or failed (`false`).
  CommandResponse(this.response, this.succeeded);

  /// Creates a [CommandResponse] representing a failure.
  ///
  /// - [message]: The error message explaining why the command failed.
  /// - Returns: A [CommandResponse] with the `succeeded` flag set to `false`.
  factory CommandResponse.failed(String message) {
    return CommandResponse(message, false);
  }

  /// Creates a [CommandResponse] representing a success.
  ///
  /// - Returns: A [CommandResponse] with an empty response message and the `succeeded` flag set to `true`.
  factory CommandResponse.succeeded() {
    return CommandResponse('', true);
  }
}
