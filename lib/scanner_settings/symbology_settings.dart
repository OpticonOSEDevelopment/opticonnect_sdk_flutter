import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/enums/symbology_type.dart';
import 'package:opticonnect_sdk/src/injection/injection.config.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/scanner_settings/base_scanner_settings.dart';

/// A class representing settings for enabling and disabling symbologies in the scanner.
///
/// This class provides methods to enable, disable, or enable-only specific symbologies on a scanner.
class SymbologySettings extends BaseScannerSettings {
  SymbologySettings(super.sdk);

  final AppLogger _appLogger = getIt<AppLogger>();

  /// Maps each symbology type to its respective enable command.
  final Map<SymbologyType, String> _enableSymbologyCommands = {
    SymbologyType.allCodes: enableAllCodesExclAddon,
    SymbologyType.all1DCodes: enableAll1DCodesExclAddon,
    SymbologyType.code11: enableCode11,
    SymbologyType.code39: enableCode39,
    SymbologyType.code93: enableCode93,
    SymbologyType.code128: enableCode128,
    SymbologyType.codabar: enableCodabar,
    SymbologyType.ean8: enableEAN8,
    SymbologyType.ean8AddOn2: enableEAN8Plus2,
    SymbologyType.ean8AddOn5: enableEAN8Plus5,
    SymbologyType.ean13: enableEAN13,
    SymbologyType.ean13AddOn2: enableEAN13Plus2,
    SymbologyType.ean13AddOn5: enableEAN13Plus5,
    SymbologyType.iata: enableIATA,
    SymbologyType.industrial2of5: enableIndustrial2of5,
    SymbologyType.interleaved2of5: enableInterleaved2of5,
    SymbologyType.matrix2of5: enableMatrix2of5,
    SymbologyType.msiPlessey: enableMSIPlessey,
    SymbologyType.sCode: enableSCode,
    SymbologyType.telepen: enableTelepen,
    SymbologyType.triOptic: enableTriOptic,
    SymbologyType.ukPlessey: enableUKPlessey,
    SymbologyType.upcA: enableUPCA,
    SymbologyType.upcAAddOn2: enableUPCAPlus2,
    SymbologyType.upcAAddOn5: enableUPCAPlus5,
    SymbologyType.upcE: enableUPCE,
    SymbologyType.upcEAddOn2: enableUPCEPlus2,
    SymbologyType.upcEAddOn5: enableUPCEPlus5,
    SymbologyType.upcE1: enableUPCE1,
    SymbologyType.upcE1AddOn2: enableUPCE1Plus2,
    SymbologyType.upcE1AddOn5: enableUPCE1Plus5,
    SymbologyType.gs1DataBar: enableGS1DataBar,
    SymbologyType.gs1DataBarLimited: enableGS1DatabarLimited,
    SymbologyType.gs1DataBarExpanded: enableGS1DataBarExpanded,
    SymbologyType.all2DCodes: enableAll2DCodes,
    SymbologyType.aztecCode: enableAztecCode,
    SymbologyType.aztecRunes: enableAztecRunes,
    SymbologyType.chineseSensibleCode: enableChineseSensibleCode,
    SymbologyType.codablockF: enableCodablockF,
    SymbologyType.dataMatrix: enableDataMatrix,
    SymbologyType.dataMatrixOldECC000_140: enableDataMatrixOldECC000_140,
    SymbologyType.dotCode: enableDotCode,
    SymbologyType.maxicode: enableMaxicode,
    SymbologyType.microPDF417: enableMicroPDF417,
    SymbologyType.microQRCode: enableMicroQRCode,
    SymbologyType.pdf417: enablePDF417,
    SymbologyType.qrCode: enableQRCode,
    SymbologyType.australianPostal: enableAustralianPostal,
    SymbologyType.chinesePostMatrix2of5: enableChinesePostMatrix2of5,
    SymbologyType.intelligentMailBarcode: enableIntelligentMailBarcode,
    SymbologyType.japanesePostal: enableJapanesePostal,
    SymbologyType.koreanPostalAuthority: enableKoreanPostalAuthority,
    SymbologyType.mailmark4StatePostal: enableMailmark4StatePostal,
    SymbologyType.netherlandsKIXCode: enableNetherlandsKIXCode,
    SymbologyType.planet: enablePlanet,
    SymbologyType.postnet: enablePostnet,
    SymbologyType.ukPostal: enableUKPostal,
  };

