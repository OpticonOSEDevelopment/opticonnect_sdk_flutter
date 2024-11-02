// src/scanner_settings/formatting_impl.dart
import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/constants.dart';
import 'package:opticonnect_sdk/entities/entities.dart';
import 'package:opticonnect_sdk/enums/enums.dart';
import 'package:opticonnect_sdk/helpers/direct_input_keys_helper.dart';
import 'package:opticonnect_sdk/interfaces/interfaces.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/interfaces/settings_base.dart';

@LazySingleton(as: Formatting)
class FormattingImpl extends SettingsBase implements Formatting {
  final AppLogger _appLogger;

  FormattingImpl(this._appLogger);

  /// Maps the [FormattableSymbology] to the corresponding prefix command string.
  final Map<FormattableSymbology, String> _prefixSymbologyCodesMap = {
    FormattableSymbology.allCodes: prefixAllCodes,
    FormattableSymbology.upcA: upcAPrefix,
    FormattableSymbology.upcAAddOn: upcAAddOnPrefix,
    FormattableSymbology.upcE: upcEPrefix,
    FormattableSymbology.upcEAddOn: upcEAddOnPrefix,
    FormattableSymbology.ean13: ean13Prefix,
    FormattableSymbology.ean13AddOn: ean13AddOnPrefix,
    FormattableSymbology.ean8: ean8Prefix,
    FormattableSymbology.ean8AddOn: ean8AddOnPrefix,
    FormattableSymbology.code39: code39Prefix,
    FormattableSymbology.codabar: codabarPrefix,
    FormattableSymbology.industrial2of5: industrial2of5Prefix,
    FormattableSymbology.interleaved2of5: interleaved2of5Prefix,
    FormattableSymbology.sCode: sCodePrefix,
    FormattableSymbology.matrix2of5: matrix2of5Prefix,
    FormattableSymbology.iata: iataPrefix,
    FormattableSymbology.code93: code93Prefix,
    FormattableSymbology.code128: code128Prefix,
    FormattableSymbology.gs1128: gs1128Prefix,
    FormattableSymbology.msiPlessey: msiPlesseyPrefix,
    FormattableSymbology.telepen: telepenPrefix,
    FormattableSymbology.ukPlessey: ukPlesseyPrefix,
    FormattableSymbology.dataMatrix: dataMatrixPrefix,
    FormattableSymbology.qrCode: qrCodePrefix,
    FormattableSymbology.maxiCode: maxiCodePrefix,
    FormattableSymbology.pdf417: pdf417Prefix,
    FormattableSymbology.microPDF417: microPDF417Prefix,
    FormattableSymbology.aztec: aztecPrefix,
    FormattableSymbology.code11: code11Prefix,
    FormattableSymbology.triOptic: triOpticPrefix,
    FormattableSymbology.koreanPostalAuthority: koreanPostalAuthorityPrefix,
    FormattableSymbology.dotCode: dotCodePrefix,
    FormattableSymbology.intelligentMail: intelligentMailPrefix,
    FormattableSymbology.postNet: postNetPrefix,
    FormattableSymbology.planet: planetPrefix,
    FormattableSymbology.japanesePostal: japanesePostalPrefix,
    FormattableSymbology.netherlandsKIX: netherlandsKIXPrefix,
    FormattableSymbology.ukPostal: ukPostalPrefix,
    FormattableSymbology.australianPostal: australianPostalPrefix,
    FormattableSymbology.mailMark4StatePostal: mailMark4StatePostalPrefix,
    FormattableSymbology.gs1DatabarOmnidirectional:
        gs1DatabarOmnidirectionalPrefix,
    FormattableSymbology.gs1DatabarLimited: gs1DatabarLimitedPrefix,
    FormattableSymbology.gs1DatabarExpanded: gs1DatabarExpandedPrefix,
    FormattableSymbology.gs1CompositeCode: gs1CompositeCodePrefix,
    FormattableSymbology.codablockF: codablockFPrefix,
    FormattableSymbology.chineseSensibleCode: chineseSensibleCodePrefix,
    FormattableSymbology.machineReadablePassports:
        machineReadablePassportsPrefix,
    FormattableSymbology.machineReadableVisaA: machineReadableVisaAPrefix,
    FormattableSymbology.machineReadableVisaB: machineReadableVisaBPrefix,
    FormattableSymbology.officialTravelDocuments1:
        officialTravelDocuments1Prefix,
    FormattableSymbology.officialTravelDocuments2:
        officialTravelDocuments2Prefix,
    FormattableSymbology.isbn: isbnPrefix,
    FormattableSymbology.japaneseBookPrice: japaneseBookPricePrefix,
    FormattableSymbology.japaneseDriverLicense: japaneseDriverLicensePrefix,
    FormattableSymbology.japanesePrivateNumber: japanesePrivateNumberPrefix,
  };

