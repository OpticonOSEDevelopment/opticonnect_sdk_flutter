// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../bluetooth_manager.dart' as _i186;
import '../../scanner_feedback_manager.dart' as _i610;
import '../../scanner_settings/code_specific_settings/codabar_settings.dart'
    as _i60;
import '../../scanner_settings/code_specific_settings/code_11_settings.dart'
    as _i536;
import '../../scanner_settings/code_specific_settings/code_128_and_gs1_128_settings.dart'
    as _i224;
import '../../scanner_settings/code_specific_settings/code_2_of_5_and_s_code_settings.dart'
    as _i448;
import '../../scanner_settings/code_specific_settings/code_39_settings.dart'
    as _i904;
import '../../scanner_settings/code_specific_settings/code_93_settings.dart'
    as _i1073;
import '../../scanner_settings/code_specific_settings/code_specific_settings.dart'
    as _i450;
import '../../scanner_settings/code_specific_settings/composite_codes_settings.dart'
    as _i846;
import '../../scanner_settings/code_specific_settings/ean_13_settings.dart'
    as _i179;
import '../../scanner_settings/code_specific_settings/ean_8_settings.dart'
    as _i828;
import '../../scanner_settings/code_specific_settings/gs1_databar_settings.dart'
    as _i865;
import '../../scanner_settings/code_specific_settings/iata_settings.dart'
    as _i662;
import '../../scanner_settings/code_specific_settings/korean_postal_authority_code_settings.dart'
    as _i807;
import '../../scanner_settings/code_specific_settings/msi_plessey_settings.dart'
    as _i674;
import '../../scanner_settings/code_specific_settings/telepen_settings.dart'
    as _i977;
import '../../scanner_settings/code_specific_settings/uk_plessey_settings.dart'
    as _i231;
import '../../scanner_settings/code_specific_settings/upc_a_settings.dart'
    as _i229;
import '../../scanner_settings/code_specific_settings/upc_e1_settings.dart'
    as _i417;
import '../../scanner_settings/code_specific_settings/upc_e_settings.dart'
    as _i616;
import '../../scanner_settings/connection_pool_settings.dart' as _i915;
import '../../scanner_settings/formatting_options.dart' as _i56;
import '../../scanner_settings/inidicator_options.dart' as _i378;
import '../../scanner_settings/scan_options_settings.dart' as _i722;
import '../../scanner_settings/symbology_settings.dart' as _i112;
import '../../scanner_settings_manager.dart' as _i981;
import '../interfaces/app_logger.dart' as _i801;
import '../interfaces/command_bytes_provider.dart' as _i22;
import '../services/ble_services/ble_connection_states_service.dart' as _i61;
import '../services/ble_services/ble_connectivity_handler.dart' as _i721;
import '../services/ble_services/ble_devices_discoverer.dart' as _i314;
import '../services/ble_services/ble_devices_helper.dart' as _i26;
import '../services/ble_services/ble_devices_streams_handler.dart' as _i726;
import '../services/crc_16_handler.dart' as _i974;
import '../services/database/database_path_helper.dart' as _i904;
import '../services/database/database_tables_helper.dart' as _i422;
import '../services/devices_info_manager.dart' as _i664;
import '../services/opticonnect_logger.dart' as _i652;
import '../services/permission_handler.dart' as _i199;
import '../services/scanner_commands_services/command_factory.dart' as _i5;
import '../services/scanner_commands_services/command_feedback_service.dart'
    as _i874;
import '../services/scanner_commands_services/command_handlers_manager.dart'
    as _i569;
import '../services/scanner_commands_services/opc_command_protocol_handler.dart'
    as _i643;
