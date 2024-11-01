/// Enable 1D symbologies for scanning.
/// These commands enable or disable individual 1D barcode symbologies.
const String enable1DAllCodesExclAddonOnly = '[BCA';
const String enableCode11Only = '[BLB';
const String enableCode39Only = 'A2';
const String enableCode93Only = 'A5';
const String enableCode128Only = 'A6';
const String enableCodabarOnly = 'A3';
const String enableEANOnly = 'J4';
const String enableEAN8Only = 'JA';
const String enableEAN13Only = 'JG';
const String enableEANPlus2Only = 'J5';
const String enableEANPlus5Only = 'J6';
const String enableEAN8Plus2Only = 'JB';
const String enableEAN8Plus5Only = 'JC';
const String enableEAN13Plus2Only = 'JH';
const String enableEAN13Plus5Only = 'JI';
const String enableIATAOnly = 'A4';
const String enableIndustrial2of5Only = 'J7';
const String enableInterleaved2of5Only = 'J8';
const String enableMatrix2of5Only = 'AB';
const String enableMSIPlesseyOnly = 'A7';
const String enableSCodeOnly = 'RA';
const String enableTelepenOnly = 'A9';
const String enableTriOpticOnly = 'JD';
const String enableUKPlesseyOnly = 'A1';
const String enableUPCAOnly = '[J1A';
const String enableUPCAPlus2Only = '[J2A';
const String enableUPCAPlus5Only = '[J3A';
const String enableUPCAEOnly = 'J1';
const String enableUPCAEPlus2Only = 'J2';
const String enableUPCAEPlus5Only = 'J3';
const String enableUPCEOnly = '[J1B';
const String enableUPCEPlus2Only = '[J2B';
const String enableUPCEPlus5Only = '[J3B';
const String enableUPCE1Only = '[J1C';
const String enableUPCE1Plus2Only = '[J2C';
const String enableUPCE1Plus5Only = '[J3C';
const String enableGS1AllTypesOnly = '[BC6';
const String enableGS1DataBarOnly = 'J9';
const String enableGS1DataBarLimitedOnly = 'JJ';
const String enableGS1DataBarExpandedOnly = 'JK';

/// Enable 2D symbologies for scanning.
/// These commands enable or disable individual 2D barcode symbologies.
const String enableAll2DCodesOnly = '[BCB';
const String enableAztecCodeOnly = '[BC5';
const String enableAztecRunesOnly = '[BF4';
const String enableChineseSensibleCodeOnly = '[D4K';
const String enableCodablockFOnly = '[D4R';
const String enableDataMatrixOnly = '[BC0';
const String enableDataMatrixOldECC000_140Only = '[BG2';
const String enableDotCodeOnly = '[DOC';
const String enableMaxicodeOnly = '[BC2';
const String enableMicroPDF417Only = '[BC4';
const String enableMicroQRCodeOnly = '[D38';
const String enablePDF417Only = '[BC3';
const String enableQRCodeOnly = '[BC1';

/// Commands for enabling postal only symbologies.
const String enableAustralianPostalOnly = '[D6O';
const String enableChinesePostMatrix2of5Only = 'JE';
const String enableIntelligentMailBarcodeOnly = '[D5H';
const String enableJapanesePostalOnly = '[D5R';
const String enableKoreanPostalAuthorityOnly = 'JL';
const String enableMailmark4StatePostalOnly = '[DGS';
const String enableNetherlandsKIXCodeOnly = '[D5M';
const String enablePlanetOnly = '[DG2';
const String enablePostnetOnly = '[D6C';
const String enableUKPostalOnly = '[DG7';

/// Commands for disabling symbologies
const String disableAllCodes = 'B0';