  /// Maps the [FormattableSymbology] to the corresponding suffix command string.
  final Map<FormattableSymbology, String> _suffixSymbologyCodesMap = {
    FormattableSymbology.allCodes: suffixAllCodes,
    FormattableSymbology.upcA: upcASuffix,
    FormattableSymbology.upcAAddOn: upcAAddOnSuffix,
    FormattableSymbology.upcE: upcESuffix,
    FormattableSymbology.upcEAddOn: upcEAddOnSuffix,
    FormattableSymbology.ean13: ean13Suffix,
    FormattableSymbology.ean13AddOn: ean13AddOnSuffix,
    FormattableSymbology.ean8: ean8Suffix,
    FormattableSymbology.ean8AddOn: ean8AddOnSuffix,
    FormattableSymbology.code39: code39Suffix,
    FormattableSymbology.codabar: codabarSuffix,
    FormattableSymbology.industrial2of5: industrial2of5Suffix,
    FormattableSymbology.interleaved2of5: interleaved2of5Suffix,
    FormattableSymbology.sCode: sCodeSuffix,
    FormattableSymbology.matrix2of5: matrix2of5Suffix,
    FormattableSymbology.iata: iataSuffix,
    FormattableSymbology.code93: code93Suffix,
    FormattableSymbology.code128: code128Suffix,
    FormattableSymbology.gs1128: gs1128Suffix,
    FormattableSymbology.msiPlessey: msiPlesseySuffix,
    FormattableSymbology.telepen: telepenSuffix,
    FormattableSymbology.ukPlessey: ukPlesseySuffix,
    FormattableSymbology.dataMatrix: dataMatrixSuffix,
    FormattableSymbology.qrCode: qrCodeSuffix,
    FormattableSymbology.maxiCode: maxiCodeSuffix,
    FormattableSymbology.pdf417: pdf417Suffix,
    FormattableSymbology.microPDF417: microPDF417Suffix,
    FormattableSymbology.aztec: aztecSuffix,
    FormattableSymbology.code11: code11Suffix,
    FormattableSymbology.triOptic: triOpticSuffix,
    FormattableSymbology.koreanPostalAuthority: koreanPostalAuthoritySuffix,
    FormattableSymbology.dotCode: dotCodeSuffix,
    FormattableSymbology.intelligentMail: intelligentMailSuffix,
    FormattableSymbology.postNet: postNetSuffix,
    FormattableSymbology.planet: planetSuffix,
    FormattableSymbology.japanesePostal: japanesePostalSuffix,
    FormattableSymbology.netherlandsKIX: netherlandsKIXSuffix,
    FormattableSymbology.ukPostal: ukPostalSuffix,
    FormattableSymbology.australianPostal: australianPostalSuffix,
    FormattableSymbology.mailMark4StatePostal: mailMark4StatePostalSuffix,
    FormattableSymbology.gs1DatabarOmnidirectional:
        gs1DatabarOmnidirectionalSuffix,
    FormattableSymbology.gs1DatabarLimited: gs1DatabarLimitedSuffix,
    FormattableSymbology.gs1DatabarExpanded: gs1DatabarExpandedSuffix,
    FormattableSymbology.gs1CompositeCode: gs1CompositeCodeSuffix,
    FormattableSymbology.codablockF: codablockFSuffix,
    FormattableSymbology.chineseSensibleCode: chineseSensibleCodeSuffix,
    FormattableSymbology.machineReadablePassports:
        machineReadablePassportsSuffix,
    FormattableSymbology.machineReadableVisaA: machineReadableVisaASuffix,
    FormattableSymbology.machineReadableVisaB: machineReadableVisaBSuffix,
    FormattableSymbology.officialTravelDocuments1:
        officialTravelDocuments1Suffix,
    FormattableSymbology.officialTravelDocuments2:
        officialTravelDocuments2Suffix,
    FormattableSymbology.isbn: isbnSuffix,
    FormattableSymbology.japaneseBookPrice: japaneseBookPriceSuffix,
    FormattableSymbology.japaneseDriverLicense: japaneseDriverLicenseSuffix,
    FormattableSymbology.japanesePrivateNumber: japanesePrivateNumberSuffix,
  };

  static const int _maxPrefixChars = 4;
  static const int _maxSuffixChars = 4;
  static const int _maxPreambleChars = 8;
  static const int _maxPostambleChars = 8;