import '../services/scanner_settings_services/datawizard_settings_manager.dart'
    as _i707;
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
    gh.lazySingleton<_i610.ScannerFeedbackManager>(
        () => _i610.ScannerFeedbackManager());
    gh.lazySingleton<_i60.CodabarSettings>(() => _i60.CodabarSettings());
    gh.lazySingleton<_i536.Code11Settings>(() => _i536.Code11Settings());
    gh.lazySingleton<_i224.Code128AndGS1128Settings>(
        () => _i224.Code128AndGS1128Settings());
    gh.lazySingleton<_i448.Code2Of5AndSCodeSettings>(
        () => _i448.Code2Of5AndSCodeSettings());
    gh.lazySingleton<_i904.Code39Settings>(() => _i904.Code39Settings());
    gh.lazySingleton<_i1073.Code93Settings>(() => _i1073.Code93Settings());
    gh.lazySingleton<_i846.CompositeCodesSettings>(
        () => _i846.CompositeCodesSettings());
    gh.lazySingleton<_i179.EAN13Settings>(() => _i179.EAN13Settings());
    gh.lazySingleton<_i828.EAN8Settings>(() => _i828.EAN8Settings());
    gh.lazySingleton<_i865.GS1DatabarSettings>(
        () => _i865.GS1DatabarSettings());
    gh.lazySingleton<_i662.IATASettings>(() => _i662.IATASettings());
    gh.lazySingleton<_i807.KoreanPostalAuthorityCodeSettings>(
        () => _i807.KoreanPostalAuthorityCodeSettings());
    gh.lazySingleton<_i674.MSIPlesseySettings>(
        () => _i674.MSIPlesseySettings());
    gh.lazySingleton<_i977.TelepenSettings>(() => _i977.TelepenSettings());
    gh.lazySingleton<_i231.UKPlesseySettings>(() => _i231.UKPlesseySettings());
    gh.lazySingleton<_i229.UPCASettings>(() => _i229.UPCASettings());
    gh.lazySingleton<_i417.UPCE1Settings>(() => _i417.UPCE1Settings());
    gh.lazySingleton<_i616.UPCESettings>(() => _i616.UPCESettings());
    gh.lazySingleton<_i722.ScanOptionsSettings>(
        () => _i722.ScanOptionsSettings());
    gh.lazySingleton<_i61.BleConnectionStatesService>(
        () => _i61.BleConnectionStatesService());
    gh.lazySingleton<_i26.BleDevicesHelper>(() => _i26.BleDevicesHelper());
    gh.lazySingleton<_i974.CRC16Handler>(() => _i974.CRC16Handler());
    gh.lazySingleton<_i904.DatabasePathHelper>(
        () => _i904.DatabasePathHelper());
    gh.lazySingleton<_i422.DatabaseTablesHelper>(
        () => _i422.DatabaseTablesHelper());
    gh.lazySingleton<_i199.PermissionHandler>(() => _i199.PermissionHandler());
    gh.lazySingleton<_i5.CommandFactory>(() => _i5.CommandFactory());
    gh.lazySingleton<_i874.CommandFeedbackService>(
        () => _i874.CommandFeedbackService());
    gh.lazySingleton<_i707.DatawizardSettingsManager>(
        () => _i707.DatawizardSettingsManager());
    gh.lazySingleton<_i11.SymbologyHandler>(() => _i11.SymbologyHandler());
    gh.lazySingleton<_i450.CodeSpecificSettings>(
        () => _i450.CodeSpecificSettings(
              gh<_i60.CodabarSettings>(),
              gh<_i536.Code11Settings>(),
              gh<_i448.Code2Of5AndSCodeSettings>(),
              gh<_i904.Code39Settings>(),
              gh<_i1073.Code93Settings>(),
              gh<_i224.Code128AndGS1128Settings>(),
              gh<_i846.CompositeCodesSettings>(),
              gh<_i828.EAN8Settings>(),
              gh<_i179.EAN13Settings>(),
              gh<_i865.GS1DatabarSettings>(),
              gh<_i662.IATASettings>(),
              gh<_i807.KoreanPostalAuthorityCodeSettings>(),
              gh<_i674.MSIPlesseySettings>(),
              gh<_i977.TelepenSettings>(),
              gh<_i231.UKPlesseySettings>(),
              gh<_i229.UPCASettings>(),
              gh<_i616.UPCESettings>(),
              gh<_i417.UPCE1Settings>(),
            ));
    gh.lazySingleton<_i801.AppLogger>(() => _i652.OptiConnectLogger());
    gh.lazySingleton<_i211.ScannerSettingsDatabaseManager>(() =>
        _i211.ScannerSettingsDatabaseManager(gh<_i904.DatabasePathHelper>()));
    gh.lazySingleton<_i915.ConnectionPoolSettings>(
        () => _i915.ConnectionPoolSettings(gh<_i801.AppLogger>()));
    gh.lazySingleton<_i56.FormattingOptions>(
        () => _i56.FormattingOptions(gh<_i801.AppLogger>()));
    gh.lazySingleton<_i378.InidicatorOptions>(
        () => _i378.InidicatorOptions(gh<_i801.AppLogger>()));
    gh.lazySingleton<_i112.SymbologySettings>(
        () => _i112.SymbologySettings(gh<_i801.AppLogger>()));
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
    gh.lazySingleton<_i726.BleDevicesStreamsHandler>(
        () => _i726.BleDevicesStreamsHandler(
              gh<_i26.BleDevicesHelper>(),
              gh<_i801.AppLogger>(),
            ));
    gh.lazySingleton<_i659.ScannerSettingsHandler>(
        () => _i659.ScannerSettingsHandler(
              gh<_i422.DatabaseTablesHelper>(),
              gh<_i211.ScannerSettingsDatabaseManager>(),
              gh<_i801.AppLogger>(),
            ));
    gh.lazySingleton<_i925.ScannerSettingsCompressor>(
        () => _i925.ScannerSettingsCompressor(
              gh<_i659.ScannerSettingsHandler>(),
              gh<_i707.DatawizardSettingsManager>(),
            ));
    gh.lazySingleton<_i569.CommandHandlersManager>(
        () => _i569.CommandHandlersManager(
              gh<_i5.CommandFactory>(),
              gh<_i726.BleDevicesStreamsHandler>(),
              gh<_i22.CommandBytesProvider>(),
              gh<_i874.CommandFeedbackService>(),
              gh<_i925.ScannerSettingsCompressor>(),
              gh<_i801.AppLogger>(),
            ));
    gh.lazySingleton<_i664.DevicesInfoManager>(() => _i664.DevicesInfoManager(
          gh<_i569.CommandHandlersManager>(),
          gh<_i801.AppLogger>(),
        ));
    gh.lazySingleton<_i721.BleConnectivityHandler>(
        () => _i721.BleConnectivityHandler(
              gh<_i61.BleConnectionStatesService>(),
              gh<_i726.BleDevicesStreamsHandler>(),
              gh<_i26.BleDevicesHelper>(),
              gh<_i569.CommandHandlersManager>(),
              gh<_i664.DevicesInfoManager>(),
              gh<_i801.AppLogger>(),
            ));
    gh.lazySingleton<_i981.ScannerSettingsManager>(
        () => _i981.ScannerSettingsManager(
              gh<_i112.SymbologySettings>(),
              gh<_i450.CodeSpecificSettings>(),
              gh<_i722.ScanOptionsSettings>(),
              gh<_i378.InidicatorOptions>(),
              gh<_i56.FormattingOptions>(),
              gh<_i915.ConnectionPoolSettings>(),
              gh<_i569.CommandHandlersManager>(),
              gh<_i925.ScannerSettingsCompressor>(),
              gh<_i801.AppLogger>(),
            ));
    gh.lazySingleton<_i186.BluetoothManager>(() => _i186.BluetoothManager(
          gh<_i314.BleDevicesDiscoverer>(),
          gh<_i721.BleConnectivityHandler>(),
          gh<_i726.BleDevicesStreamsHandler>(),
          gh<_i801.AppLogger>(),
        ));
    return this;
  }
}
