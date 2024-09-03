import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/src/constants/symbology_constants.dart';

@lazySingleton
class SymbologyHandler {
  String getSymbologyNameById(int id) {
    if (id == ean8) {
      return 'EAN-8';
    }
    if (id == ean13) {
      return 'EAN-13';
    }
    if (id == discrete2of5) {
      return 'Industrial 2 of 5';
    }
    if (id == matrix2of5) {
      return 'Matrix 2 of 5';
    }
    if (id == interleaved2of5) {
      return 'Interleaved 2 of 5';
    }
    if (id == codabar) {
      return 'Codabar';
    }
    if (id == code93) {
      return 'Code 93';
    }
    if (id == code128) {
      return 'Code 128';
    }
    if (id == upcA) {
      return 'UPC-A';
    }
    if (id == upcE) {
      return 'UPC-E';
    }
    if (id == gs1_14) {
      return 'GS1 Databar-14';
    }
    if (id == gs1Limit) {
      return 'GS1 DataBar Limited';
    }
    if (id == gs1Exp) {
      return 'GS1 DataBar Expanded';
    }
    if (id == pdf417) {
      return 'PDF417';
    }
    if (id == triOptic) {
      return 'Tri-Optic';
    }
    if (id == code32) {
      return 'Code 32';
    }
    if (id == microPdf417) {
      return 'MicroPDF417';
    }
    if (id == qrCode) {
      return 'QR Code';
    }
    if (id == aztec) {
      return 'Aztec';
    }
    if (id == postalPlanet) {
      return 'PLANET';
    }
    if (id == postalPostnet) {
      return 'POSTNET';
    }
    if (id == postal4State) {
      return 'Mailmark4StatePostal';
    }
    if (id == postalRoyalMail) {
      return 'UK Postal (Royal Mail)';
    }
    if (id == postalAustralian) {
      return 'Australian Postal';
    }
    if (id == postalKix) {
      return 'Netherlands KIX Code';
    }
    if (id == postalJapan) {
      return 'Japanese Postal';
    }
    if (id == gs1_128) {
      return 'GS1-128';
    }
    if (id == microQr) {
      return 'Micro QR Code';
    }
    if (id == upcE1) {
      return 'UPC-E1';
    }
    if (id == upcAAddOn2) {
      return 'UPC-A + 2';
    }
    if (id == upcEAddOn2) {
      return 'UPC-E + 2';
    }
    if (id == ean13AddOn2) {
      return 'EAN-13 + 2';
    }
    if (id == ean8AddOn2) {
      return 'EAN-8 + 2';
    }
    if (id == upcAAddOn5) {
      return 'UPC-A + 5';
    }
    if (id == upcEAddOn5) {
      return 'UPC-E + 5';
    }
    if (id == ean13AddOn5) {
      return 'EAN-13 + 5';
    }
    if (id == ean8AddOn5) {
      return 'EAN-8 + 5';
    }
    if (id == issn) {
      return 'ISSN';
    }
    if (id == isbn) {
      return 'ISBN';
    }
    if (id == upcE1AddOn2) {
      return 'UPC-E1 + 2';
    }
    if (id == upcE1AddOn5) {
      return 'UPC-E1 + 5';
    }
    if (id == isbt128) {
      return 'ISBT 128';
    }
    if (id == code39FullAscii) {
      return 'Code 39 Full ASCII';
    }
    if (id == code39) {
      return 'Code 39';
    }
    if (id == italianPharmaceutical) {
      return 'Italian Pharmacode';
    }
    if (id == codabarABC) {
      return 'ABC Codabar';
    }
    if (id == codabarCX) {
      return 'CX Codabar';
    }
    if (id == industrial2of5) {
      return 'Industrial 2 of 5';
    }
    if (id == sCode) {
      return 'S-Code';
    }
    if (id == chinesePost) {
      return 'Chinese Post Matrix 2 of 5';
    }
    if (id == iata) {
      return 'IATA';
    }
    if (id == msiPlessey) {
      return 'MSI/Plessey';
    }
    if (id == telepen) {
      return 'Telepen';
    }
    if (id == ukPlessey) {
      return 'UK/Plessey';
    }
    if (id == code11) {
      return 'Code 11';
    }
    if (id == koreanPostal) {
      return 'Korean Postal Authority code';
    }
    if (id == intelligentMail) {
      return 'Intelligent Mail Barcode';
    }
    if (id == gs1DataBar) {
      return 'GS1 DataBar';
    }
    if (id == ccA) {
      return 'CC-A';
    }
    if (id == ccB) {
      return 'CC-B';
    }
    if (id == ccC) {
      return 'CC-C';
    }
    if (id == codablockF) {
      return 'Codablock-F';
    }
    if (id == dataMatrix) {
      return 'DataMatrix';
    }
    if (id == chineseSensible) {
      return 'Chinese Sensible code';
    }
    if (id == maxiCode) {
      return 'MaxiCode';
    }
    if (id == ocr) {
      return 'OCR';
    }
    if (id == dotCode) {
      return 'DotCode';
    }
    return '';
  }