  List<String> _getDirectInputKeysCodes(
      List<DirectInputKey> keys, int maxChars) {
    if (keys.length > maxChars) {
      _appLogger.warning(
          'Length is more than $maxChars characters. Cut off the excess characters.');
      keys = keys.sublist(0, maxChars);
    }

    return keys
        .map((k) => DirectInputKeysHelper.directInputKeyCodes[k])
        .whereType<String>()
        .toList();
  }

  List<String> _getDirectInputKeysCodesFromString(String input, int maxChars) {
    if (input.length > maxChars) {
      _appLogger.warning(
          'Length is more than $maxChars characters. Cut off the excess characters.');
      input = input.substring(0, maxChars);
    }

    final directInputKeys = input
        .split('')
        .map((char) {
          return DirectInputKeysHelper.charToDirectInputKey[char];
        })
        .whereType<DirectInputKey>()
        .toList();

    return _getDirectInputKeysCodes(directInputKeys, maxChars);
  }

  @override
  Future<CommandResponse> setPreambleFromKeys(
      {required String deviceId, required List<DirectInputKey> keys}) async {
    final directInputKeysCodes =
        _getDirectInputKeysCodes(keys, _maxPreambleChars);
    return sendCommand(deviceId, preamble, parameters: directInputKeysCodes);
  }

  @override
  Future<CommandResponse> setPreambleFromString(
      {required String deviceId, required String preamble}) {
    final directInputKeysCodes =
        _getDirectInputKeysCodesFromString(preamble, _maxPreambleChars);
    return sendCommand(deviceId, preamble, parameters: directInputKeysCodes);
  }

  @override
  Future<CommandResponse> clearPreamble(String deviceId) async {
    return sendCommand(deviceId, preamble);
  }

  @override
  Future<CommandResponse> setPrefixFromKeys(
      {required String deviceId,
      required List<DirectInputKey> keys,
      FormattableSymbology symbology = FormattableSymbology.allCodes}) async {
    final directInputKeysCodes =
        _getDirectInputKeysCodes(keys, _maxPrefixChars);
    return sendCommand(deviceId, _prefixSymbologyCodesMap[symbology]!,
        parameters: directInputKeysCodes);
  }

  @override
  Future<CommandResponse> setPrefixFromString(
      {required String deviceId,
      required String prefix,
      FormattableSymbology symbology = FormattableSymbology.allCodes}) async {
    final directInputKeysCodes =
        _getDirectInputKeysCodesFromString(prefix, _maxPrefixChars);
    return sendCommand(deviceId, _prefixSymbologyCodesMap[symbology]!,
        parameters: directInputKeysCodes);
  }

  @override
  Future<CommandResponse> clearAllPrefixes(String deviceId) async {
    return sendCommand(deviceId, clearPrefixes);
  }

  @override
  Future<CommandResponse> setSuffixFromKeys(
      {required String deviceId,
      required List<DirectInputKey> keys,
      FormattableSymbology symbology = FormattableSymbology.allCodes}) async {
    final directInputKeysCodes =
        _getDirectInputKeysCodes(keys, _maxSuffixChars);
    return sendCommand(deviceId, _suffixSymbologyCodesMap[symbology]!,
        parameters: directInputKeysCodes);
  }

  @override
  Future<CommandResponse> setSuffixFromString(
      {required String deviceId,
      required String suffix,
      FormattableSymbology symbology = FormattableSymbology.allCodes}) async {
    final directInputKeysCodes =
        _getDirectInputKeysCodesFromString(suffix, _maxSuffixChars);
    return sendCommand(deviceId, _suffixSymbologyCodesMap[symbology]!,
        parameters: directInputKeysCodes);
  }

  @override
  Future<CommandResponse> clearAllSuffixes(String deviceId) async {
    return sendCommand(deviceId, clearSuffixes);
  }

  @override
  Future<CommandResponse> setPostambleFromKeys(
      {required String deviceId, required List<DirectInputKey> keys}) async {
    final directInputKeysCodes =
        _getDirectInputKeysCodes(keys, _maxPostambleChars);
    return sendCommand(deviceId, postamble, parameters: directInputKeysCodes);
  }

  @override
  Future<CommandResponse> setPostambleFromString(
      {required String deviceId, required String postamble}) async {
    final directInputKeysCodes =
        _getDirectInputKeysCodesFromString(postamble, _maxPostambleChars);
    return sendCommand(deviceId, postamble, parameters: directInputKeysCodes);
  }

  @override
  Future<CommandResponse> clearPostamble(String deviceId) async {
    return sendCommand(deviceId, postamble);
  }
}
