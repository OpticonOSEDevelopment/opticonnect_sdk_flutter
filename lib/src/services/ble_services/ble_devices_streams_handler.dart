import 'package:flutter_blue_plus_windows/flutter_blue_plus_windows.dart';
import 'package:injectable/injectable.dart';
import 'package:mutex/mutex.dart';
import 'package:opticonnect_sdk/entities/barcode_data.dart';
import 'package:opticonnect_sdk/src/constants/ble_constants.dart';
import 'package:opticonnect_sdk/src/core/data_processor.dart';
import 'package:opticonnect_sdk/src/core/opc_data_handler.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/interfaces/ble_command_response_reader.dart';
import 'package:opticonnect_sdk/src/interfaces/ble_data_writer.dart';
import 'package:opticonnect_sdk/src/services/ble_services/ble_devices_helper.dart';

@lazySingleton
class BleDevicesStreamsHandler
    implements BleDataWriter, BleCommandResponseReader {
  final BleDevicesHelper _bleDevicesHelper;
  final AppLogger _appLogger;

  BleDevicesStreamsHandler(this._bleDevicesHelper, this._appLogger);

  final Map<String, DataProcessor> _dataProcessors = {};
  final Mutex _mutex = Mutex();

  Future<Stream<BarcodeData>> getBarcodeDataStream(String deviceId) async {
    final dataProcessor = await _getOrCreateDataProcessor(deviceId);
    return dataProcessor.barcodeDataStream;
  }

  @override
  Future<Stream<String>> getCommandResponseStream(String deviceId) async {
    final dataProcessor = await _getOrCreateDataProcessor(deviceId);
    return dataProcessor.commandStream;
  }

  @override
  Future<void> writeData(
      String deviceId, String data, List<int> dataBytes) async {
    final dataProcessor = await _getOrCreateDataProcessor(deviceId);
    await dataProcessor.writeData(dataBytes);
  }

  Future<DataProcessor> _getOrCreateDataProcessor(String deviceId) async {
    try {
      await _mutex.protect(() async {
        if (_dataProcessors.containsKey(deviceId)) {
          return _dataProcessors[deviceId]!;
        }

        final bleDevice = _bleDevicesHelper.getDeviceFromId(deviceId);
        List<BluetoothService> services = await bleDevice.discoverServices();

        BluetoothService? opcService;

        for (final service in services) {
          if (service.uuid.str128 == opcServiceUuid) {
            opcService = service;
            break;
          }
        }

        if (opcService == null) {
          throw Exception('OPC Service not found!');
        }

        if (opcService.characteristics.length < 2) {
          throw Exception('OPC service does not have enough characteristics!');
        }

        final readCharacteristic = opcService.characteristics[0];
        final writeCharacteristic = opcService.characteristics[1];

        final dataProcessor = DataProcessor(
            readCharacteristic: readCharacteristic,
            writeCharacteristic: writeCharacteristic,
            opcDataHandler: OpcDataHandler(deviceId),
            deviceId: deviceId);

        _appLogger.error('setting up streams');

        await dataProcessor.subscribeToDataStream();

        _dataProcessors[deviceId] = dataProcessor;
      });
      return _dataProcessors[deviceId]!;
    } catch (e) {
      _appLogger.error('Failed to get or create data processor: $e');
      throw Exception('Failed to get or create data processor: $e');
    }
  }

  void removeDataProcessor(String deviceId) {
    _dataProcessors.remove(deviceId);
  }
}
