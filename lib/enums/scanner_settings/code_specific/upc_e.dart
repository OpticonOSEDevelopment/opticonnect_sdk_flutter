part of 'package:opticonnect_sdk/enums.dart';

/// Enum representing the leading zero and check digit transmission settings for UPCE symbology.
enum UPCELeadingZeroAndTransmitCDMode {
  noLeadingZeroTransmitCD,
  noLeadingZeroDoNotTransmitCD,
  leadingZeroTransmitCD,
  leadingZeroDoNotTransmitCD,
}

/// Enum representing the conversion mode for UPCE symbology.
enum UPCEConversionMode {
  transmitAsIs,
  transmitAsUPCA,
}
