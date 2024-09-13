class CommandResponse {
  final String response;
  final bool succeeded;

  CommandResponse(this.response, this.succeeded);

  factory CommandResponse.failed(String message) {
    return CommandResponse(message, false);
  }
}
