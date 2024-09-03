import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/entities/barcode_data.dart';
import 'package:opticonnect_sdk/src/constants/ble_constants.dart';
import 'package:opticonnect_sdk/src/core/data_processor.dart';
import 'package:opticonnect_sdk/src/core/opc_data_handler.dart';

@lazySingleton
class BleDevicesStreamsHandler {
  final Map<String, DataProcessor> _dataProcessors = {};

  Future<Stream<BarcodeData>> getBarcodeDataStream(String deviceId) async {
    final dataProcessor = await _getOrCreateDataProcessor(deviceId);
    return dataProcessor.barcodeDataStream;
  }

  Future<void> writeData(String deviceId, List<int> data) async {
    final dataProcessor = await _getOrCreateDataProcessor(deviceId);
    await dataProcessor.writeData(data);
  }

  Future<DataProcessor> _getOrCreateDataProcessor(String deviceId) async {
    if (_dataProcessors.containsKey(deviceId)) {
      return _dataProcessors[deviceId]!;
    }

    final bleDevice = BluetoothDevice.fromId(deviceId);

    List<BluetoothService> services = await bleDevice.discoverServices();

    BluetoothService? opcService;
    BluetoothCharacteristic? readCharacteristic;
    BluetoothCharacteristic? writeCharacteristic;

    for (final service in services) {
      if (service.uuid.toString() == opcServiceUuid) {
        opcService = service;
        break;
      }
    }

    if (opcService == null) {
      throw Exception('OPC Service not found!');
    }

    for (final characteristic in opcService.characteristics) {
      if (characteristic.properties.read && readCharacteristic == null) {
        readCharacteristic = characteristic;
      } else if (characteristic.properties.write &&
          writeCharacteristic == null) {
        writeCharacteristic = characteristic;
      }

      if (readCharacteristic != null && writeCharacteristic != null) {
        break;
      }
    }

    if (readCharacteristic == null || writeCharacteristic == null) {
      throw Exception('Required characteristics not found!');
    }

    final dataProcessor = DataProcessor(
        readCharacteristic: readCharacteristic,
        writeCharacteristic: writeCharacteristic,
        opcDataHandler: OpcDataHandler());

    await dataProcessor.subscribeToDataStream();

    _dataProcessors[deviceId] = dataProcessor;
    return dataProcessor;
  }

  void removeDataProcessor(String deviceId) {
    _dataProcessors.remove(deviceId);
  }
}
