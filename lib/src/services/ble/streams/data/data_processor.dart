import 'dart:async';

import 'package:flutter_blue_plus_windows/flutter_blue_plus_windows.dart';
import 'package:opticonnect_sdk/entities.dart';
import 'package:opticonnect_sdk/src/injection/injection.config.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/services/ble/streams/data/opc_data_handler.dart';

class DataProcessor {
  final BluetoothCharacteristic readCharacteristic;
  final BluetoothCharacteristic writeCharacteristic;
  final OpcDataHandler _opcDataHandler;
  final String deviceId;
  final _appLogger = getIt<AppLogger>();

  final StreamController<String> _commandStreamController =
      StreamController<String>.broadcast();
  final StreamController<BarcodeData> _barcodeDataStreamController =
      StreamController<BarcodeData>.broadcast();

  StreamSubscription<List<int>>? _readCharacteristicSubscription;
  StreamSubscription<String>? _commandSubscription;
  StreamSubscription<BarcodeData>? _barcodeSubscription;

  DataProcessor({
    required this.readCharacteristic,
    required this.writeCharacteristic,
    required this.deviceId,
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
    // Store the subscription for later disposal
    _readCharacteristicSubscription = readCharacteristic.lastValueStream.listen(
      (data) async {
        await _opcDataHandler.processData(data);
      },
      onError: (error) {
        _appLogger.error('Error in readCharacteristic stream: $error');
      },
    );

    // Store the subscriptions for the command and barcode streams
    _commandSubscription = _opcDataHandler.commandDataStream.listen(
      (command) {
        _commandStreamController.add(command);
      },
      onError: (error) {
        _appLogger.error('Error in commandDataStream: $error');
      },
    );

    _barcodeSubscription = _opcDataHandler.barcodeDataStream.listen(
      (barcodeData) {
        _barcodeDataStreamController.add(barcodeData);
      },
      onError: (error) {
        _appLogger.error('Error in barcodeDataStream: $error');
      },
    );
  }

  void dispose() {
    // Cancel subscriptions before closing stream controllers
    _readCharacteristicSubscription?.cancel();
    _commandSubscription?.cancel();
    _barcodeSubscription?.cancel();

    _commandStreamController.close();
    _barcodeDataStreamController.close();
  }
}
