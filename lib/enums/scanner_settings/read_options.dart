/// Enum representing different modes for reading positive and negative barcodes.
enum PositiveAndNegativeBarcodesMode {
  positiveBarcodes,
  negativeBarcodes,
  positiveAndNegativeBarcodes,
}

/// Enum representing different modes for single or multiple reads.
enum ReadMode {
  singleRead,
  multipleRead,
}

/// Enum representing different read times for the scanner.
enum ReadTime {
  zeroSeconds,
  oneSecond,
  twoSeconds,
  threeSeconds,
  fourSeconds,
  fiveSeconds,
  sixSeconds,
  sevenSeconds,
  eightSeconds,
  nineSeconds,
  indefinitely,
}

/// Enum representing different modes for illumination control during scanning.
enum IlluminationMode {
  enableFloodlight,
  disableFloodlight,
  alternatingFloodlight,
  preventSpecularReflection,
}