  int getSymbologyIdByOpticonIdAndAimId(String opticonId, String aimId) {
    if (opticonId == 'B' && aimId == 'E') {
      return ean13;
    }
    if (opticonId == 'C' && aimId == 'E') {
      return upcA;
    }
    if (opticonId == 'A' && aimId == 'E') {
      return ean8;
    }
    if (opticonId == 'D' && aimId == 'E') {
      return upcE;
    }
    if (opticonId == 'B' && aimId == 'X') {
      return isbn;
    }
    if (opticonId == 'V' && aimId == 'A') {
      return code39;
    }
    if (opticonId == 'R' && aimId == 'F') {
      return codabar;
    }
    if (opticonId == 'O' && aimId == 'S') {
      return discrete2of5;
    }
    if (opticonId == 'N' && aimId == 'I') {
      return interleaved2of5;
    }
    if (opticonId == 'U' && aimId == 'G') {
      return code93;
    }
    if (opticonId == 'T' && aimId == 'C') {
      return code128;
    }
    if (opticonId == 'Z' && aimId == 'M') {
      return msiPlessey;
    }
    if (opticonId == 'P' && aimId == 'R') {
      return iata;
    }
    if (opticonId == 'a' && aimId == 'P') {
      return ukPlessey;
    }
    if (opticonId == 'd' && aimId == 'B') {
      return telepen;
    }
    if (opticonId == 'Q' && aimId == 'X') {
      return matrix2of5;
    }
    if (opticonId == 'g' && aimId == 'X') {
      return sCode;
    }
    if (opticonId == 'V' && aimId == 'X') {
      return triOptic;
    }
    if (opticonId == 'W' && aimId == 'A') {
      return code39FullAscii;
    }
    if (opticonId == 'Y' && aimId == 'X') {
      return italianPharmaceutical;
    }
    if (opticonId == 'T' && aimId == 'C') {
      return gs1_128;
    }
    if (opticonId == 'y' && aimId == 'e') {
      return gs1DataBar;
    }
    if (opticonId == 'r' && aimId == 'L') {
      return pdf417;
    }
    if (opticonId == 'l' && aimId == 'e') {
      return ccC;
    }
    if (opticonId == 's' && aimId == 'L') {
      return microPdf417;
    }
    if (opticonId == 'm' && aimId == 'e') {
      return ccA;
    }
    if (opticonId == 'n' && aimId == 'e') {
      return ccB;
    }
    if (opticonId == 'b' && aimId == 'H') {
      return code11;
    }
    if (opticonId == 'c' && aimId == 'X') {
      return koreanPostal;
    }
    if (opticonId == 'E' && aimId == 'O') {
      return codablockF;
    }
    if (opticonId == 'L' && aimId == 'E') {
      return ean13AddOn2;
    }
    if (opticonId == 'F' && aimId == 'E') {
      return upcAAddOn2;
    }
    if (opticonId == 'J' && aimId == 'E') {
      return ean8AddOn2;
    }
    if (opticonId == 'H' && aimId == 'E') {
      return upcEAddOn2;
    }
    if (opticonId == 'M' && aimId == 'E') {
      return ean13AddOn5;
    }
    if (opticonId == 'G' && aimId == 'E') {
      return upcAAddOn5;
    }
    if (opticonId == 'K' && aimId == 'E') {
      return ean8AddOn5;
    }
    if (opticonId == 'I' && aimId == 'E') {
      return upcEAddOn5;
    }
    if (opticonId == 'u' && aimId == 'Q') {
      return qrCode;
    }
    if (opticonId == 't' && aimId == 'd') {
      return dataMatrix;
    }
    if (opticonId == 'v' && aimId == 'Q') {
      return microQr;
    }
    if (opticonId == 'v' && aimId == 'U') {
      return maxiCode;
    }
    if (opticonId == 'o' && aimId == 'z') {
      return aztec;
    }
    if (opticonId == 'B' && aimId == 'e') {
      return ean13;
    }
    if (opticonId == 'C' && aimId == 'e') {
      return upcA;
    }
    if (opticonId == 'A' && aimId == 'e') {
      return ean8;
    }
    if (opticonId == 'D' && aimId == 'e') {
      return upcE;
    }
    if (opticonId == 't' && aimId == 'd') {
      return dataMatrix;
    }
    if (opticonId == 'v' && aimId == 'Q') {
      return qrCode;
    }
    if (opticonId == '?' && aimId == 'X') {
      return chineseSensible;
    }
    return -1;
  }

