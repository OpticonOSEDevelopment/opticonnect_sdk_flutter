import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/enums/direct_input_key.dart';
import 'package:opticonnect_sdk/enums/symbology.dart';
import 'package:opticonnect_sdk/helpers/direct_input_keys_helper.dart';
import 'package:opticonnect_sdk/src/injection/injection.config.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/scanner_settings/base_scanner_settings.dart';

/// A class responsible for configuring formatting options such as preambles, prefixes, suffixes, and postambles.
///
/// This class allows the setting of these formatting options using direct input keys or strings
/// and sends the corresponding commands to the BLE device.
class FormattingOptions extends BaseScannerSettings {
  final _appLogger = getIt<AppLogger>();

  /// Creates a [FormattingOptions] object for handling formatting settings of the scanner.
  ///
  /// - [sdk]: The instance of the SDK to communicate with the scanner.
  FormattingOptions(super.sdk);

  /// Maps the [Symbology] to the corresponding prefix command string.
  final Map<Symbology, String> _prefixSymbologyCodesMap = {
    Symbology.allCodes: prefixAllCodes,
    Symbology.upcA: upcAPrefix,
    Symbology.upcAAddOn: upcAAddOnPrefix,
    Symbology.upcE: upcEPrefix,
    Symbology.upcEAddOn: upcEAddOnPrefix,
    Symbology.ean13: ean13Prefix,
    Symbology.ean13AddOn: ean13AddOnPrefix,
    Symbology.ean8: ean8Prefix,
    Symbology.ean8AddOn: ean8AddOnPrefix,
    Symbology.code39: code39Prefix,
    Symbology.codabar: codabarPrefix,
    Symbology.industrial2of5: industrial2of5Prefix,
    Symbology.interleaved2of5: interleaved2of5Prefix,
    Symbology.sCode: sCodePrefix,
    Symbology.matrix2of5: matrix2of5Prefix,
    Symbology.iata: iataPrefix,
    Symbology.code93: code93Prefix,
    Symbology.code128: code128Prefix,
    Symbology.gs1128: gs1128Prefix,
    Symbology.msiPlessey: msiPlesseyPrefix,
    Symbology.telepen: telepenPrefix,
    Symbology.ukPlessey: ukPlesseyPrefix,
    Symbology.dataMatrix: dataMatrixPrefix,
    Symbology.qrCode: qrCodePrefix,
    Symbology.maxiCode: maxiCodePrefix,
    Symbology.pdf417: pdf417Prefix,
    Symbology.microPDF417: microPDF417Prefix,
    Symbology.aztec: aztecPrefix,
    Symbology.code11: code11Prefix,
    Symbology.triOptic: triOpticPrefix,
    Symbology.koreanPostalAuthority: koreanPostalAuthorityPrefix,
    Symbology.dotCode: dotCodePrefix,
    Symbology.intelligentMail: intelligentMailPrefix,
    Symbology.postNet: postNetPrefix,
    Symbology.planet: planetPrefix,
    Symbology.japanesePostal: japanesePostalPrefix,
    Symbology.netherlandsKIX: netherlandsKIXPrefix,
    Symbology.ukPostal: ukPostalPrefix,
    Symbology.australianPostal: australianPostalPrefix,
    Symbology.mailMark4StatePostal: mailMark4StatePostalPrefix,
    Symbology.gs1DatabarOmnidirectional: gs1DatabarOmnidirectionalPrefix,
    Symbology.gs1DatabarLimited: gs1DatabarLimitedPrefix,
    Symbology.gs1DatabarExpanded: gs1DatabarExpandedPrefix,
    Symbology.gs1CompositeCode: gs1CompositeCodePrefix,
    Symbology.codablockF: codablockFPrefix,
    Symbology.chineseSensibleCode: chineseSensibleCodePrefix,
    Symbology.machineReadablePassports: machineReadablePassportsPrefix,
    Symbology.machineReadableVisaA: machineReadableVisaAPrefix,
    Symbology.machineReadableVisaB: machineReadableVisaBPrefix,
    Symbology.officialTravelDocuments1: officialTravelDocuments1Prefix,
    Symbology.officialTravelDocuments2: officialTravelDocuments2Prefix,
    Symbology.isbn: isbnPrefix,
    Symbology.japaneseBookPrice: japaneseBookPricePrefix,
    Symbology.japaneseDriverLicense: japaneseDriverLicensePrefix,
    Symbology.japanesePrivateNumber: japanesePrivateNumberPrefix,
  };

