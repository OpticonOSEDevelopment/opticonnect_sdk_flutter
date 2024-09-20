import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/base_scanner_settings.dart';

class EnableCodesSettings extends BaseScannerSettings {
  EnableCodesSettings(super.sdk);
  // Enable single 1D code only
  /// Enables all supported 1D barcode symbologies.
  Future<CommandResponse> set1DAllCodesOnly(String deviceId) async {
    return sendCommand(deviceId, enable1DAllCodesOnly);
  }

  /// Enables only Code 11 symbology.
  Future<CommandResponse> setCode11Only(String deviceId) async {
    return sendCommand(deviceId, enableCode11Only);
  }

  /// Enables only Code 39 symbology.
  Future<CommandResponse> setCode39Only(String deviceId) async {
    return sendCommand(deviceId, enableCode39Only);
  }

  /// Enables only Code 93 symbology.
  Future<CommandResponse> setCode93Only(String deviceId) async {
    return sendCommand(deviceId, enableCode93Only);
  }

  /// Enables only Code 128 symbology.
  Future<CommandResponse> setCode128Only(String deviceId) async {
    return sendCommand(deviceId, enableCode128Only);
  }

  /// Enables only Codabar symbology.
  Future<CommandResponse> setCodabarOnly(String deviceId) async {
    return sendCommand(deviceId, enableCodabarOnly);
  }

  /// Enables only EAN symbology (both EAN-8 and EAN-13).
  Future<CommandResponse> setEANOnly(String deviceId) async {
    return sendCommand(deviceId, enableEANOnly);
  }

  /// Enables only EAN symbology with a 2-character add-on.
  Future<CommandResponse> setEANPlus2Only(String deviceId) async {
    return sendCommand(deviceId, enableEANPlus2Only);
  }

  /// Enables only EAN symbology with a 5-character add-on.
  Future<CommandResponse> setEANPlus5Only(String deviceId) async {
    return sendCommand(deviceId, enableEANPlus5Only);
  }

  /// Enables only EAN-8 symbology.
  Future<CommandResponse> setEAN8Only(String deviceId) async {
    return sendCommand(deviceId, enableEAN8Only);
  }

  /// Enables only EAN-8 symbology with a 2-character add-on.
  Future<CommandResponse> setEAN8Plus2Only(String deviceId) async {
    return sendCommand(deviceId, enableEAN8Plus2Only);
  }

  /// Enables only EAN-8 symbology with a 5-character add-on.
  Future<CommandResponse> setEAN8Plus5Only(String deviceId) async {
    return sendCommand(deviceId, enableEAN8Plus5Only);
  }

  /// Enables only EAN-13 symbology.
  Future<CommandResponse> setEAN13Only(String deviceId) async {
    return sendCommand(deviceId, enableEAN13Only);
  }

  /// Enables only EAN-13 symbology with a 2-character add-on.
  Future<CommandResponse> setEAN13Plus2Only(String deviceId) async {
    return sendCommand(deviceId, enableEAN13Plus2Only);
  }

  /// Enables only EAN-13 symbology with a 5-character add-on.
  Future<CommandResponse> setEAN13Plus5Only(String deviceId) async {
    return sendCommand(deviceId, enableEAN13Plus5Only);
  }

  /// Enables only IATA symbology.
  Future<CommandResponse> setIATAOnly(String deviceId) async {
    return sendCommand(deviceId, enableIATAOnly);
  }

  /// Enables only Industrial 2 of 5 symbology.
  Future<CommandResponse> setIndustrial2of5Only(String deviceId) async {
    return sendCommand(deviceId, enableIndustrial2of5Only);
  }

  /// Enables only Interleaved 2 of 5 symbology.
  Future<CommandResponse> setInterleaved2of5Only(String deviceId) async {
    return sendCommand(deviceId, enableInterleaved2of5Only);
  }

  /// Enables only Matrix 2 of 5 symbology.
  Future<CommandResponse> setMatrix2of5Only(String deviceId) async {
    return sendCommand(deviceId, enableMatrix2of5Only);
  }

  /// Enables only MSI Plessey symbology.
  Future<CommandResponse> setMSIPlesseyOnly(String deviceId) async {
    return sendCommand(deviceId, enableMSIPlesseyOnly);
  }

