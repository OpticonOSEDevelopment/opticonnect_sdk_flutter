/// Enum representing the different types of buzzer sounds.
enum BuzzerType {
  singleToneBuzzer,
  highLowBuzzer,
  lowHighBuzzer,
}

/// Enum representing different durations for the buzzer sound.
enum BuzzerDuration {
  duration50ms,
  duration75ms,
  duration100ms,
  duration200ms,
  duration400ms,
}

/// Enum representing different durations for the vibration.
enum VibratorDuration {
  duration50ms,
  duration100ms,
}

/// Enum representing different durations for the good read LED.
enum GoodReadLedDuration {
  disabled,
  duration10ms,
  duration60ms,
  duration100ms,
  duration200ms,
  duration400ms,
  duration500ms,
  duration800ms,
  duration2000ms,
}
