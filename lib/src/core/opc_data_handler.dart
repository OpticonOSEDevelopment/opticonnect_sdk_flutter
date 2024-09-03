import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:mutex/mutex.dart';
import 'package:opticonnect_sdk/entities/barcode_data.dart';
import 'package:opticonnect_sdk/src/constants/data_hex_constants.dart';
import 'package:opticonnect_sdk/src/injection/injection.config.dart';
import 'package:opticonnect_sdk/src/services/crc_16_handler.dart';
import 'package:opticonnect_sdk/src/services/symbology_handler.dart';

enum OpcRxState {
  isIdle,
  receivingType,
  receivingData,
  receivingCrcHigh,
  receivingCrcLow,
}

class OpcDataHandler {
  final _mutex = Mutex();

  final StreamController<String> _commandDataController =
      StreamController<String>.broadcast();
  final StreamController<BarcodeData> _barcodeDataController =
      StreamController<BarcodeData>.broadcast();

  Stream<String> get commandDataStream => _commandDataController.stream;
  Stream<BarcodeData> get barcodeDataStream => _barcodeDataController.stream;

  final int _barcodeType =
      0x82; // 0x82: Barcode data with header = <2 byte SEQ-nr><Code-id><2 byte Quantity><3 byte RFU>
  final int _barcodeWithTimeType =
      0xA2; // 0xA2: Barcode data with header = <2 byte SEQ-nr><Code-id><2 byte Quantity><4 byte timestamp><7 byte RFU>
  final int _menuCommandRspType =
      0x64; // 0x64: Nenu command response = <2 byte SEQ-nr><1 byte packet seq. nr><1 byte RFU>

  final int _codeIdByteIndex = 2;
  final int _quantityHighByteIndex = 3;
  final int _quantityLowByteIndex = 4;
  final int _timeStampByteIndex = 5;

  OpcRxState _state = OpcRxState.isIdle;
  bool _opcDleFlag = false;
  int _opcCrc = 0;
  int _opcRxCrc = 0;
  int _type = 0;
  int _headerLen = 0;
  int _dataOffset = 0;
  final List<int> _headerBytes = [];
  final List<int> _dataBytes = [];

  int _previousSeqNr = -1;

  final _crc16Handler = getIt<CRC16Handler>();
  final _symbologyHandler = getIt<SymbologyHandler>();
  final _opcDleStxCrc = 0x4e72;

  int _extractSequenceNumber(List<int> headerBytes) {
    if (headerBytes.length < 2) {
      throw Exception('Header too short to contain a sequence number');
    }
    return (headerBytes[0] << 8) | headerBytes[1];
  }

