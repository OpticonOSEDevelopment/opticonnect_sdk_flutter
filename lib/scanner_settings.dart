import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/entities/scanner_command.dart';
import 'package:opticonnect_sdk/opticonnect_sdk.dart';

class ScannerSettings {
  final OptiConnectSDK _sdk;
  ScannerSettings(this._sdk);

  // Enable single 1D code only
  Future<CommandResponse> set1DAllCodesOnly(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enable1DAllCodesOnly));
  }

  Future<CommandResponse> setCode11Only(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableCode11Only));
  }

  Future<CommandResponse> setCode39Only(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableCode39Only));
  }

  Future<CommandResponse> setCode93Only(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableCode93Only));
  }

  Future<CommandResponse> setCode128Only(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableCode128Only));
  }

  Future<CommandResponse> setCodabarOnly(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableCodabarOnly));
  }

  Future<CommandResponse> setEANOnly(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableEANOnly));
  }

  Future<CommandResponse> setEANPlus2Only(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableEANPlus2Only));
  }

  Future<CommandResponse> setEANPlus5Only(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableEANPlus5Only));
  }

  Future<CommandResponse> setEAN8Only(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableEAN8Only));
  }

  Future<CommandResponse> setEAN8Plus2Only(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableEAN8Plus2Only));
  }

  Future<CommandResponse> setEAN8Plus5Only(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableEAN8Plus5Only));
  }

  Future<CommandResponse> setEAN13Only(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableEAN13Only));
  }

  Future<CommandResponse> setEAN13Plus2Only(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableEAN13Plus2Only));
  }

  Future<CommandResponse> setEAN13Plus5Only(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableEAN13Plus5Only));
  }

  Future<CommandResponse> setIATAOnly(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableIATAOnly));
  }

  Future<CommandResponse> setIndustrial2of5Only(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableIndustrial2of5Only));
  }

  Future<CommandResponse> setInterleaved2of5Only(String deviceId) async {
    return _sdk.sendCommand(
        deviceId, ScannerCommand(enableInterleaved2of5Only));
  }

  Future<CommandResponse> setMatrix2of5Only(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableMatrix2of5Only));
  }

  Future<CommandResponse> setMSIPlesseyOnly(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableMSIPlesseyOnly));
  }

  Future<CommandResponse> setNixdorfOnly(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableNixdorfOnly));
  }

  Future<CommandResponse> setSCodeOnly(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableSCodeOnly));
  }

  Future<CommandResponse> setTelepenOnly(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableTelepenOnly));
  }

  Future<CommandResponse> setTriOpticOnly(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableTriOpticOnly));
  }

  Future<CommandResponse> setUKPlesseyOnly(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableUKPlesseyOnly));
  }

  Future<CommandResponse> setUPCOnly(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableUPCOnly));
  }

  Future<CommandResponse> setUPCAOnly(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableUPCAOnly));
  }

  Future<CommandResponse> setUPCAPlus2Only(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableUPCAPlus2Only));
  }

  Future<CommandResponse> setUPCAPlus5Only(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableUPCAPlus5Only));
  }

  Future<CommandResponse> setUPCAEOnly(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableUPCAEOnly));
  }

  Future<CommandResponse> setUPCAEPlus2Only(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableUPCAEPlus2Only));
  }

  Future<CommandResponse> setUPCAEPlus5Only(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableUPCAEPlus5Only));
  }

  Future<CommandResponse> setUPCEOnly(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableUPCEOnly));
  }

  Future<CommandResponse> setUPCEPlus2Only(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableUPCEPlus2Only));
  }

  Future<CommandResponse> setUPCEPlus5Only(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableUPCEPlus5Only));
  }

  Future<CommandResponse> setUPCE1Only(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableUPCE1Only));
  }

  Future<CommandResponse> setUPCE1Plus2Only(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableUPCE1Plus2Only));
  }

  Future<CommandResponse> setUPCE1Plus5Only(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableUPCE1Plus5Only));
  }

  Future<CommandResponse> setGS1DataBarOnly(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableGS1DataBarOnly));
  }

  Future<CommandResponse> setGS1DataBarLimitedOnly(String deviceId) async {
    return _sdk.sendCommand(
        deviceId, ScannerCommand(enableGS1DataBarLimitedOnly));
  }

  Future<CommandResponse> setGS1DataBarExpandedOnly(String deviceId) async {
    return _sdk.sendCommand(
        deviceId, ScannerCommand(enableGS1DataBarExpandedOnly));
  }

  // Enable single 2D code only
  Future<CommandResponse> set2DAllCodesOnly(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enable2DAllCodesOnly));
  }

  Future<CommandResponse> setAztecCodeOnly(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableAztecCodeOnly));
  }

  Future<CommandResponse> setAztecRunesOnly(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableAztecRunesOnly));
  }

  Future<CommandResponse> setChineseSensibleCodeOnly(String deviceId) async {
    return _sdk.sendCommand(
        deviceId, ScannerCommand(enableChineseSensibleCodeOnly));
  }

  Future<CommandResponse> setCodablockFOnly(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableCodablockFOnly));
  }

  Future<CommandResponse> setDataMatrixOnly(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableDataMatrixOnly));
  }

  Future<CommandResponse> setDataMatrixOldECC000_140Only(
      String deviceId) async {
    return _sdk.sendCommand(
        deviceId, ScannerCommand(enableDataMatrixOldECC000_140Only));
  }

  Future<CommandResponse> setDotCodeOnly(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableDotCodeOnly));
  }

  Future<CommandResponse> setMaxicodeOnly(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableMaxicodeOnly));
  }

  Future<CommandResponse> setMicroPDF417Only(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableMicroPDF417Only));
  }

  Future<CommandResponse> setMicroQRCodeOnly(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableMicroQRCodeOnly));
  }

  Future<CommandResponse> setPDF417Only(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enablePDF417Only));
  }

  Future<CommandResponse> setQRCodeOnly(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableQRCodeOnly));
  }

  Future<CommandResponse> setAustralianPostalOnly(String deviceId) async {
    return _sdk.sendCommand(
        deviceId, ScannerCommand(enableAustralianPostalOnly));
  }

  Future<CommandResponse> setChinesePostMatrix2of5Only(String deviceId) async {
    return _sdk.sendCommand(
        deviceId, ScannerCommand(enableChinesePostMatrix2of5Only));
  }

  Future<CommandResponse> setIntelligentMailBarcodeOnly(String deviceId) async {
    return _sdk.sendCommand(
        deviceId, ScannerCommand(enableIntelligentMailBarcodeOnly));
  }

  Future<CommandResponse> setJapanesePostalOnly(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enableJapanesePostalOnly));
  }

  Future<CommandResponse> setKoreanPostalAuthorityOnly(String deviceId) async {
    return _sdk.sendCommand(
        deviceId, ScannerCommand(enableKoreanPostalAuthorityOnly));
  }

  Future<CommandResponse> setMailmark4StatePostalOnly(String deviceId) async {
    return _sdk.sendCommand(
        deviceId, ScannerCommand(enableMailmark4StatePostalOnly));
  }

  Future<CommandResponse> setNetherlandsKIXCodeOnly(String deviceId) async {
    return _sdk.sendCommand(
        deviceId, ScannerCommand(enableNetherlandsKIXCodeOnly));
  }

  Future<CommandResponse> setPlanetOnly(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enablePlanetOnly));
  }

  Future<CommandResponse> setPostnetOnly(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(enablePostnetOnly));
  }

  // Aztec Code
  Future<CommandResponse> enableAztecCode(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(aztecEnabled));
  }

  Future<CommandResponse> disableAztecCode(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(aztecDisabled));
  }

  // Aztec Runes
  Future<CommandResponse> enableAztecRunes(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(aztecRunesEnabled));
  }

  Future<CommandResponse> disableAztecRunes(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(aztecRunesDisabled));
  }

  // Chinese Sensible Code
  Future<CommandResponse> enableChineseSensibleCode(String deviceId) async {
    return _sdk.sendCommand(
        deviceId, ScannerCommand(chineseSensibleCodeEnabled));
  }

  Future<CommandResponse> disableChineseSensibleCode(String deviceId) async {
    return _sdk.sendCommand(
        deviceId, ScannerCommand(chineseSensibleCodeDisabled));
  }

  // Data Matrix
  Future<CommandResponse> enableDataMatrix(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(dataMatrixEnabled));
  }

  Future<CommandResponse> disableDataMatrix(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(dataMatrixDisabled));
  }

  // Maxicode
  Future<CommandResponse> enableMaxicode(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(maxicodeEnabled));
  }

  Future<CommandResponse> disableMaxicode(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(maxicodeDisabled));
  }

  // Micro PDF417
  Future<CommandResponse> enableMicroPdf417(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(microPdf417Enabled));
  }

  Future<CommandResponse> disableMicroPdf417(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(microPdf417Disabled));
  }

  // Micro QR Code
  Future<CommandResponse> enableMicroQrCode(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(microQrCodeEnabled));
  }

  Future<CommandResponse> disableMicroQrCode(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(microQrCodeDisabled));
  }

  // PDF417
  Future<CommandResponse> enablePdf417(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(pdf417CodeEnabled));
  }

  Future<CommandResponse> disablePdf417(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(pdf417CodeDisabled));
  }

  // QR Code
  Future<CommandResponse> enableQrCode(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(qrCodeEnabled));
  }

  Future<CommandResponse> disableQrCode(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(qrCodeDisabled));
  }

  // Dot Code
  Future<CommandResponse> enableDotCode(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(dotCodeEnabled));
  }

  Future<CommandResponse> disableDotCode(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(dotCodeDisabled));
  }

  // Codablock F
  Future<CommandResponse> enableCodablockF(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(codablockFEnabled));
  }

  Future<CommandResponse> disableCodablockF(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(codablockFDisabled));
  }

  // Codabar
  Future<CommandResponse> enableCodabar(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(codaBarEnabled));
  }

  Future<CommandResponse> disableCodabar(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(codaBarDisabled));
  }

  // Code 11
  Future<CommandResponse> enableCode11(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(code11Enabled));
  }

  Future<CommandResponse> disableCode11(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(code11Disabled));
  }

  // Code 39
  Future<CommandResponse> enableCode39(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(code39Enabled));
  }

  Future<CommandResponse> disableCode39(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(code39Disabled));
  }

  // Code 93
  Future<CommandResponse> enableCode93(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(code93Enabled));
  }

  Future<CommandResponse> disableCode93(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(code93Disabled));
  }

  // Code 128
  Future<CommandResponse> enableCode128(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(code128Enabled));
  }

  Future<CommandResponse> disableCode128(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(code128Disabled));
  }

  // EAN 8
  Future<CommandResponse> enableEan8(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(ean8Enabled));
  }

  Future<CommandResponse> disableEan8(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(ean8Disabled));
  }

  // EAN 13
  Future<CommandResponse> enableEan13(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(ean13Enabled));
  }

  Future<CommandResponse> disableEan13(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(ean13Disabled));
  }

  // IATA
  Future<CommandResponse> enableIata(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(iataEnabled));
  }

  Future<CommandResponse> disableIata(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(iataDisabled));
  }

  // Industrial 2 of 5
  Future<CommandResponse> enableIndustrial2of5(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(industrial2of5Enabled));
  }

  Future<CommandResponse> disableIndustrial2of5(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(industrial2of5Disabled));
  }

  // Interleaved 2 of 5
  Future<CommandResponse> enableInterleaved2of5(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(interleaved2of5Enabled));
  }

  Future<CommandResponse> disableInterleaved2of5(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(interleaved2of5Disabled));
  }

  // Matrix 2 of 5
  Future<CommandResponse> enableMatrix2of5(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(matrix2of5Enabled));
  }

  Future<CommandResponse> disableMatrix2of5(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(matrix2of5Disabled));
  }

  // MSI Plessey
  Future<CommandResponse> enableMsi(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(msiPlesseyEnabled));
  }

  Future<CommandResponse> disableMsi(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(msiPlesseyDisabled));
  }

  // S code
  Future<CommandResponse> enableSCode(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(sCodeEnabled));
  }

  Future<CommandResponse> disableSCode(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(sCodeDisabled));
  }

  // Telepen
  Future<CommandResponse> enableTelepen(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(telepenEnabled));
  }

  Future<CommandResponse> disableTelepen(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(telepenDisabled));
  }

  // Trioptic Code
  Future<CommandResponse> enableTriopticCode(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(triOpticEnabled));
  }

  Future<CommandResponse> disableTriopticCode(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(triOpticDisabled));
  }

  // UK Plessey
  Future<CommandResponse> enableUKPlessey(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(ukPlesseyEnabled));
  }

  Future<CommandResponse> disableUKPlessey(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(ukPlesseyDisabled));
  }

  // UPC-A
  Future<CommandResponse> enableUPCA(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(upcAEnabled));
  }

  Future<CommandResponse> disableUPCA(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(upcADisabled));
  }

  // UPC-E
  Future<CommandResponse> enableUPCE(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(upcEEnabled));
  }

  Future<CommandResponse> disableUPCE(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(upcEDisabled));
  }

  // GS1 DataBar
  Future<CommandResponse> enableGS1DataBar(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(gs1DataBarEnabled));
  }

  Future<CommandResponse> disableGS1DataBar(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(gs1DataBarDisabled));
  }

  // GS1 DataBar Expanded
  Future<CommandResponse> enableGS1DataBarExpanded(String deviceId) async {
    return _sdk.sendCommand(
        deviceId, ScannerCommand(gs1DataBarExpandedEnabled));
  }

  Future<CommandResponse> disableGS1DataBarExpanded(String deviceId) async {
    return _sdk.sendCommand(
        deviceId, ScannerCommand(gs1DataBarExpandedDisabled));
  }

  // GS1 DataBar Limited
  Future<CommandResponse> enableGS1DataBarLimited(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(gs1DataBarLimitedEnabled));
  }

  Future<CommandResponse> disableGS1DataBarLimited(String deviceId) async {
    return _sdk.sendCommand(
        deviceId, ScannerCommand(gs1DataBarLimitedDisabled));
  }

  // Australian Postal
  Future<CommandResponse> enableAustralianPostal(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(australianPostalEnabled));
  }

  Future<CommandResponse> disableAustralianPostal(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(australianPostalDisabled));
  }

  // Chinese Post Matrix 2 of 5
  Future<CommandResponse> enableChinesePostMatrix2of5(String deviceId) async {
    return _sdk.sendCommand(
        deviceId, ScannerCommand(chinesePostMatrix2of5Enabled));
  }

  Future<CommandResponse> disableChinesePostMatrix2of5(String deviceId) async {
    return _sdk.sendCommand(
        deviceId, ScannerCommand(chinesePostMatrix2of5Disabled));
  }

  // Intelligent Mail Barcode
  Future<CommandResponse> enableIntelligentMailBarcode(String deviceId) async {
    return _sdk.sendCommand(
        deviceId, ScannerCommand(intelligentMailBarcodeEnabled));
  }

  Future<CommandResponse> disableIntelligentMailBarcode(String deviceId) async {
    return _sdk.sendCommand(
        deviceId, ScannerCommand(intelligentMailBarcodeDisabled));
  }

  // Japanese Postal
  Future<CommandResponse> enableJapanesePostal(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(japanesePostalEnabled));
  }

  Future<CommandResponse> disableJapanesePostal(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(japanesePostalDisabled));
  }

  // Korean Postal Authority
  Future<CommandResponse> enableKoreanPostalAuthority(String deviceId) async {
    return _sdk.sendCommand(
        deviceId, ScannerCommand(koreanPostalAuthorityEnabled));
  }

  Future<CommandResponse> disableKoreanPostalAuthority(String deviceId) async {
    return _sdk.sendCommand(
        deviceId, ScannerCommand(koreanPostalAuthorityDisabled));
  }

  // Mailmark 4-State Postal
  Future<CommandResponse> enableMailmark4StatePostal(String deviceId) async {
    return _sdk.sendCommand(
        deviceId, ScannerCommand(mailmark4StatePostalEnabled));
  }

  Future<CommandResponse> disableMailmark4StatePostal(String deviceId) async {
    return _sdk.sendCommand(
        deviceId, ScannerCommand(mailmark4StatePostalDisabled));
  }

  // Netherlands Kix Code
  Future<CommandResponse> enableNetherlandsKixCode(String deviceId) async {
    return _sdk.sendCommand(
        deviceId, ScannerCommand(netherlandsKixCodeEnabled));
  }

  Future<CommandResponse> disableNetherlandsKixCode(String deviceId) async {
    return _sdk.sendCommand(
        deviceId, ScannerCommand(netherlandsKixCodeDisabled));
  }

  // Planet
  Future<CommandResponse> enablePlanet(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(planetEnabled));
  }

  Future<CommandResponse> disablePlanet(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(planetDisabled));
  }

  // Postnet
  Future<CommandResponse> enablePostnet(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(postnetEnabled));
  }

  Future<CommandResponse> disablePostnet(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(postnetDisabled));
  }

  // UK Postal
  Future<CommandResponse> enableUKPostal(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(ukPostalEnabled));
  }

  Future<CommandResponse> disableUKPostal(String deviceId) async {
    return _sdk.sendCommand(deviceId, ScannerCommand(ukPostalDisabled));
  }
}
