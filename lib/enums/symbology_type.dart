part of 'package:opticonnect_sdk/enums/enums.dart';

enum SymbologyType {
  allCodes,
  // 1D Symbologies
  all1DCodes,
  code11,
  code39,
  code93,
  code128,
  codabar,
  ean8,
  ean8AddOn2,
  ean8AddOn5,
  ean13,
  ean13AddOn2,
  ean13AddOn5,
  iata,
  industrial2of5,
  interleaved2of5,
  matrix2of5,
  msiPlessey,
  // nixdorf,
  sCode,
  telepen,
  triOptic,
  ukPlessey,
  upcA,
  upcAAddOn2,
  upcAAddOn5,
  upcE,
  upcEAddOn2,
  upcEAddOn5,
  upcE1,
  upcE1AddOn2,
  upcE1AddOn5,
  gs1DataBarAllTypes,
  gs1DataBar,
  gs1DataBarLimited,
  gs1DataBarExpanded,

  // 2D Symbologies
  all2DCodes,
  aztecCode,
  aztecRunes,
  chineseSensibleCode,
  codablockF,
  dataMatrix,
  dataMatrixOldECC000_140,
  dotCode,
  maxicode,
  microPDF417,
  microQRCode,
  pdf417,
  qrCode,

  // Postal Symbologies
  australianPostal,
  chinesePostMatrix2of5,
  intelligentMailBarcode,
  japanesePostal,
  koreanPostalAuthority,
  mailmark4StatePostal,
  netherlandsKIXCode,
  planet,
  postnet,
  ukPostal,
}