/// Commands for disabling 1D symbologies
const String disableAll1DCodes = '[BCY';
const String disableCode11 = '[BLA';
const String disableCode39 = 'VB';
const String disableCode93 = 'VD';
const String disableCode128 = 'VE';
const String disableCodabar = 'VC';
const String disableEAN = '[X4E';
const String disableEAN8 = '[DDN';
const String disableEAN13 = '[DDM';
const String disableEANPlus2 = '[X4F';
const String disableEANPlus5 = '[X4G';
const String disableEAN8Plus2 = '[X4M';
const String disableEAN8Plus5 = '[X4O';
const String disableEAN13Plus2 = '[X4N';
const String disableEAN13Plus5 = '[X4P';
const String disableIATA = 'VH';
const String disableIndustrial2of5 = '[X4K';
const String disableInterleaved2of5 = '[X4L';
const String disableMatrix2of5 = '[DDL';
const String disableMsiPlessey = 'VF';
const String disableSCode = '[DDK';
const String disableTelepen = 'VG';
const String disableTriOptic = '[DDJ';
const String disableUKPlessey = 'VA';
const String disableUPCA = '[V1A';
const String disableUPCAPlus2 = '[V2A';
const String disableUPCAPlus5 = '[V3A';
const String disableUPCAE = '[X4B';
const String disableUPCAEPlus2 = '[X4C';
const String disableUPCAEPlus5 = '[X4D';
const String disableUPCE = '[V1B';
const String disableUPCEPlus2 = '[V2B';
const String disableUPCEPlus5 = '[V3B';
const String disableUPCE1 = 'KP';
const String disableUPCE1Plus2 = '[V2C';
const String disableUPCE1Plus5 = '[V3C';
const String disableGS1AllTypes = '[BCU';
const String disableGS1DataBar = 'SJ';
const String disableGS1DataBarLimited = 'SK';
const String disableGS1DataBarExpanded = 'SL';

/// Commands for disabling 2D symbologies
const String disableAll2DCodes = '[BCZ';
const String disableAztecCode = '[BCT';
const String disableAztecRunes = '[BF3';
const String disableChineseSensibleCode = '[D4M';
const String disableCodablockF = '[D4Q';
const String disableDataMatrix = '[BCO';
const String disableDataMatrixOldECC000_140 = '[BG1';
const String disableDotCode = '[DOE';
const String disableMaxicode = '[BCQ';
const String disableMicroPDF417 = '[BCS';
const String disableMicroQRCode = '[D2V';
const String disablePDF417 = '[BCR';
const String disableQRCode = '[BCP';

/// Commands for disabling postal symbologies
const String disableAustralianPostal = '[D6N';
const String disableChinesePostMatrix2of5 = 'JT';
const String disableIntelligentMailBarcode = '[D5G';
const String disableJapanesePostal = '[D5Q';
const String disableKoreanPostalAuthority = 'WI';
const String disableMailmark4StatePostal = '[DGU';
const String disableNetherlandsKIXCode = '[D5L';
const String disablePlanet = '[DG4';
const String disablePostnet = '[D6B';
const String disableUKPostal = '[DG9';

/// Commands for enabling symbologies
const String enableAllCodesExclAddon = 'A0';

/// Commands for enabling 1D symbologies
const String enableAll1DCodesExclAddon = '[BCM';
const String enableCode11 = '[BLC';
const String enableCode39 = 'B2';
const String enableCode93 = 'B5';
const String enableCode128 = 'B6';
const String enableCodabar = 'B3';
const String enableEAN = 'R4';
const String enableEAN8 = 'JO';
const String enableEAN13 = 'JU';
const String enableEANPlus2 = 'R5';
const String enableEANPlus5 = 'R6';
const String enableEAN8Plus2 = 'JP';
const String enableEAN8Plus5 = 'JQ';
const String enableEAN13Plus2 = 'JV';
const String enableEAN13Plus5 = 'JW';
const String enableIATA = 'B4';
const String enableIndustrial2of5 = 'R7';
const String enableInterleaved2of5 = 'R8';
const String enableMatrix2of5 = 'BB';
const String enableMSIPlessey = 'B7';
const String enableSCode = 'R9';
const String enableTelepen = 'B9';
const String enableTriOptic = 'JZ';
const String enableUKPlessey = 'B1';
const String enableUPCA = '[R1A';
const String enableUPCAPlus2 = '[R2A';
const String enableUPCAPlus5 = '[R3A';
const String enableUPCAE = 'R1';
const String enableUPCAEPlus2 = 'R2';
const String enableUPCAEPlus5 = 'R3';
const String enableUPCE = '[R1B';
const String enableUPCEPlus2 = '[R2B';
const String enableUPCEPlus5 = '[R3B';
const String enableUPCE1 = 'KQ';
const String enableUPCE1Plus2 = '[R2C';
const String enableUPCE1Plus5 = '[R3C';
const String enableGS1AllTypes = '[BCI';
const String enableGS1DataBar = 'JX';
const String enableGS1DatabarLimited = 'JY';
const String enableGS1DataBarExpanded = 'DR';

