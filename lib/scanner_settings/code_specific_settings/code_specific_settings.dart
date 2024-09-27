import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific_settings/codabar_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific_settings/code_11_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific_settings/code_128_and_gs1_128_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific_settings/code_2_of_5_and_s_code_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific_settings/code_39_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific_settings/code_93_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific_settings/composite_codes_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific_settings/ean_13_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific_settings/ean_8_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific_settings/gs1_databar_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific_settings/iata_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific_settings/korean_postal_authority_code_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific_settings/msi_plessey_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific_settings/telepen_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific_settings/uk_plessey_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific_settings/upc_a_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific_settings/upc_e1_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific_settings/upc_e_settings.dart';
import 'package:opticonnect_sdk/src/scanner_settings/base_scanner_settings.dart';

/// A class providing access to settings for specific barcode symbologies.
///
/// This class includes settings for individual barcode types such as Codabar, Code 39,
/// UPC, EAN, and others. It allows you to configure scanner behavior for specific barcode formats.
///
/// It is recommended that you access this class through the `ScannerSettings` provided
/// by the `OptiConnectSDK`. There is no need to manually initialize or modify the settings
/// directly.
///
/// Example usage:
/// ```dart
/// final sdk = OptiConnectSDK.instance;
/// sdk.initialize();
/// final codeSettings = sdk.scannerSettings.codeSpecificSettings;
/// ```
@lazySingleton
class CodeSpecificSettings extends BaseScannerSettings {
  /// Settings related to Code 2 of 5 and S-Code symbologies.
  final Code2Of5AndSCodeSettings code2of5andSCodeSettings;

  /// Settings related to Codabar symbology.
  final CodabarSettings codabarSettings;

  /// Settings related to Code 11 symbology.
  final Code11Settings code11Settings;

  /// Settings related to Code 39 symbology.
  final Code39Settings code39Settings;

  /// Settings related to Code 93 symbology.
  final Code93Settings code93Settings;

  /// Settings related to Code 128 and GS1-128 symbologies.
  final Code128AndGS1128Settings code128AndGS1128Settings;

  /// Settings related to composite codes.
  final CompositeCodesSettings compositeCodesSettings;

  /// Settings related to EAN-8 symbology.
  final EAN8Settings ean8Settings;

  /// Settings related to EAN-13 symbology.
  final EAN13Settings ean13Settings;

  /// Settings related to GS1 Databar symbologies.
  final GS1DatabarSettings gs1DatabarSettings;

  /// Settings related to IATA symbology.
  final IATASettings iataSettings;

  /// Settings related to the Korean Postal Authority Code symbology.
  final KoreanPostalAuthorityCodeSettings koreanPostalAuthorityCodeSettings;

  /// Settings related to MSI Plessey symbology.
  final MSIPlesseySettings msiPlesseySettings;

  /// Settings related to Telepen symbology.
  final TelepenSettings telepenSettings;

  /// Settings related to UK Plessey symbology.
  final UKPlesseySettings ukPlesseySettings;

  /// Settings related to UPC-A symbology.
  final UPCASettings upcASettings;

  /// Settings related to UPC-E symbology.
  final UPCESettings upcESettings;

  /// Settings related to UPC-E1 symbology.
  final UPCE1Settings upcE1Settings;

  /// Injects the instances that provide access to settings for specific barcode symbologies.
  ///
  CodeSpecificSettings(
      this.codabarSettings,
      this.code11Settings,
      this.code2of5andSCodeSettings,
      this.code39Settings,
      this.code93Settings,
      this.code128AndGS1128Settings,
      this.compositeCodesSettings,
      this.ean8Settings,
      this.ean13Settings,
      this.gs1DatabarSettings,
      this.iataSettings,
      this.koreanPostalAuthorityCodeSettings,
      this.msiPlesseySettings,
      this.telepenSettings,
      this.ukPlesseySettings,
      this.upcASettings,
      this.upcESettings,
      this.upcE1Settings);
}