  /// Enables only Nixdorf symbology.
  Future<CommandResponse> setNixdorfOnly(String deviceId) async {
    return sendCommand(deviceId, enableNixdorfOnly);
  }

  /// Enables only S Code symbology.
  Future<CommandResponse> setSCodeOnly(String deviceId) async {
    return sendCommand(deviceId, enableSCodeOnly);
  }

  /// Enables only Telepen symbology.
  Future<CommandResponse> setTelepenOnly(String deviceId) async {
    return sendCommand(deviceId, enableTelepenOnly);
  }

  /// Enables only TriOptic symbology.
  Future<CommandResponse> setTriOpticOnly(String deviceId) async {
    return sendCommand(deviceId, enableTriOpticOnly);
  }

  /// Enables only UK Plessey symbology.
  Future<CommandResponse> setUKPlesseyOnly(String deviceId) async {
    return sendCommand(deviceId, enableUKPlesseyOnly);
  }

  /// Enables only UPC symbology.
  Future<CommandResponse> setUPCOnly(String deviceId) async {
    return sendCommand(deviceId, enableUPCOnly);
  }

  /// Enables only UPCA symbology.
  Future<CommandResponse> setUPCAOnly(String deviceId) async {
    return sendCommand(deviceId, enableUPCAOnly);
  }

  /// Enables only UPCA symbology with a 2-character add-on.
  Future<CommandResponse> setUPCAPlus2Only(String deviceId) async {
    return sendCommand(deviceId, enableUPCAPlus2Only);
  }

  /// Enables only UPCA symbology with a 5-character add-on.
  Future<CommandResponse> setUPCAPlus5Only(String deviceId) async {
    return sendCommand(deviceId, enableUPCAPlus5Only);
  }

  /// Enables only UPCAE symbology.
  Future<CommandResponse> setUPCAEOnly(String deviceId) async {
    return sendCommand(deviceId, enableUPCAEOnly);
  }

  /// Enables only UPCAE symbology with a 2-character add-on.
  Future<CommandResponse> setUPCAEPlus2Only(String deviceId) async {
    return sendCommand(deviceId, enableUPCAEPlus2Only);
  }

  /// Enables only UPCAE symbology with a 5-character add-on.
  Future<CommandResponse> setUPCAEPlus5Only(String deviceId) async {
    return sendCommand(deviceId, enableUPCAEPlus5Only);
  }

  /// Enables only UPCE symbology.
  Future<CommandResponse> setUPCEOnly(String deviceId) async {
    return sendCommand(deviceId, enableUPCEOnly);
  }

  /// Enables only UPCE symbology with a 2-character add-on.
  Future<CommandResponse> setUPCEPlus2Only(String deviceId) async {
    return sendCommand(deviceId, enableUPCEPlus2Only);
  }

  /// Enables only UPCE symbology with a 5-character add-on.
  Future<CommandResponse> setUPCEPlus5Only(String deviceId) async {
    return sendCommand(deviceId, enableUPCEPlus5Only);
  }

  /// Enables only UPCE1 symbology.
  Future<CommandResponse> setUPCE1Only(String deviceId) async {
    return sendCommand(deviceId, enableUPCE1Only);
  }

  /// Enables only UPCE1 symbology with a 2-character add-on.
  Future<CommandResponse> setUPCE1Plus2Only(String deviceId) async {
    return sendCommand(deviceId, enableUPCE1Plus2Only);
  }

  /// Enables only UPCE1 symbology with a 5-character add-on.
  Future<CommandResponse> setUPCE1Plus5Only(String deviceId) async {
    return sendCommand(deviceId, enableUPCE1Plus5Only);
  }

  /// Enables only GS1 DataBar symbology.
  Future<CommandResponse> setGS1DataBarOnly(String deviceId) async {
    return sendCommand(deviceId, enableGS1DataBarOnly);
  }

  /// Enables only GS1 DataBar Limited symbology.
  Future<CommandResponse> setGS1DataBarLimitedOnly(String deviceId) async {
    return sendCommand(deviceId, enableGS1DataBarLimitedOnly);
  }