/// Commands for enabling 2D symbologies
const String enableAll2DCodes = '[BCN';
const String enableAztecCode = '[BCH';
const String enableAztecRunes = '[BF2';
const String enableChineseSensibleCode = '[D4L';
const String enableCodablockF = '[D4P';
const String enableDataMatrix = '[BCC';
const String enableDataMatrixOldECC000_140 = '[BG0';
const String enableDotCode = '[DOD';
const String enableMaxicode = '[BCE';
const String enableMicroPDF417 = '[BCG';
const String enableMicroQRCode = '[D2U';
const String enablePDF417 = '[BCF';
const String enableQRCode = '[BCD';

/// Commands for enabling postal symbologies
const String enableAustralianPostal = '[D6M';
const String enableChinesePostMatrix2of5 = 'JS';
const String enableIntelligentMailBarcode = '[D5F';
const String enableJapanesePostal = '[D5P';
const String enableKoreanPostalAuthority = 'WH';
const String enableMailmark4StatePostal = '[DGT';
const String enableNetherlandsKIXCode = '[D5K';
const String enablePlanet = '[DG3';
const String enablePostnet = '[D6A';
const String enableUKPostal = '[DG8';

/// Commands for configuring code-specific settings.
const String twoOfFiveAndSCodeCheckCd = 'G1';
const String twoOfFiveAndSCodeDoNotCheckCd = 'G0';

const String twoOfFiveAndSCodeTransmitCd = 'E0';
const String twoOfFiveAndSCodeDoNotTransmitCd = 'E1';

const String twoOfFiveAndSCodeEnableSpaceCheckIndustrial2of5 = 'GJ';
const String twoOfFiveAndSCodeDisableSpaceCheckIndustrial2of5 = 'GK';

const String twoOfFiveAndSCodeDoNotTransmitAsInterleaved2of5 = 'GH';
const String twoOfFiveAndSCodeTransmitAsInterleaved2of5 = 'GG';

const String twoOfFiveAndSCodeMinimumLengthOneChar = 'GE';
const String twoOfFiveAndSCodeMinimumLengthThreeChars = 'GF';
const String twoOfFiveAndSCodeMinimumLengthFiveChars = 'GI';

const String codabarNormal = 'HA';
const String codabarABCCodeOnly = 'H4';
const String codabarCXCodeOnly = 'H5';
const String codabarABCAndCX = 'H3';

const String codabarCheckCd = 'H6';
const String codabarDoNotCheckCd = 'H7';

const String codabarTransmitCd = 'H8';
const String codabarDoNotTransmitCd = 'H9';

const String codabarDoNotTransmitStSp = 'F0';
const String codabarStSpABCDABCD = 'F3';
const String codabarStSpAbcdabcd = 'F4';
const String codabarStSpABCDTNE = 'F1';
const String codabarStSpAbcdTne = 'F2';
const String codabarStSpDC1DC2DC3DC4 = 'HJ';

const String codabarDisableSpaceInsertion = 'HE';
const String codabarEnableSpaceInsertion = 'HD';

const String codabarEnableIntercharacterGapCheck = 'HH';
const String codabarDisableIntercharacterGapCheck = 'HI';

