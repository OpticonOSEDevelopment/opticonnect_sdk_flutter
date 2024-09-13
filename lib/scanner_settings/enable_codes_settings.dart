import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/scanner_settings/scanner_settings.dart';

class EnableCodesSettings extends ScannerSettings {
  EnableCodesSettings(super.sdk);
  // Enable single 1D code only
  Future<CommandResponse> set1DAllCodesOnly(String deviceId) async {
    return sendCommand(deviceId, enable1DAllCodesOnly);
  }

  Future<CommandResponse> setCode11Only(String deviceId) async {
    return sendCommand(deviceId, enableCode11Only);
  }

  Future<CommandResponse> setCode39Only(String deviceId) async {
    return sendCommand(deviceId, enableCode39Only);
  }

  Future<CommandResponse> setCode93Only(String deviceId) async {
    return sendCommand(deviceId, enableCode93Only);
  }

  Future<CommandResponse> setCode128Only(String deviceId) async {
    return sendCommand(deviceId, enableCode128Only);
  }

  Future<CommandResponse> setCodabarOnly(String deviceId) async {
    return sendCommand(deviceId, enableCodabarOnly);
  }

  Future<CommandResponse> setEANOnly(String deviceId) async {
    return sendCommand(deviceId, enableEANOnly);
  }

  Future<CommandResponse> setEANPlus2Only(String deviceId) async {
    return sendCommand(deviceId, enableEANPlus2Only);
  }

  Future<CommandResponse> setEANPlus5Only(String deviceId) async {
    return sendCommand(deviceId, enableEANPlus5Only);
  }

  Future<CommandResponse> setEAN8Only(String deviceId) async {
    return sendCommand(deviceId, enableEAN8Only);
  }

  Future<CommandResponse> setEAN8Plus2Only(String deviceId) async {
    return sendCommand(deviceId, enableEAN8Plus2Only);
  }

  Future<CommandResponse> setEAN8Plus5Only(String deviceId) async {
    return sendCommand(deviceId, enableEAN8Plus5Only);
  }

  Future<CommandResponse> setEAN13Only(String deviceId) async {
    return sendCommand(deviceId, enableEAN13Only);
  }

  Future<CommandResponse> setEAN13Plus2Only(String deviceId) async {
    return sendCommand(deviceId, enableEAN13Plus2Only);
  }

  Future<CommandResponse> setEAN13Plus5Only(String deviceId) async {
    return sendCommand(deviceId, enableEAN13Plus5Only);
  }

  Future<CommandResponse> setIATAOnly(String deviceId) async {
    return sendCommand(deviceId, enableIATAOnly);
  }

  Future<CommandResponse> setIndustrial2of5Only(String deviceId) async {
    return sendCommand(deviceId, enableIndustrial2of5Only);
  }

  Future<CommandResponse> setInterleaved2of5Only(String deviceId) async {
    return sendCommand(deviceId, enableInterleaved2of5Only);
  }

  Future<CommandResponse> setMatrix2of5Only(String deviceId) async {
    return sendCommand(deviceId, enableMatrix2of5Only);
  }

  Future<CommandResponse> setMSIPlesseyOnly(String deviceId) async {
    return sendCommand(deviceId, enableMSIPlesseyOnly);
  }

  Future<CommandResponse> setNixdorfOnly(String deviceId) async {
    return sendCommand(deviceId, enableNixdorfOnly);
  }

  Future<CommandResponse> setSCodeOnly(String deviceId) async {
    return sendCommand(deviceId, enableSCodeOnly);
  }

  Future<CommandResponse> setTelepenOnly(String deviceId) async {
    return sendCommand(deviceId, enableTelepenOnly);
  }

  Future<CommandResponse> setTriOpticOnly(String deviceId) async {
    return sendCommand(deviceId, enableTriOpticOnly);
  }

  Future<CommandResponse> setUKPlesseyOnly(String deviceId) async {
    return sendCommand(deviceId, enableUKPlesseyOnly);
  }

  Future<CommandResponse> setUPCOnly(String deviceId) async {
    return sendCommand(deviceId, enableUPCOnly);
  }

  Future<CommandResponse> setUPCAOnly(String deviceId) async {
    return sendCommand(deviceId, enableUPCAOnly);
  }

  Future<CommandResponse> setUPCAPlus2Only(String deviceId) async {
    return sendCommand(deviceId, enableUPCAPlus2Only);
  }

  Future<CommandResponse> setUPCAPlus5Only(String deviceId) async {
    return sendCommand(deviceId, enableUPCAPlus5Only);
  }

