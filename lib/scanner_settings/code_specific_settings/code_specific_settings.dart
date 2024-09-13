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
import 'package:opticonnect_sdk/scanner_settings/scanner_settings.dart';

class CodeSpecificSettings extends ScannerSettings {
  CodeSpecificSettings(super.sdk);

  late final Code2Of5AndSCodeSettings code2of5andSCodeSettings;
  late final CodabarSettings codabarSettings;
  late final Code11Settings code11Settings;
  late final Code39Settings code39Settings;
  late final Code93Settings code93Settings;
  late final Code128AndGS1128Settings code128AndGS1128Settings;
  late final CompositeCodesSettings compositeCodesSettings;
  late final EAN8Settings ean8Settings;
  late final EAN13Settings ean13Settings;
  late final GS1DatabarSettings gs1DatabarSettings;
  late final IATASettings iataSettings;
  late final KoreanPostalAuthorityCodeSettings
      koreanPostalAuthorityCodeSettings;
  late final MSIPlesseySettings msiPlesseySettings;
  late final TelepenSettings telepenSettings;
  late final UKPlesseySettings ukPlesseySettings;
  late final UPCASettings upcASettings;
  late final UPCASettings upcESettings;

  Future<void> initialize() async {
    code2of5andSCodeSettings = Code2Of5AndSCodeSettings(sdk);
    codabarSettings = CodabarSettings(sdk);
    code11Settings = Code11Settings(sdk);
    code39Settings = Code39Settings(sdk);
    code93Settings = Code93Settings(sdk);
    code128AndGS1128Settings = Code128AndGS1128Settings(sdk);
    compositeCodesSettings = CompositeCodesSettings(sdk);
    ean8Settings = EAN8Settings(sdk);
    ean13Settings = EAN13Settings(sdk);
    gs1DatabarSettings = GS1DatabarSettings(sdk);
    iataSettings = IATASettings(sdk);
    koreanPostalAuthorityCodeSettings = KoreanPostalAuthorityCodeSettings(sdk);
    msiPlesseySettings = MSIPlesseySettings(sdk);
    telepenSettings = TelepenSettings(sdk);
    ukPlesseySettings = UKPlesseySettings(sdk);
    upcASettings = UPCASettings(sdk);
    upcESettings = UPCASettings(sdk);
  }
}
