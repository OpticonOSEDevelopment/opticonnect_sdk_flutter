abstract class BleCommandResponseReader {
  Future<Stream<String>> getCommandResponseStream(String deviceId);
}