  Future<CommandResponse> setUPCAEOnly(String deviceId) async {
    return sendCommand(deviceId, enableUPCAEOnly);
  }

  Future<CommandResponse> setUPCAEPlus2Only(String deviceId) async {
    return sendCommand(deviceId, enableUPCAEPlus2Only);
  }

  Future<CommandResponse> setUPCAEPlus5Only(String deviceId) async {
    return sendCommand(deviceId, enableUPCAEPlus5Only);
  }

  Future<CommandResponse> setUPCEOnly(String deviceId) async {
    return sendCommand(deviceId, enableUPCEOnly);
  }

  Future<CommandResponse> setUPCEPlus2Only(String deviceId) async {
    return sendCommand(deviceId, enableUPCEPlus2Only);
  }

  Future<CommandResponse> setUPCEPlus5Only(String deviceId) async {
    return sendCommand(deviceId, enableUPCEPlus5Only);
  }

  Future<CommandResponse> setUPCE1Only(String deviceId) async {
    return sendCommand(deviceId, enableUPCE1Only);
  }

  Future<CommandResponse> setUPCE1Plus2Only(String deviceId) async {
    return sendCommand(deviceId, enableUPCE1Plus2Only);
  }

  Future<CommandResponse> setUPCE1Plus5Only(String deviceId) async {
    return sendCommand(deviceId, enableUPCE1Plus5Only);
  }

  Future<CommandResponse> setGS1DataBarOnly(String deviceId) async {
    return sendCommand(deviceId, enableGS1DataBarOnly);
  }

  Future<CommandResponse> setGS1DataBarLimitedOnly(String deviceId) async {
    return sendCommand(deviceId, enableGS1DataBarLimitedOnly);
  }

  Future<CommandResponse> setGS1DataBarExpandedOnly(String deviceId) async {
    return sendCommand(deviceId, enableGS1DataBarExpandedOnly);
  }

  // Enable single 2D code only
  Future<CommandResponse> set2DAllCodesOnly(String deviceId) async {
    return sendCommand(deviceId, enable2DAllCodesOnly);
  }

  Future<CommandResponse> setAztecCodeOnly(String deviceId) async {
    return sendCommand(deviceId, enableAztecCodeOnly);
  }

  Future<CommandResponse> setAztecRunesOnly(String deviceId) async {
    return sendCommand(deviceId, enableAztecRunesOnly);
  }

  Future<CommandResponse> setChineseSensibleCodeOnly(String deviceId) async {
    return sendCommand(deviceId, enableChineseSensibleCodeOnly);
  }

  Future<CommandResponse> setCodablockFOnly(String deviceId) async {
    return sendCommand(deviceId, enableCodablockFOnly);
  }

  Future<CommandResponse> setDataMatrixOnly(String deviceId) async {
    return sendCommand(deviceId, enableDataMatrixOnly);
  }

  Future<CommandResponse> setDataMatrixOldECC000_140Only(
      String deviceId) async {
    return sendCommand(deviceId, enableDataMatrixOldECC000_140Only);
  }

  Future<CommandResponse> setDotCodeOnly(String deviceId) async {
    return sendCommand(deviceId, enableDotCodeOnly);
  }

  Future<CommandResponse> setMaxicodeOnly(String deviceId) async {
    return sendCommand(deviceId, enableMaxicodeOnly);
  }

  Future<CommandResponse> setMicroPDF417Only(String deviceId) async {
    return sendCommand(deviceId, enableMicroPDF417Only);
  }

  Future<CommandResponse> setMicroQRCodeOnly(String deviceId) async {
    return sendCommand(deviceId, enableMicroQRCodeOnly);
  }

  Future<CommandResponse> setPDF417Only(String deviceId) async {
    return sendCommand(deviceId, enablePDF417Only);
  }

  Future<CommandResponse> setQRCodeOnly(String deviceId) async {
    return sendCommand(deviceId, enableQRCodeOnly);
  }

  Future<CommandResponse> setAustralianPostalOnly(String deviceId) async {
    return sendCommand(deviceId, enableAustralianPostalOnly);
  }

  Future<CommandResponse> setChinesePostMatrix2of5Only(String deviceId) async {
    return sendCommand(deviceId, enableChinesePostMatrix2of5Only);
  }

  Future<CommandResponse> setIntelligentMailBarcodeOnly(String deviceId) async {
    return sendCommand(deviceId, enableIntelligentMailBarcodeOnly);
  }

  Future<CommandResponse> setJapanesePostalOnly(String deviceId) async {
    return sendCommand(deviceId, enableJapanesePostalOnly);
  }