  /// Maps each symbology type to its respective disable command.
  final Map<SymbologyType, String> _disableSymbologyCommands = {
    SymbologyType.allCodes: disableAllCodes,
    SymbologyType.all1DCodes: disableAll1DCodes,
    SymbologyType.code11: disableCode11,
    SymbologyType.code39: disableCode39,
    SymbologyType.code93: disableCode93,
    SymbologyType.code128: disableCode128,
    SymbologyType.codabar: disableCodabar,
    SymbologyType.ean8: disableEAN8,
    SymbologyType.ean8AddOn2: disableEAN8Plus2,
    SymbologyType.ean8AddOn5: disableEAN8Plus5,
    SymbologyType.ean13: disableEAN13,
    SymbologyType.ean13AddOn2: disableEAN13Plus2,
    SymbologyType.ean13AddOn5: disableEAN13Plus5,
    SymbologyType.iata: disableIATA,
    SymbologyType.industrial2of5: disableIndustrial2of5,
    SymbologyType.interleaved2of5: disableInterleaved2of5,
    SymbologyType.matrix2of5: disableMatrix2of5,
    SymbologyType.msiPlessey: disableMsiPlessey,
    SymbologyType.sCode: disableSCode,
    SymbologyType.telepen: disableTelepen,
    SymbologyType.triOptic: disableTriOptic,
    SymbologyType.ukPlessey: disableUKPlessey,
    SymbologyType.upcA: disableUPCA,
    SymbologyType.upcAAddOn2: disableUPCAPlus2,
    SymbologyType.upcAAddOn5: disableUPCAPlus5,
    SymbologyType.upcE: disableUPCE,
    SymbologyType.upcEAddOn2: disableUPCEPlus2,
    SymbologyType.upcEAddOn5: disableUPCEPlus5,
    SymbologyType.upcE1: disableUPCE1,
    SymbologyType.upcE1AddOn2: disableUPCE1Plus2,
    SymbologyType.upcE1AddOn5: disableUPCE1Plus5,
    SymbologyType.gs1DataBar: disableGS1DataBar,
    SymbologyType.gs1DataBarLimited: disableGS1DataBarLimited,
    SymbologyType.gs1DataBarExpanded: disableGS1DataBarExpanded,
    SymbologyType.all2DCodes: disableAll2DCodes,
    SymbologyType.aztecCode: disableAztecCode,
    SymbologyType.aztecRunes: disableAztecRunes,
    SymbologyType.chineseSensibleCode: disableChineseSensibleCode,
    SymbologyType.codablockF: disableCodablockF,
    SymbologyType.dataMatrix: disableDataMatrix,
    SymbologyType.dataMatrixOldECC000_140: disableDataMatrixOldECC000_140,
    SymbologyType.dotCode: disableDotCode,
    SymbologyType.maxicode: disableMaxicode,
    SymbologyType.microPDF417: disableMicroPDF417,
    SymbologyType.microQRCode: disableMicroQRCode,
    SymbologyType.pdf417: disablePDF417,
    SymbologyType.qrCode: disableQRCode,
    SymbologyType.australianPostal: disableAustralianPostal,
    SymbologyType.chinesePostMatrix2of5: disableChinesePostMatrix2of5,
    SymbologyType.intelligentMailBarcode: disableIntelligentMailBarcode,
    SymbologyType.japanesePostal: disableJapanesePostal,
    SymbologyType.koreanPostalAuthority: disableKoreanPostalAuthority,
    SymbologyType.mailmark4StatePostal: disableMailmark4StatePostal,
    SymbologyType.netherlandsKIXCode: disableNetherlandsKIXCode,
    SymbologyType.planet: disablePlanet,
    SymbologyType.postnet: disablePostnet,
    SymbologyType.ukPostal: disableUKPostal,
  };