  /// Enables only GS1 DataBar Expanded symbology.
  Future<CommandResponse> setGS1DataBarExpandedOnly(String deviceId) async {
    return sendCommand(deviceId, enableGS1DataBarExpandedOnly);
  }

  /// Enables all supported 2D barcode symbologies.
  Future<CommandResponse> set2DAllCodesOnly(String deviceId) async {
    return sendCommand(deviceId, enable2DAllCodesOnly);
  }

  /// Enables only Aztec Code symbology.
  Future<CommandResponse> setAztecCodeOnly(String deviceId) async {
    return sendCommand(deviceId, enableAztecCodeOnly);
  }

  /// Enables only Aztec Runes symbology.
  Future<CommandResponse> setAztecRunesOnly(String deviceId) async {
    return sendCommand(deviceId, enableAztecRunesOnly);
  }

  /// Enables only Chinese Sensible Code symbology.
  Future<CommandResponse> setChineseSensibleCodeOnly(String deviceId) async {
    return sendCommand(deviceId, enableChineseSensibleCodeOnly);
  }

  /// Enables only Codablock F symbology.
  Future<CommandResponse> setCodablockFOnly(String deviceId) async {
    return sendCommand(deviceId, enableCodablockFOnly);
  }

  /// Enables only Data Matrix symbology.
  Future<CommandResponse> setDataMatrixOnly(String deviceId) async {
    return sendCommand(deviceId, enableDataMatrixOnly);
  }

  /// Enables only Data Matrix (Old ECC 000-140) symbology.
  Future<CommandResponse> setDataMatrixOldECC000_140Only(
      String deviceId) async {
    return sendCommand(deviceId, enableDataMatrixOldECC000_140Only);
  }

  /// Enables only Dot Code symbology.
  Future<CommandResponse> setDotCodeOnly(String deviceId) async {
    return sendCommand(deviceId, enableDotCodeOnly);
  }

  /// Enables only Maxicode symbology.
  Future<CommandResponse> setMaxicodeOnly(String deviceId) async {
    return sendCommand(deviceId, enableMaxicodeOnly);
  }

  /// Enables only Micro PDF417 symbology.
  Future<CommandResponse> setMicroPDF417Only(String deviceId) async {
    return sendCommand(deviceId, enableMicroPDF417Only);
  }

  /// Enables only Micro QR Code symbology.
  Future<CommandResponse> setMicroQRCodeOnly(String deviceId) async {
    return sendCommand(deviceId, enableMicroQRCodeOnly);
  }

  /// Enables only PDF417 symbology.
  Future<CommandResponse> setPDF417Only(String deviceId) async {
    return sendCommand(deviceId, enablePDF417Only);
  }

  /// Enables only QR Code symbology.
  Future<CommandResponse> setQRCodeOnly(String deviceId) async {
    return sendCommand(deviceId, enableQRCodeOnly);
  }

  /// Enables only Australian Postal symbology.
  Future<CommandResponse> setAustralianPostalOnly(String deviceId) async {
    return sendCommand(deviceId, enableAustralianPostalOnly);
  }

  /// Enables only Chinese Post Matrix 2 of 5 symbology.
  Future<CommandResponse> setChinesePostMatrix2of5Only(String deviceId) async {
    return sendCommand(deviceId, enableChinesePostMatrix2of5Only);
  }

  /// Enables only Intelligent Mail Barcode symbology.
  Future<CommandResponse> setIntelligentMailBarcodeOnly(String deviceId) async {
    return sendCommand(deviceId, enableIntelligentMailBarcodeOnly);
  }

  /// Enables only Japanese Postal symbology.
  Future<CommandResponse> setJapanesePostalOnly(String deviceId) async {
    return sendCommand(deviceId, enableJapanesePostalOnly);
  }

  /// Enables only Korean Postal Authority symbology.
  Future<CommandResponse> setKoreanPostalAuthorityOnly(String deviceId) async {
    return sendCommand(deviceId, enableKoreanPostalAuthorityOnly);
  }

  /// Enables only Mailmark 4-State Postal symbology.
  Future<CommandResponse> setMailmark4StatePostalOnly(String deviceId) async {
    return sendCommand(deviceId, enableMailmark4StatePostalOnly);
  }

