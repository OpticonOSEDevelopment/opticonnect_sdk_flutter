abstract class BleDataWriter {
  Future<void> writeData(String deviceId, String data, List<int> dataBytes);
}
