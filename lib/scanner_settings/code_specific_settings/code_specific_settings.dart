import 'package:opticonnect_sdk/scanner_settings/code_specific_settings/codabar_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific_settings/code_11_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific_settings/code_128_and_gs1_128_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific_settings/code_2_of_5_and_s_code_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific_settings/code_39_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific_settings/code_93_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific_settings/composite_codes_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific_settings/ean_13_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific_settings/ean_8_settings.dart';
import 'package:opticonnect_sdk/scanner_settings/code_specific_settings/ean_settings.dart';
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
class CodeSpecificSettings extends BaseScannerSettings {
  CodeSpecificSettings(super.sdk);

  /// Settings related to Code 2 of 5 and S-Code symbologies.
  late final Code2Of5AndSCodeSettings code2of5andSCodeSettings;

  /// Settings related to Codabar symbology.
  late final CodabarSettings codabarSettings;

  /// Settings related to Code 11 symbology.
  late final Code11Settings code11Settings;

  /// Settings related to Code 39 symbology.
  late final Code39Settings code39Settings;

  /// Settings related to Code 93 symbology.
  late final Code93Settings code93Settings;

  /// Settings related to Code 128 and GS1-128 symbologies.
  late final Code128AndGS1128Settings code128AndGS1128Settings;

  /// Settings related to composite codes.
  late final CompositeCodesSettings compositeCodesSettings;

  /// Settings related to both EAN-8 and EAN-13 symbologies.
  late final EANSettings eanSettings;

  /// Settings related to EAN-8 symbology.
  late final EAN8Settings ean8Settings;

  /// Settings related to EAN-13 symbology.
  late final EAN13Settings ean13Settings;

  /// Settings related to GS1 Databar symbologies.
  late final GS1DatabarSettings gs1DatabarSettings;

  /// Settings related to IATA symbology.
  late final IATASettings iataSettings;

  /// Settings related to the Korean Postal Authority Code symbology.
  late final KoreanPostalAuthorityCodeSettings
      koreanPostalAuthorityCodeSettings;

  /// Settings related to MSI Plessey symbology.
  late final MSIPlesseySettings msiPlesseySettings;

  /// Settings related to Telepen symbology.
  late final TelepenSettings telepenSettings;

  /// Settings related to UK Plessey symbology.
  late final UKPlesseySettings ukPlesseySettings;

  /// Settings related to UPC-A symbology.
  late final UPCASettings upcASettings;

  /// Settings related to UPC-E symbology.
  late final UPCESettings upcESettings;

  /// Settings related to UPC-E1 symbology.
  late final UPCE1Settings upcE1Settings;

  /// Initializes the properties that provide access to settings for specific barcode symbologies.
  ///
  /// This method is automatically called during the SDK initialization (`OptiConnectSDK.initialize()`),
  /// so it is not necessary to call this method manually.
  Future<void> initialize() async {
    code2of5andSCodeSettings = Code2Of5AndSCodeSettings(sdk);
    codabarSettings = CodabarSettings(sdk);
    code11Settings = Code11Settings(sdk);
    code39Settings = Code39Settings(sdk);
    code93Settings = Code93Settings(sdk);
    code128AndGS1128Settings = Code128AndGS1128Settings(sdk);
    compositeCodesSettings = CompositeCodesSettings(sdk);
    eanSettings = EANSettings(sdk);
    ean8Settings = EAN8Settings(sdk);
    ean13Settings = EAN13Settings(sdk);
    gs1DatabarSettings = GS1DatabarSettings(sdk);
    iataSettings = IATASettings(sdk);
    koreanPostalAuthorityCodeSettings = KoreanPostalAuthorityCodeSettings(sdk);
    msiPlesseySettings = MSIPlesseySettings(sdk);
    telepenSettings = TelepenSettings(sdk);
    ukPlesseySettings = UKPlesseySettings(sdk);
    upcASettings = UPCASettings(sdk);
    upcESettings = UPCESettings(sdk);
    upcE1Settings = UPCE1Settings(sdk);
  }
}
