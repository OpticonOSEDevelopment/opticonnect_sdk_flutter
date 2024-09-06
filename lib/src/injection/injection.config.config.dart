// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../interfaces/app_logger.dart' as _i801;
import '../interfaces/command_bytes_provider.dart' as _i22;
import '../services/ble_services/ble_connection_states_service.dart' as _i61;
import '../services/ble_services/ble_connectivity_handler.dart' as _i721;
import '../services/ble_services/ble_devices_discoverer.dart' as _i314;
import '../services/ble_services/ble_devices_streams_handler.dart' as _i726;
import '../services/crc_16_handler.dart' as _i974;
import '../services/database/database_path_helper.dart' as _i904;
import '../services/database/database_tables_helper.dart' as _i422;
import '../services/opticonnect_logger.dart' as _i652;
import '../services/permission_handler.dart' as _i199;
import '../services/scanner_commands_services/command_factory.dart' as _i5;
import '../services/scanner_commands_services/command_feedback_service.dart'
    as _i874;
import '../services/scanner_commands_services/command_handlers_manager.dart'
    as _i569;
import '../services/scanner_commands_services/opc_command_protocol_handler.dart'
    as _i643;
import '../services/scanner_settings_services/scanner_settings_compressor.dart'
    as _i925;
import '../services/scanner_settings_services/scanner_settings_database_manager.dart'
    as _i211;
import '../services/scanner_settings_services/scanner_settings_handler.dart'
    as _i659;
import '../services/symbology_handler.dart' as _i11;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i61.BleConnectionStatesService>(
        () => _i61.BleConnectionStatesService());
    gh.lazySingleton<_i726.BleDevicesStreamsHandler>(
        () => _i726.BleDevicesStreamsHandler());
    gh.lazySingleton<_i974.CRC16Handler>(() => _i974.CRC16Handler());
    gh.lazySingleton<_i904.DatabasePathHelper>(
        () => _i904.DatabasePathHelper());
    gh.lazySingleton<_i422.DatabaseTablesHelper>(
        () => _i422.DatabaseTablesHelper());
    gh.lazySingleton<_i199.PermissionHandler>(() => _i199.PermissionHandler());
    gh.lazySingleton<_i5.CommandFactory>(() => _i5.CommandFactory());
    gh.lazySingleton<_i874.CommandFeedbackService>(
        () => _i874.CommandFeedbackService());
    gh.lazySingleton<_i11.SymbologyHandler>(() => _i11.SymbologyHandler());
    gh.lazySingleton<_i801.AppLogger>(() => _i652.OptiConnectLogger());
    gh.lazySingleton<_i211.ScannerSettingsDatabaseManager>(() =>
        _i211.ScannerSettingsDatabaseManager(gh<_i904.DatabasePathHelper>()));
    gh.lazySingleton<_i22.CommandBytesProvider>(
        () => _i643.OpcCommandProtocolHandler(
              gh<_i974.CRC16Handler>(),
              gh<_i801.AppLogger>(),
            ));
    gh.lazySingleton<_i314.BleDevicesDiscoverer>(
        () => _i314.BleDevicesDiscoverer(
              gh<_i199.PermissionHandler>(),
              gh<_i801.AppLogger>(),
            ));
    gh.lazySingleton<_i659.ScannerSettingsHandler>(
        () => _i659.ScannerSettingsHandler(
              gh<_i422.DatabaseTablesHelper>(),
              gh<_i211.ScannerSettingsDatabaseManager>(),
              gh<_i801.AppLogger>(),
            ));
    gh.lazySingleton<_i925.ScannerSettingsCompressor>(() =>
        _i925.ScannerSettingsCompressor(gh<_i659.ScannerSettingsHandler>()));
    gh.lazySingleton<_i569.CommandHandlersManager>(
        () => _i569.CommandHandlersManager(
              gh<_i5.CommandFactory>(),
              gh<_i726.BleDevicesStreamsHandler>(),
              gh<_i22.CommandBytesProvider>(),
              gh<_i874.CommandFeedbackService>(),
              gh<_i925.ScannerSettingsCompressor>(),
              gh<_i801.AppLogger>(),
            ));
    gh.lazySingleton<_i721.BleConnectivityHandler>(
        () => _i721.BleConnectivityHandler(
              gh<_i61.BleConnectionStatesService>(),
              gh<_i726.BleDevicesStreamsHandler>(),
              gh<_i569.CommandHandlersManager>(),
              gh<_i801.AppLogger>(),
            ));
    return this;
  }
}
