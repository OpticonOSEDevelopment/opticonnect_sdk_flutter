part of 'package:opticonnect_sdk/enums.dart';

/// Enum representing the various modes available for Code 39 symbology.
enum Code39Mode {
  /// Normal mode for Code 39 symbology.
  normal,

  /// Full ASCII mode for Code 39 symbology.
  fullASCII,

  /// Full ASCII mode if possible for Code 39 symbology.
  fullASCIIIfPossible,

  /// IT pharmaceutical only mode for Code 39 symbology.
  itPharmaceuticalOnly,

  /// IT pharmaceutical if possible mode for Code 39 symbology.
  itPharmaceutialIfPossible,
}