  Future<String> processData(
    List<int> data, {
    bool shouldReturnResult = false,
  }) async {
    String result = '';
    await _mutex.protect(() async {
      for (int i = 0; i < data.length; i++) {
        final ch = data[i];
        switch (_state) {
          case OpcRxState.isIdle:
            if (ch == dleV) {
              _opcDleFlag ^= true;
              break;
            }

            if (_opcDleFlag) {
              _opcDleFlag = false;

              if (ch == stxV) {
                _state = OpcRxState.receivingType;
                _opcCrc = _opcDleStxCrc;
              }
            }
            break;
          case OpcRxState.receivingType:
            if (ch == dleV) {
              _opcDleFlag = true;
              _state = OpcRxState.isIdle;
              break;
            }
            _type = ch;
            _headerLen =
                ((_type >> 5) != 0) ? pow(2, (_type >> 5) - 1).toInt() : 0;
            _state = OpcRxState.receivingData;
            _dataOffset = 0;
            _headerBytes.clear();
            _dataBytes.clear();
            _opcCrc = _crc16Handler.update(ch, _opcCrc);
            break;
          case OpcRxState.receivingData:
            _opcCrc = _crc16Handler.update(ch, _opcCrc);
            if (ch == dleV) {
              if (!_opcDleFlag) {
                _opcDleFlag = true;
                break;
              }
              _opcDleFlag = false;
            } else {
              if (_opcDleFlag) {
                _opcDleFlag = false;
                switch (ch) {
                  case stxV:
                    _state = OpcRxState.receivingType;
                    _opcCrc = _opcDleStxCrc;
                    break;
                  case etxV:
                    _state = OpcRxState.receivingCrcHigh;
                    break;
                  default:
                    _state = OpcRxState.isIdle;
                    break;
                }
                break;
              }
            }

            if (_dataOffset < _headerLen) {
              _headerBytes.add(ch);
            } else {
              _dataBytes.add(ch);
            }

            _dataOffset++;
            break;
          case OpcRxState.receivingCrcHigh:
            _opcRxCrc = ch << 8;
            _state = OpcRxState.receivingCrcLow;
            break;
          case OpcRxState.receivingCrcLow:
            _opcRxCrc |= ch;
            _state = OpcRxState.isIdle;
            if (_opcRxCrc != _opcCrc && _opcRxCrc != 0) {
              _opcDleFlag = (ch == dleV);
            } else {
              final dataString = utf8.decode(_dataBytes, allowMalformed: true);
              if (shouldReturnResult) {
                result = dataString;
                return;
              } else if (_type == _barcodeType ||
                  _type == _barcodeWithTimeType) {
                try {
                  final sequenceNumber = _extractSequenceNumber(_headerBytes);
                  if (sequenceNumber == _previousSeqNr) {
                    return;
                  }
                  _previousSeqNr = sequenceNumber;
                } catch (e) {
                  print('Error extracting sequence number');
                }
                _postProcessAndSendBarcodeData(dataString, _dataBytes);
              } else if (_type == _menuCommandRspType) {
                _commandDataController.sink.add(dataString);
              }
            }
            break;
        }
      }
    });
    return result;
  }

  int _parseHexBytesToInteger(
    int hexMostSignificant,
    int hexLeastSignificant,
  ) {
    final result = (hexMostSignificant << 8) | hexLeastSignificant;
    if ((result & 0x8000) != 0) {
      return -((result ^ 0xFFFF) + 1);
    } else {
      return result;
    }
  }

  DateTime _timeStampToDateTime(List<int> timestamp, int offset) {
    int data = 0;
    int temp;

    temp = timestamp[offset];
    data |= temp << 24;
    temp = timestamp[offset + 1];
    data |= temp << 16;
    temp = timestamp[offset + 2];
    data |= temp << 8;
    temp = timestamp[offset + 3];
    data |= temp;

    return DateTime(
      2000 + (data & 0x3F), // Assuming year range from 2000 to 2063
      (data >> 6) & 0x0F, // Month
      (data >> 10) & 0x1F, // Day
      (data >> 15) & 0x1F, // Hour
      (data >> 20) & 0x3F, // Minute
      (data >> 26) & 0x3F, // Second
    );
  }

  int _getSymbologyId(int codeId) {
    return _symbologyHandler.getSymbologyIdByCodeId(
      codeId,
    );
  }

  void _postProcessAndSendBarcodeData(String data, List<int> dataBytes) {
    int quantity = 1;
    int symbologyId = 0;
    DateTime timeOfScan = DateTime.now();
    String symbology = "";

    try {
      quantity = _parseHexBytesToInteger(
        _headerBytes[_quantityHighByteIndex],
        _headerBytes[_quantityLowByteIndex],
      );
    } catch (e) {
      print('Error parsing quantity $e');
    }

    if (_headerBytes.length > 8) {
      timeOfScan = _timeStampToDateTime(_headerBytes, _timeStampByteIndex);
    }

    try {
      symbologyId = _getSymbologyId(_headerBytes[_codeIdByteIndex]);
      symbology = _symbologyHandler.getSymbologyNameById(symbologyId);
    } catch (e) {
      print('Error parsing symbology id $e');
    }

    final barcodeData = BarcodeData(
      data: data,
      quantity: quantity,
      symbologyId: symbologyId,
      symbology: symbology,
      timeOfScan: timeOfScan.toUtc().toIso8601String(),
    );

    _barcodeDataController.sink.add(barcodeData);
  }

  void dispose() {
    _commandDataController.close();
    _barcodeDataController.close();
  }
}