  Future<CommandResponse> setKoreanPostalAuthorityOnly(String deviceId) async {
    return sendCommand(deviceId, enableKoreanPostalAuthorityOnly);
  }

  Future<CommandResponse> setMailmark4StatePostalOnly(String deviceId) async {
    return sendCommand(deviceId, enableMailmark4StatePostalOnly);
  }

  Future<CommandResponse> setNetherlandsKIXCodeOnly(String deviceId) async {
    return sendCommand(deviceId, enableNetherlandsKIXCodeOnly);
  }

  Future<CommandResponse> setPlanetOnly(String deviceId) async {
    return sendCommand(deviceId, enablePlanetOnly);
  }

  Future<CommandResponse> setPostnetOnly(String deviceId) async {
    return sendCommand(deviceId, enablePostnetOnly);
  }

  // Aztec Code
  Future<CommandResponse> enableAztecCode(String deviceId) async {
    return sendCommand(deviceId, aztecEnabled);
  }

  Future<CommandResponse> disableAztecCode(String deviceId) async {
    return sendCommand(deviceId, aztecDisabled);
  }

  // Aztec Runes
  Future<CommandResponse> enableAztecRunes(String deviceId) async {
    return sendCommand(deviceId, aztecRunesEnabled);
  }

  Future<CommandResponse> disableAztecRunes(String deviceId) async {
    return sendCommand(deviceId, aztecRunesDisabled);
  }

  // Chinese Sensible Code
  Future<CommandResponse> enableChineseSensibleCode(String deviceId) async {
    return sendCommand(deviceId, chineseSensibleCodeEnabled);
  }

  Future<CommandResponse> disableChineseSensibleCode(String deviceId) async {
    return sendCommand(deviceId, chineseSensibleCodeDisabled);
  }

  // Data Matrix
  Future<CommandResponse> enableDataMatrix(String deviceId) async {
    return sendCommand(deviceId, dataMatrixEnabled);
  }

  Future<CommandResponse> disableDataMatrix(String deviceId) async {
    return sendCommand(deviceId, dataMatrixDisabled);
  }

  // Maxicode
  Future<CommandResponse> enableMaxicode(String deviceId) async {
    return sendCommand(deviceId, maxicodeEnabled);
  }

  Future<CommandResponse> disableMaxicode(String deviceId) async {
    return sendCommand(deviceId, maxicodeDisabled);
  }

  // Micro PDF417
  Future<CommandResponse> enableMicroPdf417(String deviceId) async {
    return sendCommand(deviceId, microPdf417Enabled);
  }

  Future<CommandResponse> disableMicroPdf417(String deviceId) async {
    return sendCommand(deviceId, microPdf417Disabled);
  }

  // Micro QR Code
  Future<CommandResponse> enableMicroQrCode(String deviceId) async {
    return sendCommand(deviceId, microQrCodeEnabled);
  }

  Future<CommandResponse> disableMicroQrCode(String deviceId) async {
    return sendCommand(deviceId, microQrCodeDisabled);
  }

  // PDF417
  Future<CommandResponse> enablePdf417(String deviceId) async {
    return sendCommand(deviceId, pdf417CodeEnabled);
  }

  Future<CommandResponse> disablePdf417(String deviceId) async {
    return sendCommand(deviceId, pdf417CodeDisabled);
  }

  // QR Code
  Future<CommandResponse> enableQrCode(String deviceId) async {
    return sendCommand(deviceId, qrCodeEnabled);
  }

  Future<CommandResponse> disableQrCode(String deviceId) async {
    return sendCommand(deviceId, qrCodeDisabled);
  }

  // Dot Code
  Future<CommandResponse> enableDotCode(String deviceId) async {
    return sendCommand(deviceId, dotCodeEnabled);
  }

  Future<CommandResponse> disableDotCode(String deviceId) async {
    return sendCommand(deviceId, dotCodeDisabled);
  }

  // Codablock F
  Future<CommandResponse> enableCodablockF(String deviceId) async {
    return sendCommand(deviceId, codablockFEnabled);
  }

  Future<CommandResponse> disableCodablockF(String deviceId) async {
    return sendCommand(deviceId, codablockFDisabled);
  }

  // Codabar
  Future<CommandResponse> enableCodabar(String deviceId) async {
    return sendCommand(deviceId, codaBarEnabled);
  }

  Future<CommandResponse> disableCodabar(String deviceId) async {
    return sendCommand(deviceId, codaBarDisabled);
  }

  // Code 11
  Future<CommandResponse> enableCode11(String deviceId) async {
    return sendCommand(deviceId, code11Enabled);
  }