  /// Enables only Netherlands KIX Code symbology.
  Future<CommandResponse> setNetherlandsKIXCodeOnly(String deviceId) async {
    return sendCommand(deviceId, enableNetherlandsKIXCodeOnly);
  }

  /// Enables only Planet symbology.
  Future<CommandResponse> setPlanetOnly(String deviceId) async {
    return sendCommand(deviceId, enablePlanetOnly);
  }

  /// Enables only Postnet symbology.
  Future<CommandResponse> setPostnetOnly(String deviceId) async {
    return sendCommand(deviceId, enablePostnetOnly);
  }

  /// Enables only UK Postal symbology.
  Future<CommandResponse> setUKPostalOnly(String deviceId) async {
    return sendCommand(deviceId, enableUKPostalOnly);
  }

  // Aztec Code
  Future<CommandResponse> enableAztecCode(String deviceId) async {
    return sendCommand(deviceId, aztecEnabled);
  }

  /// Disables Aztec Code symbology.
  Future<CommandResponse> disableAztecCode(String deviceId) async {
    return sendCommand(deviceId, aztecDisabled);
  }

  /// Enables Aztec Runes symbology.
  Future<CommandResponse> enableAztecRunes(String deviceId) async {
    return sendCommand(deviceId, aztecRunesEnabled);
  }

  /// Disables Aztec Runes symbology.
  Future<CommandResponse> disableAztecRunes(String deviceId) async {
    return sendCommand(deviceId, aztecRunesDisabled);
  }

  /// Enables Chinese Sensible Code symbology.
  Future<CommandResponse> enableChineseSensibleCode(String deviceId) async {
    return sendCommand(deviceId, chineseSensibleCodeEnabled);
  }

  /// Disables Chinese Sensible Code symbology.
  Future<CommandResponse> disableChineseSensibleCode(String deviceId) async {
    return sendCommand(deviceId, chineseSensibleCodeDisabled);
  }

  /// Enables Data Matrix symbology.
  Future<CommandResponse> enableDataMatrix(String deviceId) async {
    return sendCommand(deviceId, dataMatrixEnabled);
  }

  /// Disables Data Matrix symbology.
  Future<CommandResponse> disableDataMatrix(String deviceId) async {
    return sendCommand(deviceId, dataMatrixDisabled);
  }

  /// Enables Maxicode symbology.
  Future<CommandResponse> enableMaxicode(String deviceId) async {
    return sendCommand(deviceId, maxicodeEnabled);
  }

  /// Disables Maxicode symbology.
  Future<CommandResponse> disableMaxicode(String deviceId) async {
    return sendCommand(deviceId, maxicodeDisabled);
  }

  /// Enables Micro PDF417 symbology.
  Future<CommandResponse> enableMicroPdf417(String deviceId) async {
    return sendCommand(deviceId, microPdf417Enabled);
  }

  /// Disables Micro PDF417 symbology.
  Future<CommandResponse> disableMicroPdf417(String deviceId) async {
    return sendCommand(deviceId, microPdf417Disabled);
  }

  /// Enables Micro QR Code symbology.
  Future<CommandResponse> enableMicroQrCode(String deviceId) async {
    return sendCommand(deviceId, microQrCodeEnabled);
  }

  /// Disables Micro QR Code symbology.
  Future<CommandResponse> disableMicroQrCode(String deviceId) async {
    return sendCommand(deviceId, microQrCodeDisabled);
  }

  /// Enables PDF417 symbology.
  Future<CommandResponse> enablePdf417(String deviceId) async {
    return sendCommand(deviceId, pdf417CodeEnabled);
  }

  /// Disables PDF417 symbology.
  Future<CommandResponse> disablePdf417(String deviceId) async {
    return sendCommand(deviceId, pdf417CodeDisabled);
  }

  /// Enables QR Code symbology.
  Future<CommandResponse> enableQrCode(String deviceId) async {
    return sendCommand(deviceId, qrCodeEnabled);
  }

  /// Disables QR Code symbology.
  Future<CommandResponse> disableQrCode(String deviceId) async {
    return sendCommand(deviceId, qrCodeDisabled);
  }

