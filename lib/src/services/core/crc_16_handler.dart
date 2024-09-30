import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/src/services/ble_services/streams/data/constants/crc_16_ccittrev_table.dart';

@lazySingleton
class CRC16Handler {
  int update(int data, int crc) {
    int chksum = crc;
    chksum = ~chksum & 0xFFFF;
    chksum = (chksum >> 8) ^ ccittrevTable[(chksum & 0xFF) ^ data];
    chksum = ~chksum & 0xFFFF;
    return chksum;
  }

  int compute(List<int> pData, [int? pCrc]) {
    final int crc = pCrc ?? 0xFFFF;
    int chksum = crc;
    for (int i = 0; i < pData.length; i++) {
      chksum = (chksum >> 8) ^ ccittrevTable[(chksum & 0xFF) ^ pData[i]];
    }
    return ~chksum & 0xFFFF;
  }
}
