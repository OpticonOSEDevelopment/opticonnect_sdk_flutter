import 'dart:async';

class CommandTimeoutManager {
  Timer? _timeoutTimer;

  void startTimeout(Duration timeoutDuration, void Function() onTimeout) {
    _timeoutTimer?.cancel();
    _timeoutTimer = Timer(timeoutDuration, onTimeout);
  }

  void cancelTimeout() {
    _timeoutTimer?.cancel();
  }

  void dispose() {
    _timeoutTimer?.cancel();
  }
}