  /// Enables Dot Code symbology.
  Future<CommandResponse> enableDotCode(String deviceId) async {
    return sendCommand(deviceId, dotCodeEnabled);
  }

  /// Disables Dot Code symbology.
  Future<CommandResponse> disableDotCode(String deviceId) async {
    return sendCommand(deviceId, dotCodeDisabled);
  }

  /// Enables Codablock F symbology.
  Future<CommandResponse> enableCodablockF(String deviceId) async {
    return sendCommand(deviceId, codablockFEnabled);
  }

  /// Disables Codablock F symbology.
  Future<CommandResponse> disableCodablockF(String deviceId) async {
    return sendCommand(deviceId, codablockFDisabled);
  }

  /// Enables Codabar symbology.
  Future<CommandResponse> enableCodabar(String deviceId) async {
    return sendCommand(deviceId, codaBarEnabled);
  }

  /// Disables Codabar symbology.
  Future<CommandResponse> disableCodabar(String deviceId) async {
    return sendCommand(deviceId, codaBarDisabled);
  }

  /// Enables Code 11 symbology.
  Future<CommandResponse> enableCode11(String deviceId) async {
    return sendCommand(deviceId, code11Enabled);
  }

  /// Disables Code 11 symbology.
  Future<CommandResponse> disableCode11(String deviceId) async {
    return sendCommand(deviceId, code11Disabled);
  }

  /// Enables Code 39 symbology.
  Future<CommandResponse> enableCode39(String deviceId) async {
    return sendCommand(deviceId, code39Enabled);
  }

  /// Disables Code 39 symbology.
  Future<CommandResponse> disableCode39(String deviceId) async {
    return sendCommand(deviceId, code39Disabled);
  }

  /// Enables Code 93 symbology.
  Future<CommandResponse> enableCode93(String deviceId) async {
    return sendCommand(deviceId, code93Enabled);
  }

  /// Disables Code 93 symbology.
  Future<CommandResponse> disableCode93(String deviceId) async {
    return sendCommand(deviceId, code93Disabled);
  }

  /// Enables Code 128 symbology.
  Future<CommandResponse> enableCode128(String deviceId) async {
    return sendCommand(deviceId, code128Enabled);
  }

  /// Disables Code 128 symbology.
  Future<CommandResponse> disableCode128(String deviceId) async {
    return sendCommand(deviceId, code128Disabled);
  }

  /// Enables EAN-8 symbology.
  Future<CommandResponse> enableEan8(String deviceId) async {
    return sendCommand(deviceId, ean8Enabled);
  }

  /// Disables EAN-8 symbology.
  Future<CommandResponse> disableEan8(String deviceId) async {
    return sendCommand(deviceId, ean8Disabled);
  }

  /// Enables EAN-13 symbology.
  Future<CommandResponse> enableEan13(String deviceId) async {
    return sendCommand(deviceId, ean13Enabled);
  }

  /// Disables EAN-13 symbology.
  Future<CommandResponse> disableEan13(String deviceId) async {
    return sendCommand(deviceId, ean13Disabled);
  }

  /// Enables IATA symbology.
  Future<CommandResponse> enableIata(String deviceId) async {
    return sendCommand(deviceId, iataEnabled);
  }

  /// Disables IATA symbology.
  Future<CommandResponse> disableIata(String deviceId) async {
    return sendCommand(deviceId, iataDisabled);
  }

  /// Enables Industrial 2 of 5 symbology.
  Future<CommandResponse> enableIndustrial2of5(String deviceId) async {
    return sendCommand(deviceId, industrial2of5Enabled);
  }

  /// Disables Industrial 2 of 5 symbology.
  Future<CommandResponse> disableIndustrial2of5(String deviceId) async {
    return sendCommand(deviceId, industrial2of5Disabled);
  }

  /// Enables Interleaved 2 of 5 symbology.
  Future<CommandResponse> enableInterleaved2of5(String deviceId) async {
    return sendCommand(deviceId, interleaved2of5Enabled);
  }

  /// Disables Interleaved 2 of 5 symbology.
  Future<CommandResponse> disableInterleaved2of5(String deviceId) async {
    return sendCommand(deviceId, interleaved2of5Disabled);
  }

