import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/interfaces/scanner_feedback.dart';

@LazySingleton(as: ScannerFeedback)
class ScannerFeedbackImpl implements ScannerFeedback {
  bool _led = true;
  bool _buzzer = true;
  bool _vibration = true;

  @override
  bool get led => _led;

  @override
  bool get buzzer => _buzzer;

  @override
  bool get vibration => _vibration;

  @override
  void set({bool? led, bool? buzzer, bool? vibration}) {
    if (led != null) _led = led;
    if (buzzer != null) _buzzer = buzzer;
    if (vibration != null) _vibration = vibration;
  }
}