  Future<CommandResponse> disableCode11(String deviceId) async {
    return sendCommand(deviceId, code11Disabled);
  }

  // Code 39
  Future<CommandResponse> enableCode39(String deviceId) async {
    return sendCommand(deviceId, code39Enabled);
  }

  Future<CommandResponse> disableCode39(String deviceId) async {
    return sendCommand(deviceId, code39Disabled);
  }

  // Code 93
  Future<CommandResponse> enableCode93(String deviceId) async {
    return sendCommand(deviceId, code93Enabled);
  }

  Future<CommandResponse> disableCode93(String deviceId) async {
    return sendCommand(deviceId, code93Disabled);
  }

  // Code 128
  Future<CommandResponse> enableCode128(String deviceId) async {
    return sendCommand(deviceId, code128Enabled);
  }

  Future<CommandResponse> disableCode128(String deviceId) async {
    return sendCommand(deviceId, code128Disabled);
  }

  // EAN 8
  Future<CommandResponse> enableEan8(String deviceId) async {
    return sendCommand(deviceId, ean8Enabled);
  }

  Future<CommandResponse> disableEan8(String deviceId) async {
    return sendCommand(deviceId, ean8Disabled);
  }

  // EAN 13
  Future<CommandResponse> enableEan13(String deviceId) async {
    return sendCommand(deviceId, ean13Enabled);
  }

  Future<CommandResponse> disableEan13(String deviceId) async {
    return sendCommand(deviceId, ean13Disabled);
  }

  // IATA
  Future<CommandResponse> enableIata(String deviceId) async {
    return sendCommand(deviceId, iataEnabled);
  }

  Future<CommandResponse> disableIata(String deviceId) async {
    return sendCommand(deviceId, iataDisabled);
  }

  // Industrial 2 of 5
  Future<CommandResponse> enableIndustrial2of5(String deviceId) async {
    return sendCommand(deviceId, industrial2of5Enabled);
  }

  Future<CommandResponse> disableIndustrial2of5(String deviceId) async {
    return sendCommand(deviceId, industrial2of5Disabled);
  }

  // Interleaved 2 of 5
  Future<CommandResponse> enableInterleaved2of5(String deviceId) async {
    return sendCommand(deviceId, interleaved2of5Enabled);
  }

  Future<CommandResponse> disableInterleaved2of5(String deviceId) async {
    return sendCommand(deviceId, interleaved2of5Disabled);
  }

  // Matrix 2 of 5
  Future<CommandResponse> enableMatrix2of5(String deviceId) async {
    return sendCommand(deviceId, matrix2of5Enabled);
  }

  Future<CommandResponse> disableMatrix2of5(String deviceId) async {
    return sendCommand(deviceId, matrix2of5Disabled);
  }

  // MSI Plessey
  Future<CommandResponse> enableMsi(String deviceId) async {
    return sendCommand(deviceId, msiPlesseyEnabled);
  }

  Future<CommandResponse> disableMsi(String deviceId) async {
    return sendCommand(deviceId, msiPlesseyDisabled);
  }

  // S code
  Future<CommandResponse> enableSCode(String deviceId) async {
    return sendCommand(deviceId, sCodeEnabled);
  }

  Future<CommandResponse> disableSCode(String deviceId) async {
    return sendCommand(deviceId, sCodeDisabled);
  }

  // Telepen
  Future<CommandResponse> enableTelepen(String deviceId) async {
    return sendCommand(deviceId, telepenEnabled);
  }

  Future<CommandResponse> disableTelepen(String deviceId) async {
    return sendCommand(deviceId, telepenDisabled);
  }

  // Trioptic Code
  Future<CommandResponse> enableTriopticCode(String deviceId) async {
    return sendCommand(deviceId, triOpticEnabled);
  }

  Future<CommandResponse> disableTriopticCode(String deviceId) async {
    return sendCommand(deviceId, triOpticDisabled);
  }

  // UK Plessey
  Future<CommandResponse> enableUKPlessey(String deviceId) async {
    return sendCommand(deviceId, ukPlesseyEnabled);
  }

  Future<CommandResponse> disableUKPlessey(String deviceId) async {
    return sendCommand(deviceId, ukPlesseyDisabled);
  }

  // UPC-A
  Future<CommandResponse> enableUPCA(String deviceId) async {
    return sendCommand(deviceId, upcAEnabled);
  }

  Future<CommandResponse> disableUPCA(String deviceId) async {
    return sendCommand(deviceId, upcADisabled);
  }

  // UPC-E
  Future<CommandResponse> enableUPCE(String deviceId) async {
    return sendCommand(deviceId, upcEEnabled);
  }

