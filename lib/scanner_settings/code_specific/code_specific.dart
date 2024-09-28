import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific/codabar.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific/code_11.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific/code_128_and_gs1_128.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific/code_2_of_5_and_s_code.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific/code_39.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific/code_93.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific/composite_codes.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific/ean_13.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific/ean_8.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific/gs1_databar.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific/iata.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific/korean_postal_authority.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific/msi_plessey.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific/telepen.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific/uk_plessey.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific/upc_a.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific/upc_e.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific/upc_e1.dart';
import 'package:opticonnect_sdk/src/scanner_settings/settings_base.dart';

/// A class providing access to settings for specific barcode symbologies.
///
/// This class includes settings for individual barcode types such as Codabar, Code 39,
/// UPC, EAN, and others. It allows you to configure scanner behavior for specific barcode formats.
///
/// It is recommended that you access this class via the `OptiConnect` class
/// and avoid direct initialization.
@lazySingleton
class CodeSpecific extends SettingsBase {
  /// Settings related to Code 2 of 5 and S-Code symbologies.
  final Code2Of5AndSCode code2of5andSCode;

  /// Settings related to Codabar symbology.
  final Codabar codabar;

  /// Settings related to Code 11 symbology.
  final Code11 code11;

  /// Settings related to Code 39 symbology.
  final Code39 code39;

  /// Settings related to Code 93 symbology.
  final Code93 code93;

  /// Settings related to Code 128 and GS1-128 symbologies.
  final Code128AndGS1128 code128AndGS1128;

  /// Settings related to composite codes.
  final CompositeCodes compositeCodes;

  /// Settings related to EAN-8 symbology.
  final EAN8 ean8;

  /// Settings related to EAN-13 symbology.
  final EAN13 ean13;

  /// Settings related to GS1 Databar symbologies.
  final GS1Databar gs1Databar;

  /// Settings related to IATA symbology.
  final IATA iata;

  /// Settings related to the Korean Postal Authority Code symbology.
  final KoreanPostalAuthority koreanPostalAuthority;

  /// Settings related to MSI Plessey symbology.
  final MSIPlessey msiPlessey;

  /// Settings related to Telepen symbology.
  final Telepen telepen;

  /// Settings related to UK Plessey symbology.
  final UKPlessey ukPlessey;

  /// Settings related to UPC-A symbology.
  final UPCA upcA;

  /// Settings related to UPC-E symbology.
  final UPCE upcE;

  /// Settings related to UPC-E1 symbology.
  final UPCE1 upcE1;

  /// Injects the instances that provide access to settings for specific barcode symbologies.
  CodeSpecific(
      this.code2of5andSCode,
      this.codabar,
      this.code11,
      this.code39,
      this.code93,
      this.code128AndGS1128,
      this.compositeCodes,
      this.ean8,
      this.ean13,
      this.gs1Databar,
      this.iata,
      this.koreanPostalAuthority,
      this.msiPlessey,
      this.telepen,
      this.ukPlessey,
      this.upcA,
      this.upcE,
      this.upcE1);
}