const String codabarMinimumLengthOneChar = 'HC';
const String codabarMinimumLengthThreeChars = 'HB';
const String codabarMinimumLengthFiveChars = 'HF';

const String code11DoNotCheckCd = '[BLF';
const String code11Check1Cd = '[BLG';
const String code11Check2Cds = '[BLH';
const String code11Check1Or2Cds = '[BLI';

const String code11DoNotTransmitCd = '[BLJ';
const String code11TransmitCd = '[BLK';

const String normalCode39 = 'D5';
const String fullASCIICode39 = 'D4';
const String fullASCIICode39IfPossible = '+K';
const String itPharmaceuticalOnly = 'D6';
const String itPharmaceuticalIfPossible = 'D7';

const String code39CheckCd = 'C0';
const String code39DoNotCheckCd = 'C1';

const String code39TransmitCd = 'D9';
const String code39DoNotTransmitCd = 'D8';

const String code39TransmitStSp = 'D0';
const String code39DoNotTransmitStSp = 'D1';

const String code39DoNotTransmitLeadingAForItPharm = 'DA';
const String code39TransmitLeadingAForItPharm = 'DB';

const String code39MinLength3Digits = '8D';
const String code39MinLength1Digit = '8E';

const String code39EnableConcatenation = '+L';
const String code39DisableConcatenation = '+M';

const String code93DoNotCheckCd = '9Q';
const String code93CheckCd = 'AC';

const String code93DoNotTransmitCd = 'DZ';
const String code93TransmitCd = 'DY';

const String code93EnableConcatenation = '+V';
const String code93DisableConcatenation = '+W';

const String code128DisableGS1_128 = 'OF';
const String code128EnableGS1_128Only = 'JF';
const String code128EnableGS1_128IfPossible = 'OG';

const String code128DisableGS1_128Conversion = '[X/0';
const String code128EnableGS1_128ConversionMode1 = '[X/1';
const String code128EnableGS1_128ConversionMode2 = '[X/2';
const String code128EnableGS1_128ConversionMode3 = '[X/3';
const String code128EnableGS1_128ConversionMode4 = '[X/4';

const String code128DisableLeadingC1Output = '[X/Q';
const String code128EnableLeadingC1Output = '[X/R';

const String code128DisableConcatenation = 'MP';
const String code128EnableConcatenation = 'MO';

const String compositeOutput1dAnd2dComponent = '[BL2';
const String compositeOutput2dComponent = '[BL1';
const String compositeOutput1dComponent = '[BL0';

const String compositeDoNotIgnoreLinkFlag = 'RQ';
const String compositeIgnoreLinkFlag = 'RP';

const String disableCompositeGs1 = '[BHF';
const String enableCompositeGs1 = '[BHE';

const String disableCompositeEanUpc = '[D1W';
const String enableCompositeEanUpc = '[D1V';

const String ean8TransmitCd = '6I';
const String ean8DoNotTransmitCd = '6H';

const String ean13TransmitCd = '6K';
const String ean13DoNotTransmitCd = '6J';

const String eanDisableISSNTranslation = 'HN';
const String eanEnableISSNTranslation = 'HO';
const String eanEnableISSNIfPossible = '4V';

const String eanDisableISMNTranslation = 'IO';
const String eanEnableISMNTranslation = 'IP';
const String eanEnableISMNIfPossible = 'IQ';

const String eanDisableISBNTranslation = 'IB';
const String eanEnableISBNTranslation = 'IA';
const String eanEnableISBNIfPossible = 'IK';

const String eanEnableForcedAddon378_379_529 = '-G';
const String eanDisableForcedAddon378_379_529 = '-H';

const String eanEnableForcedAddon434_439_414_419_977_978 = '-C';
const String eanDisableForcedAddon434_439_414_419_977_978 = '-D';

const String gs1DataBarTransmitCd = 'DL';
const String gs1DataBarDoNotTransmitCd = 'DM';