  /// Maps the [Symbology] to the corresponding suffix command string.
  final Map<Symbology, String> _suffixSymbologyCodesMap = {
    Symbology.allCodes: suffixAllCodes,
    Symbology.upcA: upcASuffix,
    Symbology.upcAAddOn: upcAAddOnSuffix,
    Symbology.upcE: upcESuffix,
    Symbology.upcEAddOn: upcEAddOnSuffix,
    Symbology.ean13: ean13Suffix,
    Symbology.ean13AddOn: ean13AddOnSuffix,
    Symbology.ean8: ean8Suffix,
    Symbology.ean8AddOn: ean8AddOnSuffix,
    Symbology.code39: code39Suffix,
    Symbology.codabar: codabarSuffix,
    Symbology.industrial2of5: industrial2of5Suffix,
    Symbology.interleaved2of5: interleaved2of5Suffix,
    Symbology.sCode: sCodeSuffix,
    Symbology.matrix2of5: matrix2of5Suffix,
    Symbology.iata: iataSuffix,
    Symbology.code93: code93Suffix,
    Symbology.code128: code128Suffix,
    Symbology.gs1128: gs1128Suffix,
    Symbology.msiPlessey: msiPlesseySuffix,
    Symbology.telepen: telepenSuffix,
    Symbology.ukPlessey: ukPlesseySuffix,
    Symbology.dataMatrix: dataMatrixSuffix,
    Symbology.qrCode: qrCodeSuffix,
    Symbology.maxiCode: maxiCodeSuffix,
    Symbology.pdf417: pdf417Suffix,
    Symbology.microPDF417: microPDF417Suffix,
    Symbology.aztec: aztecSuffix,
    Symbology.code11: code11Suffix,
    Symbology.triOptic: triOpticSuffix,
    Symbology.koreanPostalAuthority: koreanPostalAuthoritySuffix,
    Symbology.dotCode: dotCodeSuffix,
    Symbology.intelligentMail: intelligentMailSuffix,
    Symbology.postNet: postNetSuffix,
    Symbology.planet: planetSuffix,
    Symbology.japanesePostal: japanesePostalSuffix,
    Symbology.netherlandsKIX: netherlandsKIXSuffix,
    Symbology.ukPostal: ukPostalSuffix,
    Symbology.australianPostal: australianPostalSuffix,
    Symbology.mailMark4StatePostal: mailMark4StatePostalSuffix,
    Symbology.gs1DatabarOmnidirectional: gs1DatabarOmnidirectionalSuffix,
    Symbology.gs1DatabarLimited: gs1DatabarLimitedSuffix,
    Symbology.gs1DatabarExpanded: gs1DatabarExpandedSuffix,
    Symbology.gs1CompositeCode: gs1CompositeCodeSuffix,
    Symbology.codablockF: codablockFSuffix,
    Symbology.chineseSensibleCode: chineseSensibleCodeSuffix,
    Symbology.machineReadablePassports: machineReadablePassportsSuffix,
    Symbology.machineReadableVisaA: machineReadableVisaASuffix,
    Symbology.machineReadableVisaB: machineReadableVisaBSuffix,
    Symbology.officialTravelDocuments1: officialTravelDocuments1Suffix,
    Symbology.officialTravelDocuments2: officialTravelDocuments2Suffix,
    Symbology.isbn: isbnSuffix,
    Symbology.japaneseBookPrice: japaneseBookPriceSuffix,
    Symbology.japaneseDriverLicense: japaneseDriverLicenseSuffix,
    Symbology.japanesePrivateNumber: japanesePrivateNumberSuffix,
  };

