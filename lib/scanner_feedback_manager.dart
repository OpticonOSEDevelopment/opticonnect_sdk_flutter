import 'package:injectable/injectable.dart';

@lazySingleton
class ScannerFeedbackManager {
  bool ledFeedback = true;
  bool buzzerFeedback = true;
  bool vibrationFeedback = true;

  void setFeedback({
    bool? led,
    bool? buzzer,
    bool? vibration,
  }) {
    if (led != null) ledFeedback = led;
    if (buzzer != null) buzzerFeedback = buzzer;
    if (vibration != null) vibrationFeedback = vibration;
  }
}
