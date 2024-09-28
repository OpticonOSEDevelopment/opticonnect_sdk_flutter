/// This class holds detailed information about a scanned barcode, including:
/// - The processed barcode data ([data]), which may have undergone transformations
///   based on scanner settings (e.g., preamble, prefix, suffix, postamble).
/// - The raw byte representation ([dataBytes]) of the processed barcode data.
/// - The quantity of the scanned item ([quantity]), which can be negative to indicate removal.
/// - Information about the barcode symbology ([symbology] and [symbologyId]).
/// - The time of the scan ([timeOfScan]).
/// - The ID of the scanning device ([deviceId]).
class BarcodeData {
  /// The processed barcode data retrieved from the scan.
  ///
  /// The barcode data may have undergone transformations or additions such as preamble,
  /// prefix, suffix, or postamble based on scanner settings. Therefore, this is not necessarily
  /// the raw data directly from the barcode, but rather the processed output.
  ///
  /// This data is decoded from the raw bytes using UTF-8 encoding.
  final String data;

  /// The byte representation of the processed barcode data retrieved from the scan.
  ///
  /// Like the `data` field, this data may have undergone transformations or additions
  /// such as preamble, prefix, suffix, or postamble based on scanner settings. This field
  /// provides the byte-level representation (e.g., UTF-8 or Unicode) of the processed data.
  final List<int> dataBytes;

  /// The quantity of the scanned item.
  ///
  /// This represents the number of items scanned. With the delete key we can scan a product with a quantity of -1, which signifies the removal of a
  /// scanned item.
  final int quantity;

  /// The ID of the barcode symbology used for the scan.
  ///
  /// This is a numeric identifier for the barcode symbology (e.g., Code 39, QR Code),
  /// allowing applications to identify the type of barcode scanned.
  final int symbologyId;

  /// The name of the barcode symbology used for the scan.
  ///
  /// This is a human-readable description of the symbology (e.g., "Code 39", "QR Code")
  /// that was used to encode the barcode.
  final String symbology;

  /// The time the barcode was scanned.
  ///
  /// This timestamp indicates when the scan occurred and can be useful for logging
  /// or real-time tracking of scans.
  final String timeOfScan;

  /// The device ID of the scanner that scanned the barcode.
  final String deviceId;

  /// Constructs a [BarcodeData] object containing the processed barcode data and other details.
  ///
  /// - [data]: The processed barcode data.
  /// - [quantity]: The quantity of the scanned item. Can be negative to indicate removal.
  /// - [symbologyId]: The numeric ID of the symbology used for the scan.
  /// - [symbology]: The human-readable name of the symbology.
  /// - [timeOfScan]: The timestamp when the scan occurred.
  BarcodeData({
    required this.data,
    required this.dataBytes,
    required this.quantity,
    required this.symbologyId,
    required this.symbology,
    required this.timeOfScan,
    required this.deviceId,
  });
}