  Future<CommandResponse> disableUPCE(String deviceId) async {
    return sendCommand(deviceId, upcEDisabled);
  }

  // GS1 DataBar
  Future<CommandResponse> enableGS1DataBar(String deviceId) async {
    return sendCommand(deviceId, gs1DataBarEnabled);
  }

  Future<CommandResponse> disableGS1DataBar(String deviceId) async {
    return sendCommand(deviceId, gs1DataBarDisabled);
  }

  // GS1 DataBar Expanded
  Future<CommandResponse> enableGS1DataBarExpanded(String deviceId) async {
    return sendCommand(deviceId, gs1DataBarExpandedEnabled);
  }

  Future<CommandResponse> disableGS1DataBarExpanded(String deviceId) async {
    return sendCommand(deviceId, gs1DataBarExpandedDisabled);
  }

  // GS1 DataBar Limited
  Future<CommandResponse> enableGS1DataBarLimited(String deviceId) async {
    return sendCommand(deviceId, gs1DataBarLimitedEnabled);
  }

  Future<CommandResponse> disableGS1DataBarLimited(String deviceId) async {
    return sendCommand(deviceId, gs1DataBarLimitedDisabled);
  }

  // Australian Postal
  Future<CommandResponse> enableAustralianPostal(String deviceId) async {
    return sendCommand(deviceId, australianPostalEnabled);
  }

  Future<CommandResponse> disableAustralianPostal(String deviceId) async {
    return sendCommand(deviceId, australianPostalDisabled);
  }

  // Chinese Post Matrix 2 of 5
  Future<CommandResponse> enableChinesePostMatrix2of5(String deviceId) async {
    return sendCommand(deviceId, chinesePostMatrix2of5Enabled);
  }

  Future<CommandResponse> disableChinesePostMatrix2of5(String deviceId) async {
    return sendCommand(deviceId, chinesePostMatrix2of5Disabled);
  }

  // Intelligent Mail Barcode
  Future<CommandResponse> enableIntelligentMailBarcode(String deviceId) async {
    return sendCommand(deviceId, intelligentMailBarcodeEnabled);
  }

  Future<CommandResponse> disableIntelligentMailBarcode(String deviceId) async {
    return sendCommand(deviceId, intelligentMailBarcodeDisabled);
  }

  // Japanese Postal
  Future<CommandResponse> enableJapanesePostal(String deviceId) async {
    return sendCommand(deviceId, japanesePostalEnabled);
  }

  Future<CommandResponse> disableJapanesePostal(String deviceId) async {
    return sendCommand(deviceId, japanesePostalDisabled);
  }

  // Korean Postal Authority
  Future<CommandResponse> enableKoreanPostalAuthority(String deviceId) async {
    return sendCommand(deviceId, koreanPostalAuthorityEnabled);
  }

  Future<CommandResponse> disableKoreanPostalAuthority(String deviceId) async {
    return sendCommand(deviceId, koreanPostalAuthorityDisabled);
  }

  // Mailmark 4-State Postal
  Future<CommandResponse> enableMailmark4StatePostal(String deviceId) async {
    return sendCommand(deviceId, mailmark4StatePostalEnabled);
  }

  Future<CommandResponse> disableMailmark4StatePostal(String deviceId) async {
    return sendCommand(deviceId, mailmark4StatePostalDisabled);
  }

  // Netherlands Kix Code
  Future<CommandResponse> enableNetherlandsKixCode(String deviceId) async {
    return sendCommand(deviceId, netherlandsKixCodeEnabled);
  }

  Future<CommandResponse> disableNetherlandsKixCode(String deviceId) async {
    return sendCommand(deviceId, netherlandsKixCodeDisabled);
  }

  // Planet
  Future<CommandResponse> enablePlanet(String deviceId) async {
    return sendCommand(deviceId, planetEnabled);
  }

  Future<CommandResponse> disablePlanet(String deviceId) async {
    return sendCommand(deviceId, planetDisabled);
  }

  // Postnet
  Future<CommandResponse> enablePostnet(String deviceId) async {
    return sendCommand(deviceId, postnetEnabled);
  }

  Future<CommandResponse> disablePostnet(String deviceId) async {
    return sendCommand(deviceId, postnetDisabled);
  }

  // UK Postal
  Future<CommandResponse> enableUKPostal(String deviceId) async {
    return sendCommand(deviceId, ukPostalEnabled);
  }

  Future<CommandResponse> disableUKPostal(String deviceId) async {
    return sendCommand(deviceId, ukPostalDisabled);
  }
}