  /// Maps each symbology type to its respective enable-only command.
  final Map<SymbologyType, String> _enableOnlySymbologyCommands = {
    SymbologyType.allCodes: enableAllCodesExclAddon,
    SymbologyType.all1DCodes: enable1DAllCodesExclAddonOnly,
    SymbologyType.code11: enableCode11Only,
    SymbologyType.code39: enableCode39Only,
    SymbologyType.code93: enableCode93Only,
    SymbologyType.code128: enableCode128Only,
    SymbologyType.codabar: enableCodabarOnly,
    SymbologyType.ean8: enableEAN8Only,
    SymbologyType.ean8AddOn2: enableEAN8Plus2Only,
    SymbologyType.ean8AddOn5: enableEAN8Plus5Only,
    SymbologyType.ean13: enableEAN13Only,
    SymbologyType.ean13AddOn2: enableEAN13Plus2Only,
    SymbologyType.ean13AddOn5: enableEAN13Plus5Only,
    SymbologyType.iata: enableIATAOnly,
    SymbologyType.industrial2of5: enableIndustrial2of5Only,
    SymbologyType.interleaved2of5: enableInterleaved2of5Only,
    SymbologyType.matrix2of5: enableMatrix2of5Only,
    SymbologyType.msiPlessey: enableMSIPlesseyOnly,
    SymbologyType.sCode: enableSCodeOnly,
    SymbologyType.telepen: enableTelepenOnly,
    SymbologyType.triOptic: enableTriOpticOnly,
    SymbologyType.ukPlessey: enableUKPlesseyOnly,
    SymbologyType.upcA: enableUPCAOnly,
    SymbologyType.upcAAddOn2: enableUPCAPlus2Only,
    SymbologyType.upcAAddOn5: enableUPCAPlus5Only,
    SymbologyType.upcE: enableUPCEOnly,
    SymbologyType.upcEAddOn2: enableUPCEPlus2Only,
    SymbologyType.upcEAddOn5: enableUPCEPlus5Only,
    SymbologyType.upcE1: enableUPCE1Only,
    SymbologyType.upcE1AddOn2: enableUPCE1Plus2Only,
    SymbologyType.upcE1AddOn5: enableUPCE1Plus5Only,
    SymbologyType.gs1DataBar: enableGS1DataBarOnly,
    SymbologyType.gs1DataBarLimited: enableGS1DataBarLimitedOnly,
    SymbologyType.gs1DataBarExpanded: enableGS1DataBarExpandedOnly,
    SymbologyType.all2DCodes: enable2DAllCodesOnly,
    SymbologyType.aztecCode: enableAztecCodeOnly,
    SymbologyType.aztecRunes: enableAztecRunesOnly,
    SymbologyType.chineseSensibleCode: enableChineseSensibleCodeOnly,
    SymbologyType.codablockF: enableCodablockFOnly,
    SymbologyType.dataMatrix: enableDataMatrixOnly,
    SymbologyType.dataMatrixOldECC000_140: enableDataMatrixOldECC000_140Only,
    SymbologyType.dotCode: enableDotCodeOnly,
    SymbologyType.maxicode: enableMaxicodeOnly,
    SymbologyType.microPDF417: enableMicroPDF417Only,
    SymbologyType.microQRCode: enableMicroQRCodeOnly,
    SymbologyType.pdf417: enablePDF417Only,
    SymbologyType.qrCode: enableQRCodeOnly,
    SymbologyType.australianPostal: enableAustralianPostalOnly,
    SymbologyType.chinesePostMatrix2of5: enableChinesePostMatrix2of5Only,
    SymbologyType.intelligentMailBarcode: enableIntelligentMailBarcodeOnly,
    SymbologyType.japanesePostal: enableJapanesePostalOnly,
    SymbologyType.koreanPostalAuthority: enableKoreanPostalAuthorityOnly,
    SymbologyType.mailmark4StatePostal: enableMailmark4StatePostalOnly,
    SymbologyType.netherlandsKIXCode: enableNetherlandsKIXCodeOnly,
    SymbologyType.planet: enablePlanetOnly,
    SymbologyType.postnet: enablePostnetOnly,
    SymbologyType.ukPostal: enableUKPostalOnly,
  };

  /// Enables a specific symbology on the device.
  ///
  /// [deviceId] is the ID of the device where the symbology should be enabled.
  /// [symbologyType] is the symbology to enable exclusively.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableOnlySymbology(
      String deviceId, SymbologyType symbologyType) async {
    final String? command = _enableOnlySymbologyCommands[symbologyType];

    if (command != null) {
      return sendCommand(deviceId, command);
    } else {
      final msg = 'Command not found for $symbologyType';
      _appLogger.error(msg);
      return CommandResponse.failed(msg);
    }
  }

  /// Enables only the specified symbology on the device, excluding all others.
  ///
  /// [deviceId] is the ID of the device where the symbology should be enabled exclusively.
  /// [symbologyType] is the symbology to enable.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableSymbology(
      String deviceId, SymbologyType symbologyType) async {
    final String? command = _enableSymbologyCommands[symbologyType];

    if (command != null) {
      return sendCommand(deviceId, command);
    } else {
      final msg = 'Command not found for $symbologyType';
      _appLogger.error(msg);
      return CommandResponse.failed(msg);
    }
  }

  /// Disables a specific symbology on the device.
  ///
  /// [deviceId] is the ID of the device where the symbology should be disabled.
  /// [symbologyType] is the symbology to disable.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableSymbology(
      String deviceId, SymbologyType symbologyType) async {
    final String? command = _disableSymbologyCommands[symbologyType];

    if (command != null) {
      return sendCommand(deviceId, command);
    } else {
      final msg = 'Command not found for $symbologyType';
      _appLogger.error(msg);
      return CommandResponse.failed(msg);
    }
  }
}