  /// Enables Matrix 2 of 5 symbology.
  Future<CommandResponse> enableMatrix2of5(String deviceId) async {
    return sendCommand(deviceId, matrix2of5Enabled);
  }

  /// Disables Matrix 2 of 5 symbology.
  Future<CommandResponse> disableMatrix2of5(String deviceId) async {
    return sendCommand(deviceId, matrix2of5Disabled);
  }

  /// Enables MSI Plessey symbology.
  Future<CommandResponse> enableMsi(String deviceId) async {
    return sendCommand(deviceId, msiPlesseyEnabled);
  }

  /// Disables MSI Plessey symbology.
  Future<CommandResponse> disableMsi(String deviceId) async {
    return sendCommand(deviceId, msiPlesseyDisabled);
  }

  /// Enables S Code symbology.
  Future<CommandResponse> enableSCode(String deviceId) async {
    return sendCommand(deviceId, sCodeEnabled);
  }

  /// Disables S Code symbology.
  Future<CommandResponse> disableSCode(String deviceId) async {
    return sendCommand(deviceId, sCodeDisabled);
  }

  /// Enables Telepen symbology.
  Future<CommandResponse> enableTelepen(String deviceId) async {
    return sendCommand(deviceId, telepenEnabled);
  }

  /// Disables Telepen symbology.
  Future<CommandResponse> disableTelepen(String deviceId) async {
    return sendCommand(deviceId, telepenDisabled);
  }

  /// Enables Trioptic Code symbology.
  Future<CommandResponse> enableTriopticCode(String deviceId) async {
    return sendCommand(deviceId, triOpticEnabled);
  }

  /// Disables Trioptic Code symbology.
  Future<CommandResponse> disableTriopticCode(String deviceId) async {
    return sendCommand(deviceId, triOpticDisabled);
  }

  /// Enables UK Plessey symbology.
  Future<CommandResponse> enableUKPlessey(String deviceId) async {
    return sendCommand(deviceId, ukPlesseyEnabled);
  }

  /// Disables UK Plessey symbology.
  Future<CommandResponse> disableUKPlessey(String deviceId) async {
    return sendCommand(deviceId, ukPlesseyDisabled);
  }

  /// Enables UPC-A symbology.
  Future<CommandResponse> enableUPCA(String deviceId) async {
    return sendCommand(deviceId, upcAEnabled);
  }

  /// Disables UPC-A symbology.
  Future<CommandResponse> disableUPCA(String deviceId) async {
    return sendCommand(deviceId, upcADisabled);
  }

  /// Enables UPC-A symbology with a 2-character add-on.
  Future<CommandResponse> enableUPCAPlus2(String deviceId) async {
    return sendCommand(deviceId, upcAAddOn2Enabled);
  }

  /// Disables UPC-A symbology with a 2-character add-on.
  Future<CommandResponse> disableUPCAPlus2(String deviceId) async {
    return sendCommand(deviceId, upcAAddOn2Disabled);
  }

  /// Enables UPC-A symbology with a 5-character add-on.
  Future<CommandResponse> enableUPCAPlus5(String deviceId) async {
    return sendCommand(deviceId, upcAAddOn5Enabled);
  }

  /// Disables UPC-A symbology with a 5-character add-on.
  Future<CommandResponse> disableUPCAPlus5(String deviceId) async {
    return sendCommand(deviceId, upcAAddOn5Disabled);
  }

  /// Enables UPC-A/E symbology.
  Future<CommandResponse> enableUPCAE(String deviceId) async {
    return sendCommand(deviceId, upcAEEnabled);
  }

  /// Disables UPC-A/E symbology.
  Future<CommandResponse> disableUPCAE(String deviceId) async {
    return sendCommand(deviceId, upcAEDisabled);
  }

  /// Enables UPC-A/E symbology with a 2-character add-on.
  Future<CommandResponse> enableUPCAEPlus2(String deviceId) async {
    return sendCommand(deviceId, upcAEAddOn2Enabled);
  }

  /// Disables UPC-A/E symbology with a 2-character add-on.
  Future<CommandResponse> disableUPCAEPlus2(String deviceId) async {
    return sendCommand(deviceId, upcAEAddOn2Disabled);
  }

