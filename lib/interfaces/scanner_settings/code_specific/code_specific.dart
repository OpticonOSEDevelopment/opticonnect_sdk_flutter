part of 'package:opticonnect_sdk/interfaces.dart';

/// Interface for accessing settings for specific barcode symbologies.
///
/// This interface includes settings for individual barcode types such as Codabar, Code 39,
/// UPC, EAN, and others, allowing configuration of scanner behavior for specific barcode formats.
abstract class CodeSpecific {
  /// Settings related to Code 2 of 5 and S-Code symbologies.
  Code2Of5AndSCode get code2of5andSCode;

  /// Settings related to Codabar symbology.
  Codabar get codabar;

  /// Settings related to Code 11 symbology.
  Code11 get code11;

  /// Settings related to Code 39 symbology.
  Code39 get code39;

  /// Settings related to Code 93 symbology.
  Code93 get code93;

  /// Settings related to Code 128 and GS1-128 symbologies.
  Code128AndGS1128 get code128AndGS1128;

  /// Settings related to composite codes.
  CompositeCodes get compositeCodes;

  /// Settings related to EAN-8 symbology.
  EAN8 get ean8;

  /// Settings related to EAN-13 symbology.
  EAN13 get ean13;

  /// Settings related to GS1 Databar symbologies.
  GS1Databar get gs1Databar;

  /// Settings related to IATA symbology.
  IATA get iata;

  /// Settings related to the Korean Postal Authority Code symbology.
  KoreanPostalAuthority get koreanPostalAuthority;

  /// Settings related to MSI Plessey symbology.
  MSIPlessey get msiPlessey;

  /// Settings related to Telepen symbology.
  Telepen get telepen;

  /// Settings related to UK Plessey symbology.
  UKPlessey get ukPlessey;

  /// Settings related to UPC-A symbology.
  UPCA get upcA;

  /// Settings related to UPC-E symbology.
  UPCE get upcE;

  /// Settings related to UPC-E1 symbology.
  UPCE1 get upcE1;
}
