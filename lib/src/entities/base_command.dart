abstract class BaseCommand {
  final String code;
  final List<String> parameters;
  final bool sendFeedback;
  final bool ledFeedback;
  final bool buzzerFeedback;
  final bool vibrationFeedback;

  BaseCommand(
    this.code, {
    this.parameters = const [],
    this.sendFeedback = true,
    this.ledFeedback = true,
    this.buzzerFeedback = true,
    this.vibrationFeedback = true,
  });
}
