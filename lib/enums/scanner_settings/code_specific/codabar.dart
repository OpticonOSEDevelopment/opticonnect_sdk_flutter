part of 'package:opticonnect_sdk/enums/enums.dart';

/// Enum representing different modes for Codabar symbology.
enum CodabarMode {
  /// Normal Codabar mode.
  normal,

  /// Codabar mode with only ABC codes.
  abcCodeOnly,

  /// Codabar mode with only CX codes.
  cxCodeOnly,

  /// Codabar mode with both ABC and CX codes.
  codabarABCAndCX,
}

/// Enum representing the start and stop character transmission options for Codabar symbology.
enum CodabarStartStopTransmission {
  /// Do not transmit start and stop characters.
  doNotTransmitStartStop,

  /// Transmit start and stop characters in ABCD-ABCD format.
  startStopABCDABCD,

  /// Transmit start and stop characters in abcd-abcd format.
  startStopabcdabcd,

  /// Transmit start and stop characters in ABCD-TNxE format.
  startStopABCDTNxE,

  /// Transmit start and stop characters in abcd-tnxe format.
  startStopabcdtnxe,

  /// Transmit start and stop characters in DC1-DC2-DC3-DC4 format.
  startStopDC1DC2DC3DC4,
}

/// Enum representing the minimum data lengths for Codabar symbology.
enum CodabarMinimumLength {
  /// Minimum length of 1 character.
  oneCharacter,

  /// Minimum length of 3 characters.
  threeCharacters,

  /// Minimum length of 5 characters.
  fiveCharacters,
}