  /// Enables UPC-A/E symbology with a 5-character add-on.
  Future<CommandResponse> enableUPCAEPlus5(String deviceId) async {
    return sendCommand(deviceId, upcAEAddOn5Enabled);
  }

  /// Disables UPC-A/E symbology with a 5-character add-on.
  Future<CommandResponse> disableUPCAEPlus5(String deviceId) async {
    return sendCommand(deviceId, upcAEAddOn5Disabled);
  }

  /// Enables UPC-E symbology.
  Future<CommandResponse> enableUPCE(String deviceId) async {
    return sendCommand(deviceId, upcEEnabled);
  }

  /// Disables UPC-E symbology.
  Future<CommandResponse> disableUPCE(String deviceId) async {
    return sendCommand(deviceId, upcEDisabled);
  }

  /// Enables UPC-E symbology with a 2-character add-on.
  Future<CommandResponse> enableUPCEPlus2(String deviceId) async {
    return sendCommand(deviceId, upcEAddOn2Enabled);
  }

  /// Disables UPC-E symbology with a 2-character add-on.
  Future<CommandResponse> disableUPCEPlus2(String deviceId) async {
    return sendCommand(deviceId, upcEAddOn2Disabled);
  }

  /// Enables UPC-E symbology with a 5-character add-on.
  Future<CommandResponse> enableUPCEPlus5(String deviceId) async {
    return sendCommand(deviceId, upcEAddOn5Enabled);
  }

  /// Disables UPC-E symbology with a 5-character add-on.
  Future<CommandResponse> disableUPCEPlus5(String deviceId) async {
    return sendCommand(deviceId, upcEAddOn5Disabled);
  }

  /// Enables UPC-E1 symbology.
  Future<CommandResponse> enableUPCE1(String deviceId) async {
    return sendCommand(deviceId, upcE1Enabled);
  }

  /// Disables UPC-E1 symbology.
  Future<CommandResponse> disableUPCE1(String deviceId) async {
    return sendCommand(deviceId, upcE1Disabled);
  }

  /// Enables UPC-E1 symbology with a 2-character add-on.
  Future<CommandResponse> enableUPCE1Plus2(String deviceId) async {
    return sendCommand(deviceId, upcE1AddOn2Enabled);
  }

  /// Disables UPC-E1 symbology with a 2-character add-on.
  Future<CommandResponse> disableUPCE1Plus2(String deviceId) async {
    return sendCommand(deviceId, upcE1AddOn2Disabled);
  }

  /// Enables UPC-E1 symbology with a 5-character add-on.
  Future<CommandResponse> enableUPCE1Plus5(String deviceId) async {
    return sendCommand(deviceId, upcE1AddOn5Enabled);
  }

  /// Disables UPC-E1 symbology with a 5-character add-on.
  Future<CommandResponse> disableUPCE1Plus5(String deviceId) async {
    return sendCommand(deviceId, upcE1AddOn5Disabled);
  }

  /// Enables GS1 DataBar symbology.
  Future<CommandResponse> enableGS1DataBar(String deviceId) async {
    return sendCommand(deviceId, gs1DataBarEnabled);
  }

  /// Disables GS1 DataBar symbology.
  Future<CommandResponse> disableGS1DataBar(String deviceId) async {
    return sendCommand(deviceId, gs1DataBarDisabled);
  }

  /// Enables GS1 DataBar Expanded symbology.
  Future<CommandResponse> enableGS1DataBarExpanded(String deviceId) async {
    return sendCommand(deviceId, gs1DataBarExpandedEnabled);
  }

  /// Disables GS1 DataBar Expanded symbology.
  Future<CommandResponse> disableGS1DataBarExpanded(String deviceId) async {
    return sendCommand(deviceId, gs1DataBarExpandedDisabled);
  }

  /// Enables GS1 DataBar Limited symbology.
  Future<CommandResponse> enableGS1DataBarLimited(String deviceId) async {
    return sendCommand(deviceId, gs1DataBarLimitedEnabled);
  }

