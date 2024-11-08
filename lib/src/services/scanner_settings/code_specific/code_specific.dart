import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/interfaces.dart';
import 'package:opticonnect_sdk/src/interfaces/settings_base.dart';

/// Implementation for accessing settings for specific barcode symbologies.
@LazySingleton(as: CodeSpecific)
class CodeSpecificImpl extends SettingsBase implements CodeSpecific {
  @override
  final Code2Of5AndSCode code2of5andSCode;

  @override
  final Codabar codabar;

  @override
  final Code11 code11;

  @override
  final Code39 code39;

  @override
  final Code93 code93;

  @override
  final Code128AndGS1128 code128AndGS1128;

  @override
  final CompositeCodes compositeCodes;

  @override
  final EAN8 ean8;

  @override
  final EAN13 ean13;

  @override
  final GS1Databar gs1Databar;

  @override
  final IATA iata;

  @override
  final KoreanPostalAuthority koreanPostalAuthority;

  @override
  final MSIPlessey msiPlessey;

  @override
  final Telepen telepen;

  @override
  final UKPlessey ukPlessey;

  @override
  final UPCA upcA;

  @override
  final UPCE upcE;

  @override
  final UPCE1 upcE1;

  /// Injects the instances that provide access to settings for specific barcode symbologies.
  CodeSpecificImpl(
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