const String gs1DataBarTransmitAI = 'DS';
const String gs1DataBarDoNotTransmitAI = 'DT';

const String iataDoNotCheckCd = '4H';
const String iataCheckFCAndSNOnly = '4I';
const String iataCheckCPNFCAndSN = '4J';
const String iataCheckCPNACFCAndSN = '4K';

const String iataTransmitCd = '4L';
const String iataDoNotTransmitCd = '4M';

const String koreanPostalTransmitCd = '*+';
const String koreanPostalDoNotTransmitCd = '*-';

const String koreanPostalTransmitDash = '*.';
const String koreanPostalDoNotTransmitDash = '*/';

const String koreanPostalOrientationNormal = '*A';
const String koreanPostalOrientationUpsideDown = '*B';

const String koreanPostalUpsideDownReadingDisabled = '*8';
const String koreanPostalUpsideDownReadingEnabled = '*9';

const String msiPlesseyDoNotCheckCd = '4A';
const String msiPlesseyCheck1CdMod10 = '4B';
const String msiPlesseyCheck2CdsMod10Mod10 = '4C';
const String msiPlesseyCheck2CdsMod10Mod11 = '4D';
const String msiPlesseyCheck2CdsMod11Mod10 = '4R';
const String msiPlesseyCheck2CdsMod11Mod11 = '4S';

const String msiPlesseyTransmitCd1 = '4E';
const String msiPlesseyTransmitCd1AndCd2 = '4F';
const String msiPlesseyDoNotTransmitCd = '4G';

const String telepenNumericMode = 'D2';
const String telepenASCIIMode = 'D3';

const String ukPlesseyTransmitCds = '4N';
const String ukPlesseyDoNotTransmitCds = '4O';

const String ukPlesseyDisableSpaceInsertion = 'DO';
const String ukPlesseyEnableSpaceInsertion = 'DN';

const String ukPlesseyDisableAtoXConversion = 'DP';
const String ukPlesseyEnableAtoXConversion = 'DQ';

const String upcANoLeadingZeroTransmitCd = 'E3';
const String upcANoLeadingZeroDoNotTransmitCd = 'E5';
const String upcALeadingZeroTransmitCd = 'E2';
const String upcALeadingZeroDoNotTransmitCd = 'E4';

const String upcENoLeadingZeroTransmitCd = 'E7';
const String upcENoLeadingZeroDoNotTransmitCd = 'E9';
const String upcELeadingZeroTransmitCd = 'E6';
const String upcELeadingZeroDoNotTransmitCd = 'E8';

const String upcETransmitAsIs = '6Q';
const String upcETransmitAsUPCA = '6P';

/// Commands for configuring read settings.
const String singleRead = 'S0';
const String multipleRead = 'S1';
const String continuousRead = 'S2';

const String readTime0Seconds = 'Y0';
const String readTime1Second = 'Y1';
const String readTime2Seconds = 'Y2';
const String readTime3Seconds = 'Y3';
const String readTime4Seconds = 'Y4';
const String readTime5Seconds = 'Y5';
const String readTime6Seconds = 'Y6';
const String readTime7Seconds = 'Y7';
const String readTime8Seconds = 'Y8';
const String readTime9Seconds = 'Y9';
const String readTimeIndefinitely = 'YM';

const String positiveBarcodes = 'V2';
const String negativeBarcodes = 'V3';
const String positiveAndNegativeBarcodes = 'V4';

const String enableFloodlight = '[D39';
const String disableFloodlight = '[D3A';
const String alternatingFloodlight = '[D3B';
const String preventSpecularReflection = '[D3Q';

const String aimingEnabled = '[D3D';
const String aimingDisabled = '[D3E';

const String triggerRepeatEnabled = '/M';
const String triggerRepeatDisabled = '/K';

const String enableTrigger = 'S8';
const String disableTrigger = 'S7';

const String deleteKeyEnabled = ']DELE';
const String deleteKeyDisabled = ']DELD';

