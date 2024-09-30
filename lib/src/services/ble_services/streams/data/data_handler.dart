import 'package:flutter_blue_plus_windows/flutter_blue_plus_windows.dart';
import 'package:injectable/injectable.dart';
import 'package:mutex/mutex.dart';
import 'package:opticonnect_sdk/entities/barcode_data.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/interfaces/ble_command_response_reader.dart';
import 'package:opticonnect_sdk/src/interfaces/ble_data_writer.dart';
import 'package:opticonnect_sdk/src/services/ble_services/streams/data/data_processor.dart';
import 'package:opticonnect_sdk/src/services/ble_services/streams/data/opc_data_handler.dart';

@lazySingleton
class DataHandler implements BleDataWriter, BleCommandResponseReader {
  final AppLogger _appLogger;

  DataHandler(this._appLogger);

  final Map<String, DataProcessor> _dataProcessors = {};
  final Mutex _mutex = Mutex();

  Future<Stream<BarcodeData>> getStream(String deviceId) async {
    final dataProcessor = _getDataProcessor(deviceId);
    return dataProcessor.barcodeDataStream;
  }

  @override
  Future<Stream<String>> getCommandResponseStream(String deviceId) async {
    final dataProcessor = _getDataProcessor(deviceId);
    return dataProcessor.commandStream;
  }

  @override
  Future<void> writeData(
      String deviceId, String data, List<int> dataBytes) async {
    final dataProcessor = _getDataProcessor(deviceId);
    await dataProcessor.writeData(dataBytes);
  }

  DataProcessor _getDataProcessor(String deviceId) {
    if (!_dataProcessors.containsKey(deviceId)) {
      throw Exception('Data processor not found for device: $deviceId');
    }
    return _dataProcessors[deviceId]!;
  }

  Future<DataProcessor> addDataProcessor(
      String deviceId, BluetoothService opcService) async {
    try {
      await _mutex.protect(() async {
        if (opcService.characteristics.length < 2) {
          const msg =
              'OPC service does not have the required read and write characteristics!';
          _appLogger.error(msg);
          throw Exception(msg);
        }

        final readCharacteristic = opcService.characteristics[0];
        final writeCharacteristic = opcService.characteristics[1];

        final dataProcessor = DataProcessor(
            readCharacteristic: readCharacteristic,
            writeCharacteristic: writeCharacteristic,
            opcDataHandler: OpcDataHandler(deviceId),
            deviceId: deviceId);

        await dataProcessor.subscribeToDataStream();

        _dataProcessors[deviceId] = dataProcessor;
      });
      return _dataProcessors[deviceId]!;
    } catch (e) {
      final msg = 'Failed to get or create data processor: $e';
      _appLogger.error(msg);
      throw Exception(msg);
    }
  }

  void removeDataProcessor(String deviceId) {
    _dataProcessors.remove(deviceId);
  }

  void dispose() {
    _dataProcessors.clear();
  }

  void disposeForDevice(String deviceId) {
    if (_dataProcessors.containsKey(deviceId)) {
      _dataProcessors[deviceId]!.dispose();
      _dataProcessors.remove(deviceId);
    }
  }
}
