part of 'package:opticonnect_sdk/enums/enums.dart';

/// Enum representing the check digit validation settings for IATA symbology.
enum IATACheckCDSettings {
  doNetCheckCD,
  checkFCAndSNOnly,
  checkCPNFCAndSN,
  checkCPNACFCAndSN,
}