/// Commands for indicator settings.
const String nonPersistentSetBuzzer = '[BQX';
const String persistentSetBuzzer = '[BQY';

const String nonPersistentSetLED = '[BMB';
const String persistentSetLED = '[BMC';

const String buzzerDisabled = 'W0';
const String buzzerEnabled = 'W8';

const String singleToneBuzzer = 'W1';
const String highLowBuzzer = 'W2';
const String lowHighBuzzer = 'W3';

const String buzzerDuration50ms = 'W7';
const String buzzerDuration75ms = '[EFW';
const String buzzerDuration100ms = 'W4';
const String buzzerDuration200ms = 'W5';
const String buzzerDuration400ms = 'W6';

const String buzzerLoudnessMinimum = 'T3';
const String buzzerLoudnessNormal = 'T2';
const String buzzerLoudnessLoud = 'T1';
const String buzzerLoudnessMaximum = 'T0';

const String buzzerOnKeyclickOn = 'WK';
const String buzzerOnKeyclickOff = 'WL';

const String vibratorEnabled = '[EBI';
const String vibratorDisabled = '[EBH';

const String vibratorDuration50ms = '[EBJ';
const String vibratorDuration100ms = '[EBK';

const String enableVibratonOnButtonPress = 'BO';
const String disableVibratonOnButtonPress = 'BP';

const String batteryChargingIndicatorEnabled = '7G';
const String batteryChargingIndicatorDisabled = '8Z';

const String getBatteryPercentage = ']BATT';

const String goodReadBuzzer = 'B';
const String goodReadLed = 'L';
const String workVibration = 'V';

const String badReadBuzzer = 'E';
const String badReadLed = 'N';

const String read1TimeRedundancy0 = 'X0';
const String read2timesRedundancy1 = 'X1';
const String read3timesRedundancy2 = 'X2';
const String read4timesRedundancy3 = 'X3';
const String read5timesRedundancy4 = 'BS';
const String read6timesRedundancy5 = 'BT';
const String read7timesRedundancy6 = 'BU';
const String read8timesRedundancy7 = 'BV';
const String read9timesRedundancy8 = 'BW';

const String goodReadLedDurationDisabled = 'T4';
const String goodReadLedDuration10ms = '[XT9';
const String goodReadLedDuration60ms = '[XTH';
const String goodReadLedDuration100ms = '[XT8';
const String goodReadLedDuration200ms = 'T5';
const String goodReadLedDuration400ms = 'T6';
const String goodReadLedDuration500ms = '[XTI';
const String goodReadLedDuration800ms = 'T7';
const String goodReadLedDuration2000ms = '[XTJ';

/// Commands for configuring formatting settings.
const String preamble = 'MZ';
const String postamble = 'PS';