  /// Disables GS1 DataBar Limited symbology.
  Future<CommandResponse> disableGS1DataBarLimited(String deviceId) async {
    return sendCommand(deviceId, gs1DataBarLimitedDisabled);
  }

  /// Enables Australian Postal symbology.
  Future<CommandResponse> enableAustralianPostal(String deviceId) async {
    return sendCommand(deviceId, australianPostalEnabled);
  }

  /// Disables Australian Postal symbology.
  Future<CommandResponse> disableAustralianPostal(String deviceId) async {
    return sendCommand(deviceId, australianPostalDisabled);
  }

  /// Enables Chinese Post Matrix 2 of 5 symbology.
  Future<CommandResponse> enableChinesePostMatrix2of5(String deviceId) async {
    return sendCommand(deviceId, chinesePostMatrix2of5Enabled);
  }

  /// Disables Chinese Post Matrix 2 of 5 symbology.
  Future<CommandResponse> disableChinesePostMatrix2of5(String deviceId) async {
    return sendCommand(deviceId, chinesePostMatrix2of5Disabled);
  }

  /// Enables Intelligent Mail Barcode symbology.
  Future<CommandResponse> enableIntelligentMailBarcode(String deviceId) async {
    return sendCommand(deviceId, intelligentMailBarcodeEnabled);
  }

  /// Disables Intelligent Mail Barcode symbology.
  Future<CommandResponse> disableIntelligentMailBarcode(String deviceId) async {
    return sendCommand(deviceId, intelligentMailBarcodeDisabled);
  }

  /// Enables Japanese Postal symbology.
  Future<CommandResponse> enableJapanesePostal(String deviceId) async {
    return sendCommand(deviceId, japanesePostalEnabled);
  }

  /// Disables Japanese Postal symbology.
  Future<CommandResponse> disableJapanesePostal(String deviceId) async {
    return sendCommand(deviceId, japanesePostalDisabled);
  }

  /// Enables Korean Postal Authority symbology.
  Future<CommandResponse> enableKoreanPostalAuthority(String deviceId) async {
    return sendCommand(deviceId, koreanPostalAuthorityEnabled);
  }

  /// Disables Korean Postal Authority symbology.
  Future<CommandResponse> disableKoreanPostalAuthority(String deviceId) async {
    return sendCommand(deviceId, koreanPostalAuthorityDisabled);
  }

  /// Enables Mailmark 4-State Postal symbology.
  Future<CommandResponse> enableMailmark4StatePostal(String deviceId) async {
    return sendCommand(deviceId, mailmark4StatePostalEnabled);
  }

  /// Disables Mailmark 4-State Postal symbology.
  Future<CommandResponse> disableMailmark4StatePostal(String deviceId) async {
    return sendCommand(deviceId, mailmark4StatePostalDisabled);
  }

  /// Enables Netherlands Kix Code symbology.
  Future<CommandResponse> enableNetherlandsKixCode(String deviceId) async {
    return sendCommand(deviceId, netherlandsKixCodeEnabled);
  }

  /// Disables Netherlands Kix Code symbology.
  Future<CommandResponse> disableNetherlandsKixCode(String deviceId) async {
    return sendCommand(deviceId, netherlandsKixCodeDisabled);
  }

  /// Enables Planet symbology.
  Future<CommandResponse> enablePlanet(String deviceId) async {
    return sendCommand(deviceId, planetEnabled);
  }

  /// Disables Planet symbology.
  Future<CommandResponse> disablePlanet(String deviceId) async {
    return sendCommand(deviceId, planetDisabled);
  }

  /// Enables Postnet symbology.
  Future<CommandResponse> enablePostnet(String deviceId) async {
    return sendCommand(deviceId, postnetEnabled);
  }

  /// Disables Postnet symbology.
  Future<CommandResponse> disablePostnet(String deviceId) async {
    return sendCommand(deviceId, postnetDisabled);
  }

  /// Enables UK Postal symbology.
  Future<CommandResponse> enableUKPostal(String deviceId) async {
    return sendCommand(deviceId, ukPostalEnabled);
  }

  /// Disables UK Postal symbology.
  Future<CommandResponse> disableUKPostal(String deviceId) async {
    return sendCommand(deviceId, ukPostalDisabled);
  }
}
