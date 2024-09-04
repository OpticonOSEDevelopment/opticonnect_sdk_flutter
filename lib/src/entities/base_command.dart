Future<void> _defaultCallback(_, __) async {}

abstract class BaseCommand {
  final String code;
  final Future<void> Function(String, bool) callback;
  final List<String> parameters;
  final bool ledFeedback;
  final bool buzzerFeedback;
  final bool vibrationFeedback;

  BaseCommand(
    this.code, {
    this.callback = _defaultCallback,
    this.parameters = const [],
    this.ledFeedback = true,
    this.buzzerFeedback = true,
    this.vibrationFeedback = true,
  });
}
