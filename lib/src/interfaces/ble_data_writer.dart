abstract class BleDataWriter {
  Future<void> writeData(String deviceId, List<int> dataBytes);
}
