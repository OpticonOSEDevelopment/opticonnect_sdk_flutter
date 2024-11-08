part of 'package:opticonnect_sdk/enums.dart';

/// Enum representing the various modes for Code 128 and GS1-128 symbologies.
enum Code128GS1128Mode {
  disableGS1128,
  enableGS1128Only,
  enableGS1128IfPossible,
}

/// Enum representing the various modes for GS1-128 Conversion.
enum GS1128ConversionMode {
  disableConversion,
  enableMode1,
  enableMode2,
  enableMode3,
  enableMode4,
}