  static const int _maxPrefixChars = 4;
  static const int _maxSuffixChars = 4;
  static const int _maxPreambleChars = 8;
  static const int _maxPostambleChars = 8;

  /// Converts a list of [DirectInputKey] into their corresponding input key codes.
  ///
  /// - [keys]: A list of [DirectInputKey] values to convert.
  /// - [maxChars]: The maximum allowed number of characters.
  ///
  /// If the number of characters exceeds [maxChars], it trims the list.
  List<String> _getDirectInputKeysCodes(
      List<DirectInputKey> keys, int maxChars) {
    if (keys.length > maxChars) {
      _appLogger.warning(
          'Length is more than $maxChars characters. Cut off the excess characters.');
      keys = keys.sublist(0, maxChars);
    }

    return keys
        .map((k) {
          final code = DirectInputKeysHelper.directInputKeyCodes[k];

          if (code == null) {
            _appLogger
                .warning('No corresponding code found for DirectInputKey: $k');
          }

          return code;
        })
        .whereType<String>()
        .toList();
  }

  /// Converts a string into a list of corresponding input key codes.
  ///
  /// - [input]: The input string to convert.
  /// - [maxChars]: The maximum allowed number of characters.
  ///
  /// Any unrecognized characters will be logged and ignored.
  List<String> _getDirectInputKeysCodesFromString(String input, int maxChars) {
    if (input.length > maxChars) {
      _appLogger.warning(
          'Length is more than $maxChars characters. Cut off the excess characters.');
      input = input.substring(0, maxChars);
    }

    final List<DirectInputKey> directInputKeys = [];
    for (var char in input.split('')) {
      final key = DirectInputKeysHelper.charToDirectInputKey[char];

      if (key != null) {
        directInputKeys.add(key);
      } else {
        _appLogger.warning('Unrecognized character "$char".');
      }
    }

    return _getDirectInputKeysCodes(directInputKeys, maxChars);
  }