/// Prefix codes for symbologies.
const String prefixAllCodes = 'RY';
const String upcAPrefix = 'N1';
const String upcAAddOnPrefix = 'M0';
const String upcEPrefix = 'N2';
const String upcEAddOnPrefix = 'M1';
const String ean13Prefix = 'N3';
const String ean13AddOnPrefix = 'M2';
const String ean8Prefix = 'N4';
const String ean8AddOnPrefix = 'M3';
const String code39Prefix = 'M4';
const String codabarPrefix = 'M5';
const String industrial2of5Prefix = 'M6';
const String interleaved2of5Prefix = 'M7';
const String sCodePrefix = 'MB';
const String matrix2of5Prefix = 'GL';
const String iataPrefix = 'I8';
const String code93Prefix = 'M8';
const String code128Prefix = 'M9';
const String gs1128Prefix = '[XMX';
const String msiPlesseyPrefix = '[MSI';
const String telepenPrefix = 'L8';
const String ukPlesseyPrefix = 'MA';
const String dataMatrixPrefix = 'MD';
const String qrCodePrefix = 'MK';
const String maxiCodePrefix = 'ML';
const String pdf417Prefix = 'OC';
const String microPDF417Prefix = 'OD';
const String aztecPrefix = '[BFQ';
const String code11Prefix = '[BLD';
const String triOpticPrefix = 'MC';
const String koreanPostalAuthorityPrefix = '*\$';
const String dotCodePrefix = '[DOF';
const String intelligentMailPrefix = '[D5I';
const String postNetPrefix = '[D6D';
const String planetPrefix = '[DG5';
const String japanesePostalPrefix = '[DSS';
const String netherlandsKIXPrefix = '[DSN';
const String ukPostalPrefix = '[DGA';
const String australianPostalPrefix = '[D6P';
const String mailMark4StatePostalPrefix = '[D6Q';
const String gs1DatabarOmnidirectionalPrefix = '[D6G';
const String gs1DatabarLimitedPrefix = '[D5Q';
const String gs1DatabarExpandedPrefix = '[D6I';
const String gs1CompositeCodePrefix = 'RR';
const String codablockFPrefix = '[D4S';
const String chineseSensibleCodePrefix = '[D4N';
const String machineReadablePassportsPrefix = '[DJJ';
const String machineReadableVisaAPrefix = '[DJK';
const String machineReadableVisaBPrefix = '[DJI';
const String officialTravelDocuments1Prefix = '[DJM';
const String officialTravelDocuments2Prefix = '[DJN';
const String isbnPrefix = '[DJO';
const String japaneseBookPricePrefix = '[DJY';
const String japaneseDriverLicensePrefix = '[DJX';
const String japanesePrivateNumberPrefix = '[DKR';
const String clearPrefixes = 'MG';

/// Suffix codes for symbologies.
const String suffixAllCodes = 'RZ';
const String upcASuffix = 'N6';
const String upcAAddOnSuffix = 'O0';
const String upcESuffix = 'N7';
const String upcEAddOnSuffix = 'O1';
const String ean13Suffix = 'N8';
const String ean13AddOnSuffix = 'O2';
const String ean8Suffix = 'N9';
const String ean8AddOnSuffix = 'O3';
const String code39Suffix = 'O4';
const String codabarSuffix = 'O5';
const String industrial2of5Suffix = 'O6';
const String interleaved2of5Suffix = 'O7';
const String sCodeSuffix = 'OB';
const String matrix2of5Suffix = 'GM';
const String iataSuffix = 'I9';
const String code93Suffix = 'O8';
const String code128Suffix = 'O9';
const String gs1128Suffix = '[XOX';
const String msiPlesseySuffix = 'N5';
const String telepenSuffix = 'L9';
const String ukPlesseySuffix = 'OA';
const String dataMatrixSuffix = 'PO';
const String qrCodeSuffix = 'PW';
const String maxiCodeSuffix = 'PX';
const String pdf417Suffix = 'PY';
const String gs1DatabarSuffix = 'PQ';
const String microPDF417Suffix = 'PZ';
const String aztecSuffix = '[BF1';
const String code11Suffix = '[BLE';
const String triOpticSuffix = 'PN';
const String koreanPostalAuthoritySuffix = '*%';
const String dotCodeSuffix = '[DOG';
const String intelligentMailSuffix = '[D5J';
const String postNetSuffix = '[D6E';
const String planetSuffix = '[D6G';
const String japanesePostalSuffix = '[D5T';
const String netherlandsKIXSuffix = '[D5O';
const String ukPostalSuffix = '[DBG';
const String australianPostalSuffix = '[D6Q';
const String mailMark4StatePostalSuffix = '[DGW';
const String gs1DatabarOmnidirectionalSuffix = '[D6J';
const String gs1DatabarLimitedSuffix = '[D6K';
const String gs1DatabarExpandedSuffix = '[D6L';
const String gs1CompositeCodeSuffix = 'RS';
const String codablockFSuffix = '[D4T';
const String chineseSensibleCodeSuffix = '[D4O';
const String machineReadablePassportsSuffix = '[DJP';
const String machineReadableVisaASuffix = '[DJQ';
const String machineReadableVisaBSuffix = '[DJR';
const String officialTravelDocuments1Suffix = '[DJS';
const String officialTravelDocuments2Suffix = '[DJT';
const String isbnSuffix = '[DJU';
const String japaneseBookPriceSuffix = '[DJZ';
const String japaneseDriverLicenseSuffix = '[DKS';
const String japanesePrivateNumberSuffix = '[DKT';
const String clearSuffixes = 'PR';

