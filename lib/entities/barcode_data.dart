class BarcodeData {
  final String data;
  final int quantity;
  final int symbologyId;
  final String symbology;
  final String timeOfScan;

  BarcodeData({
    required this.data,
    required this.quantity,
    required this.symbologyId,
    required this.symbology,
    required this.timeOfScan,
  });
}