  /// Sets the preamble formatting using a list of [DirectInputKey].
  ///
  /// - [deviceId]: The ID of the BLE device.
  /// - [keys]: A list of [DirectInputKey] values to be used for the preamble.
  ///
  /// The preamble can have a maximum of 8 characters.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setPreambleFromKeys(
      String deviceId, List<DirectInputKey> keys) async {
    final directInputKeysCodes =
        _getDirectInputKeysCodes(keys, _maxPreambleChars);
    return sendCommand(deviceId, preamble, parameters: directInputKeysCodes);
  }

  /// Sets the preamble formatting using a string.
  ///
  /// - [deviceId]: The ID of the BLE device.
  /// - [preamble]: A string to be used as the preamble.
  ///
  /// The preamble can have a maximum of 8 characters.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setPreambleFromString(
      String deviceId, String preamble) {
    final directInputKeysCodes =
        _getDirectInputKeysCodesFromString(preamble, _maxPreambleChars);
    return sendCommand(deviceId, preamble, parameters: directInputKeysCodes);
  }

  /// Clears the preamble formatting on the device.
  ///
  /// - [deviceId]: The ID of the BLE device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> clearPreamble(String deviceId) async {
    return sendCommand(deviceId, preamble);
  }

  /// Sets the prefix formatting using a list of [DirectInputKey].
  ///
  /// - [deviceId]: The ID of the BLE device.
  /// - [keys]: A list of [DirectInputKey] values to be used for the prefix.
  ///
  /// The prefix can have a maximum of 4 characters.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setPrefixFromKeys(
      String deviceId, List<DirectInputKey> keys,
      {Symbology symbology = Symbology.allCodes}) async {
    final directInputKeysCodes =
        _getDirectInputKeysCodes(keys, _maxPrefixChars);
    return sendCommand(deviceId, _prefixSymbologyCodesMap[symbology]!,
        parameters: directInputKeysCodes);
  }

  /// Sets the prefix formatting using a string.
  ///
  /// - [deviceId]: The ID of the BLE device.
  /// - [prefix]: A string to be used as the prefix.
  ///
  /// The prefix can have a maximum of 4 characters.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setPrefixFromString(String deviceId, String prefix,
      {Symbology symbology = Symbology.allCodes}) async {
    final directInputKeysCodes =
        _getDirectInputKeysCodesFromString(prefix, _maxPrefixChars);
    return sendCommand(deviceId, _prefixSymbologyCodesMap[symbology]!,
        parameters: directInputKeysCodes);
  }

  /// Clears the prefix formatting on the device.
  ///
  /// - [deviceId]: The ID of the BLE device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> clearAllPrefixes(String deviceId) async {
    return sendCommand(deviceId, clearPrefixes);
  }

  /// Sets the suffix formatting using a list of [DirectInputKey].
  ///
  /// - [deviceId]: The ID of the BLE device.
  /// - [keys]: A list of [DirectInputKey] values to be used for the suffix.
  ///
  /// The suffix can have a maximum of 4 characters.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setSuffixFromKeys(
      String deviceId, List<DirectInputKey> keys,
      {Symbology symbology = Symbology.allCodes}) async {
    final directInputKeysCodes =
        _getDirectInputKeysCodes(keys, _maxSuffixChars);
    return sendCommand(deviceId, _suffixSymbologyCodesMap[symbology]!,
        parameters: directInputKeysCodes);
  }

  /// Sets the suffix formatting using a string.
  ///
  /// - [deviceId]: The ID of the BLE device.
  /// - [suffix]: A string to be used as the suffix.
  ///
  /// The suffix can have a maximum of 4 characters.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setSuffixFromString(String deviceId, String suffix,
      {Symbology symbology = Symbology.allCodes}) async {
    final directInputKeysCodes =
        _getDirectInputKeysCodesFromString(suffix, _maxSuffixChars);
    return sendCommand(deviceId, _suffixSymbologyCodesMap[symbology]!,
        parameters: directInputKeysCodes);
  }

  /// Clears the suffix formatting on the device.
  ///
  /// - [deviceId]: The ID of the BLE device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> clearAllSuffixes(String deviceId) async {
    return sendCommand(deviceId, clearSuffixes);
  }

  /// Sets the postamble formatting using a list of [DirectInputKey].
  ///
  /// - [deviceId]: The ID of the BLE device.
  /// - [keys]: A list of [DirectInputKey] values to be used for the postamble.
  ///
  /// The postamble can have a maximum of 8 characters.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setPostambleFromKeys(
      String deviceId, List<DirectInputKey> keys) async {
    final directInputKeysCodes =
        _getDirectInputKeysCodes(keys, _maxPostambleChars);
    return sendCommand(deviceId, postamble, parameters: directInputKeysCodes);
  }

  /// Sets the postamble formatting using a string.
  ///
  /// - [deviceId]: The ID of the BLE device.
  /// - [postamble]: A string to be used as the postamble.
  ///
  /// The postamble can have a maximum of 8 characters.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setPostambleFromString(
      String deviceId, String postamble) async {
    final directInputKeysCodes =
        _getDirectInputKeysCodesFromString(postamble, _maxPostambleChars);
    return sendCommand(deviceId, postamble, parameters: directInputKeysCodes);
  }

  /// Clears the postamble formatting on the device.
  ///
  /// - [deviceId]: The ID of the BLE device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> clearPostamble(String deviceId) async {
    return sendCommand(deviceId, postamble);
  }
}
