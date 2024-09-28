import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/src/constants/data_hex_constants.dart';
import 'package:opticonnect_sdk/src/entities/command.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/interfaces/command_bytes_provider.dart';
import 'package:opticonnect_sdk/src/services/core/crc_16_handler.dart';

@LazySingleton(as: CommandBytesProvider)
class OpcCommandProtocolHandler implements CommandBytesProvider {
  final CRC16Handler _crc16Handler;
  final AppLogger _appLogger;

  OpcCommandProtocolHandler(this._crc16Handler, this._appLogger);

  int _seqNr = 0;

  void _incrementSeqNr() {
    // Increment and wrap sequence number within 16-bit limit
    _seqNr = (_seqNr + 1) % (1 << 16);
  }

  @override
  List<int> getCommandBytes(Command command) {
    try {
      const int menuCommandType = 0x43; //0x43: Menu command with seq.nr
      final commandData = command.data;
      final List<int> commandBytes = [];

      _addCommandStartBytes(commandBytes, menuCommandType, _seqNr);
      for (int i = 0; i < commandData.length; i++) {
        final int charByte = commandData.codeUnitAt(i);
        _addByteWithEscape(commandBytes, charByte);
      }
      _addCommandEndBytes(commandBytes);
      return _finalizeCommandBytes(commandBytes);
    } catch (e) {
      _appLogger.error('Error generating command bytes: $e');
      rethrow;
    }
  }

  List<int> _finalizeCommandBytes(List<int> commandBytes) {
    _incrementSeqNr();
    return commandBytes;
  }

  List<int> _intToTwoByteList(int value) {
    final int highByte = value >> 8;
    final int lowByte = value & 0xFF;
    return [highByte, lowByte];
  }

  void _addCommandStartBytes(List<int> commandBytes, int type, int seqNr) {
    commandBytes.add(dleV);
    commandBytes.add(stxV);
    commandBytes.add(type);
    final seqNrBytes = _intToTwoByteList(seqNr);
    for (final byte in seqNrBytes) {
      _addByteWithEscape(commandBytes, byte);
    }
  }

  void _addCommandEndBytes(List<int> commandBytes) {
    commandBytes.add(dleV);
    commandBytes.add(etxV);
    final crc = _crc16Handler.compute(commandBytes);
    commandBytes.addAll(_intToTwoByteList(crc));
  }

  void _addByteWithEscape(List<int> commandBytes, int byte) {
    if (byte == dleV) {
      commandBytes.add(byte);
    }
    commandBytes.add(byte);
  }
}
