import 'dart:async';

import 'package:flutter_blue_plus_windows/flutter_blue_plus_windows.dart';
import 'package:opticonnect_sdk/entities/barcode_data.dart';
import 'package:opticonnect_sdk/src/core/opc_data_handler.dart';
import 'package:opticonnect_sdk/src/injection/injection.config.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';

class DataProcessor {
  final BluetoothCharacteristic readCharacteristic;
  final BluetoothCharacteristic writeCharacteristic;
  final OpcDataHandler _opcDataHandler;
  final _appLogger = getIt<AppLogger>();

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
    } catch (e) {
      _appLogger.error('Failed to write data: $e');
      throw Exception('Failed to write data: $e');
    }
  }

  Future<void> subscribeToDataStream() async {
    try {
      await readCharacteristic.setNotifyValue(true);
    } catch (e) {
      _appLogger.error('Failed to subscribe to notifications: $e');
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