const String aimCodeIdentification = '\$1';
const String codeIdentification = '\$2';
const String codeLength = '\$6';

const String directInputKey0 = 'Q0';
const String directInputKey1 = 'Q1';
const String directInputKey2 = 'Q2';
const String directInputKey3 = 'Q3';
const String directInputKey4 = 'Q4';
const String directInputKey5 = 'Q5';
const String directInputKey6 = 'Q6';
const String directInputKey7 = 'Q7';
const String directInputKey8 = 'Q8';
const String directInputKey9 = 'Q9';

const String directInputKeyM = '0M';
const String directInputKeyN = '0N';

/// Commands for configuring communication settings.
const String bluetoothLowEnergyDefault = ']EBLE';
const String usbCDCOptiConnectDefault = '[BQO';
const String enableAckNack = 'WC';
const String transmitSoftwareVersion = 'Z1';
const String saveSettings = 'Z2';

const String transmitDeviceInformation = '[EFK';

const String fetchSettings = '[BPT';

const String setDownloadMode = '[XLT';

const String setBluetoothName = ']BLNS';
const String endSetBluetoothName = ']BLNE';

const String barcodeValidationDisabled = 'P0';
const String barcodeValidationDefault = 'P3';
const String barcodeValidationNoResponseIsGoodRead = 'P4';

const String enableMemorizing = ']DTME';
const String disableMemorizing = ']DTMD';

const String barcodeValidationGoodRead = '[ACK';
const String barcodeValidationBadRead = '[DC2';
const String barcodeValidationNoResponse = '[DC1';
const String barcodeValidationResend = '[NAK';

const String setConnectionPoolId = '[BBP';
const String simpleSoundResponseCommand = '[BQS';

const String dataWizardCommandPrefix0 = 'A0';
const String dataWizardCommandPrefix1 = 'A1';

const String dataWizardConfiguration0 = '[A00';
const String dataWizardConfiguration1 = '[A01';
const String dataWizardConfiguration2 = '[A02';
const String dataWizardConfiguration3 = '[A03';
const String dataWizardConfiguration4 = '[A04';
const String dataWizardConfiguration5 = '[A05';
const String dataWizardConfiguration6 = '[A06';
const String dataWizardConfiguration7 = '[A07';

const String dataWizardEnableConfiguration0 = '[A0A';
const String dataWizardEnableConfiguration1 = '[A0B';
const String dataWizardEnableConfiguration2 = '[A0C';
const String dataWizardEnableConfiguration3 = '[A0D';
const String dataWizardEnableConfiguration4 = '[A0E';
const String dataWizardEnableConfiguration5 = '[A0F';
const String dataWizardEnableConfiguration6 = '[A0G';
const String dataWizardEnableConfiguration7 = '[A0H';

const String dataWizardDisableConfiguration0 = '[A0K';
const String dataWizardDisableConfiguration1 = '[A0L';
const String dataWizardDisableConfiguration2 = '[A0M';
const String dataWizardDisableConfiguration3 = '[A0N';
const String dataWizardDisableConfiguration4 = '[A0O';
const String dataWizardDisableConfiguration5 = '[A0P';
const String dataWizardDisableConfiguration6 = '[A0Q';
const String dataWizardDisableConfiguration7 = '[A0R';

const String dataWizardEnableUnprocessedBeep = '[A0+';
const String dataWizardDisableUnprocessedBeep = '[A0-';

const String dataWizardReset = '[A0\$';
const String dataWizardTransmitConfigurationSettings = '[A0/';

const String dataWizardTransmitAllBarcodes = '[A0U';
const String dataWizardTransmitValidatedBarcodes = '[A0V';
