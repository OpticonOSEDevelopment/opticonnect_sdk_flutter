import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:opticonnect_sdk/entities/barcode_data.dart';
import 'package:opticonnect_sdk/src/core/opc_data_handler.dart';

class DataProcessor {
  final BluetoothCharacteristic readCharacteristic;
  final BluetoothCharacteristic writeCharacteristic;
  final OpcDataHandler _opcDataHandler;

  final StreamController<String> _commandStreamController =
      StreamController<String>.broadcast();
  final StreamController<BarcodeData> _barcodeDataStreamController =
      StreamController<BarcodeData>.broadcast();

  DataProcessor({
    required this.readCharacteristic,
    required this.writeCharacteristic,
    required OpcDataHandler opcDataHandler,
  }) : _opcDataHandler = opcDataHandler {
    _initializeStreams();
  }

  Stream<String> get commandStream => _commandStreamController.stream;
  Stream<BarcodeData> get barcodeDataStream =>
      _barcodeDataStreamController.stream;

  Future<void> writeData(List<int> data) async {
    try {
      await writeCharacteristic.write(data);
      print('Data written to characteristic');
    } catch (e) {
      print('Failed to write data: $e');
      throw Exception('Failed to write data: $e');
    }
  }

  Future<void> subscribeToDataStream() async {
    try {
      await readCharacteristic.setNotifyValue(true);
      print('Subscribed to notifications from characteristic');
    } catch (e) {
      print('Failed to subscribe to notifications: $e');
      throw Exception('Failed to subscribe to notifications: $e');
    }
  }

  void _initializeStreams() {
    readCharacteristic.lastValueStream.listen((data) async {
      await _opcDataHandler.processData(data);
    });

    _opcDataHandler.commandDataStream.listen((command) {
      _commandStreamController.add(command);
    });

    _opcDataHandler.barcodeDataStream.listen((barcodeData) {
      _barcodeDataStreamController.add(barcodeData);
    });
  }

  void dispose() {
    _commandStreamController.close();
    _barcodeDataStreamController.close();
  }
}
