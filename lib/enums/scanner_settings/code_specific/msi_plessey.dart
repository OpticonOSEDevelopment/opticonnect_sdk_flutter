part of 'package:opticonnect_sdk/enums.dart';

/// Enum representing the check digit validation settings for MSI Plessey symbology.
enum MSIPlesseyCheckCDSettings {
  doNotCheckCD,
  check1CDMOD10,
  check2CDsMOD10MOD10,
  check2CDsMOD10MOD11,
  check2CDsMOD11MOD10,
  check2CDsMOD11MOD11,
}

/// Enum representing the transmission settings for check digits in MSI Plessey symbology.
enum MSIPlesseyCDTransmissionSettings {
  transmitCD1,
  transmitCD1AndCD2,
  doNotTransmitCD,
}