  int getSymbologyIdByCodeId(int codeId) {
    switch (codeId) {
      case 0x01:
        return ean13;
      case 0x02:
        return upcA;
      case 0x03:
        return ean8;
      case 0x04:
        return upcE;
      case 0x05:
        return upcE1;
      case 0x06:
        return isbn;
      case 0x07:
        return issn;
      case 0x08:
        return ismn;
      case 0x09:
        return code39;
      case 0x0A:
        return codabar;
      case 0x0B:
        return discrete2of5;
      case 0x0C:
        return interleaved2of5;
      case 0x0D:
        return code93;
      case 0x0E:
        return code128;
      case 0x0F:
        return msiPlessey;
      case 0x10:
        return iata;
      case 0x11:
        return ukPlessey;
      case 0x12:
        return telepen;
      case 0x13:
        return matrix2of5;
      case 0x14:
        return chinesePost;
      case 0x15:
        return codabarABC;
      case 0x16:
        return codabarCX;
      case 0x17:
        return sCode;
      case 0x18:
        return triOptic;
      case 0x19:
        return code39FullAscii;
      case 0x1A:
        return italianPharmaceutical;
      case 0x1B:
        return code128;
      case 0x1C:
        return gs1_14;
      case 0x1D:
        return gs1Limit;
      case 0x1E:
        return gs1Exp;
      case 0x1F:
        return pdf417;
      case 0x21:
        return microPdf417;
      case 0x24:
        return code11;
      case 0x26:
        return koreanPostal;
      case 0x27:
        return codablockF;
      case 0x30:
        return qrCode;
      case 0x31:
        return dataMatrix;
      case 0x32:
        return maxiCode;
      case 0x33:
        return aztec;
      case 0x34:
        return ocr;
      case 0x35:
        return chineseSensible;
      case 0x38:
        return dotCode;
      case 0x41:
        return ean13AddOn2;
      case 0x42:
        return upcAAddOn2;
      case 0x43:
        return ean8AddOn2;
      case 0x44:
        return upcEAddOn2;
      case 0x45:
        return upcE1AddOn2;
      case 0x4E:
        return code128;
      case 0x81:
        return ean13AddOn5;
      case 0x82:
        return upcAAddOn5;
      case 0x83:
        return ean8AddOn5;
      case 0x84:
        return upcEAddOn5;
      case 0x85:
        return upcE1AddOn5;
      case 0x8E:
        return code128;
      case 0xF0:
        return code39;
      case 0xF1:
        return pdf417;
      case 0xF2:
        return code128;
      case 0xF3:
        return qrCode;
      case 0xF4:
        return aztec;
    }
    return 0;
  }
}
