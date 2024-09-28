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
import '../../scanner_feedback.dart' as _i816;
import '../../scanner_settings.dart' as _i863;
import '../../scanner_settings/code_specific/codabar.dart' as _i784;
import '../../scanner_settings/code_specific/code_11.dart' as _i0;
import '../../scanner_settings/code_specific/code_128_and_gs1_128.dart'
    as _i628;
import '../../scanner_settings/code_specific/code_2_of_5_and_s_code.dart'
    as _i808;
import '../../scanner_settings/code_specific/code_39.dart' as _i229;
import '../../scanner_settings/code_specific/code_93.dart' as _i136;
import '../../scanner_settings/code_specific/code_specific.dart' as _i316;
import '../../scanner_settings/code_specific/composite_codes.dart' as _i5;
import '../../scanner_settings/code_specific/ean_13.dart' as _i894;
import '../../scanner_settings/code_specific/ean_8.dart' as _i11;
import '../../scanner_settings/code_specific/gs1_databar.dart' as _i772;
import '../../scanner_settings/code_specific/iata.dart' as _i920;
import '../../scanner_settings/code_specific/korean_postal_authority.dart'
    as _i308;
import '../../scanner_settings/code_specific/msi_plessey.dart' as _i248;
import '../../scanner_settings/code_specific/telepen.dart' as _i296;
import '../../scanner_settings/code_specific/uk_plessey.dart' as _i708;
import '../../scanner_settings/code_specific/upc_a.dart' as _i198;
import '../../scanner_settings/code_specific/upc_e.dart' as _i491;
import '../../scanner_settings/code_specific/upc_e1.dart' as _i153;
import '../../scanner_settings/connection_pool.dart' as _i325;
import '../../scanner_settings/formatting.dart' as _i676;
import '../../scanner_settings/inidicator_options.dart' as _i378;
import '../../scanner_settings/read_options.dart' as _i381;
import '../../scanner_settings/symbology.dart' as _i916;
import '../../scanner_settings_manager.dart' as _i981;
import '../interfaces/app_logger.dart' as _i801;
import '../interfaces/command_bytes_provider.dart' as _i22;
import '../services/ble_services/ble_connection_states_service.dart' as _i61;
import '../services/ble_services/ble_connectivity_handler.dart' as _i721;
import '../services/ble_services/ble_devices_discoverer.dart' as _i314;
import '../services/ble_services/ble_devices_helper.dart' as _i26;
import '../services/ble_services/ble_devices_streams_handler.dart' as _i726;
import '../services/core/crc_16_handler.dart' as _i267;
import '../services/core/devices_info_manager.dart' as _i976;
import '../services/core/opticonnect_logger.dart' as _i207;
import '../services/core/permission_handler.dart' as _i401;
import '../services/core/symbology_handler.dart' as _i307;
import '../services/database/database_path_helper.dart' as _i904;
import '../services/database/database_tables_helper.dart' as _i422;
import '../services/scanner_commands_services/command_factory.dart' as _i5;
import '../services/scanner_commands_services/command_feedback_service.dart'
    as _i874;
import '../services/scanner_commands_services/command_handlers_manager.dart'
    as _i569;
import '../services/scanner_commands_services/opc_command_protocol_handler.dart'
    as _i643;
import '../services/scanner_settings_services/database_manager.dart' as _i618;
import '../services/scanner_settings_services/datawizard_helper.dart' as _i277;
import '../services/scanner_settings_services/settings_compressor.dart'
    as _i869;
import '../services/scanner_settings_services/settings_handler.dart' as _i732;

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
    gh.lazySingleton<_i816.ScannerFeedback>(() => _i816.ScannerFeedback());
    gh.lazySingleton<_i784.Codabar>(() => _i784.Codabar());
    gh.lazySingleton<_i0.Code11>(() => _i0.Code11());
    gh.lazySingleton<_i628.Code128AndGS1128>(() => _i628.Code128AndGS1128());
    gh.lazySingleton<_i808.Code2Of5AndSCode>(() => _i808.Code2Of5AndSCode());
    gh.lazySingleton<_i229.Code39>(() => _i229.Code39());
    gh.lazySingleton<_i136.Code93>(() => _i136.Code93());
    gh.lazySingleton<_i5.CompositeCodes>(() => _i5.CompositeCodes());
    gh.lazySingleton<_i894.EAN13>(() => _i894.EAN13());
    gh.lazySingleton<_i11.EAN8>(() => _i11.EAN8());
    gh.lazySingleton<_i772.GS1Databar>(() => _i772.GS1Databar());
    gh.lazySingleton<_i920.IATA>(() => _i920.IATA());
    gh.lazySingleton<_i308.KoreanPostalAuthority>(
        () => _i308.KoreanPostalAuthority());
    gh.lazySingleton<_i248.MSIPlessey>(() => _i248.MSIPlessey());
    gh.lazySingleton<_i296.Telepen>(() => _i296.Telepen());
    gh.lazySingleton<_i708.UKPlessey>(() => _i708.UKPlessey());
    gh.lazySingleton<_i198.UPCA>(() => _i198.UPCA());
    gh.lazySingleton<_i491.UPCE>(() => _i491.UPCE());
    gh.lazySingleton<_i153.UPCE1>(() => _i153.UPCE1());
    gh.lazySingleton<_i381.ReadOptions>(() => _i381.ReadOptions());
    gh.lazySingleton<_i61.BleConnectionStatesService>(
        () => _i61.BleConnectionStatesService());
    gh.lazySingleton<_i26.BleDevicesHelper>(() => _i26.BleDevicesHelper());
    gh.lazySingleton<_i267.CRC16Handler>(() => _i267.CRC16Handler());
    gh.lazySingleton<_i401.PermissionHandler>(() => _i401.PermissionHandler());
    gh.lazySingleton<_i307.SymbologyHandler>(() => _i307.SymbologyHandler());
    gh.lazySingleton<_i904.DatabasePathHelper>(
        () => _i904.DatabasePathHelper());
    gh.lazySingleton<_i422.DatabaseTablesHelper>(
        () => _i422.DatabaseTablesHelper());
    gh.lazySingleton<_i5.CommandFactory>(() => _i5.CommandFactory());
    gh.lazySingleton<_i874.CommandFeedbackService>(
        () => _i874.CommandFeedbackService());
    gh.lazySingleton<_i277.DataWizardHelper>(() => _i277.DataWizardHelper());
    gh.lazySingleton<_i801.AppLogger>(() => _i207.OptiConnectLogger());
    gh.lazySingleton<_i316.CodeSpecific>(() => _i316.CodeSpecific(
          gh<_i808.Code2Of5AndSCode>(),
          gh<_i784.Codabar>(),
          gh<_i0.Code11>(),
          gh<_i229.Code39>(),
          gh<_i136.Code93>(),
          gh<_i628.Code128AndGS1128>(),
          gh<_i5.CompositeCodes>(),
          gh<_i11.EAN8>(),
          gh<_i894.EAN13>(),
          gh<_i772.GS1Databar>(),
          gh<_i920.IATA>(),
          gh<_i308.KoreanPostalAuthority>(),
          gh<_i248.MSIPlessey>(),
          gh<_i296.Telepen>(),
          gh<_i708.UKPlessey>(),
          gh<_i198.UPCA>(),
          gh<_i491.UPCE>(),
          gh<_i153.UPCE1>(),
        ));
    gh.lazySingleton<_i314.BleDevicesDiscoverer>(
        () => _i314.BleDevicesDiscoverer(
              gh<_i401.PermissionHandler>(),
              gh<_i801.AppLogger>(),
            ));
    gh.lazySingleton<_i618.DatabaseManager>(
        () => _i618.DatabaseManager(gh<_i904.DatabasePathHelper>()));
    gh.lazySingleton<_i325.ConnectionPool>(
        () => _i325.ConnectionPool(gh<_i801.AppLogger>()));
    gh.lazySingleton<_i676.Formatting>(
        () => _i676.Formatting(gh<_i801.AppLogger>()));
    gh.lazySingleton<_i378.InidicatorOptions>(
        () => _i378.InidicatorOptions(gh<_i801.AppLogger>()));
    gh.lazySingleton<_i726.BleDevicesStreamsHandler>(
        () => _i726.BleDevicesStreamsHandler(gh<_i801.AppLogger>()));
    gh.lazySingleton<_i916.Symbology>(
        () => _i916.Symbology(gh<_i801.AppLogger>()));
    gh.lazySingleton<_i22.CommandBytesProvider>(
        () => _i643.OpcCommandProtocolHandler(
              gh<_i267.CRC16Handler>(),
              gh<_i801.AppLogger>(),
            ));
    gh.lazySingleton<_i732.SettingsHandler>(() => _i732.SettingsHandler(
          gh<_i422.DatabaseTablesHelper>(),
          gh<_i618.DatabaseManager>(),
          gh<_i801.AppLogger>(),
        ));
    gh.lazySingleton<_i869.SettingsCompressor>(() => _i869.SettingsCompressor(
          gh<_i732.SettingsHandler>(),
          gh<_i277.DataWizardHelper>(),
        ));
    gh.lazySingleton<_i569.CommandHandlersManager>(
        () => _i569.CommandHandlersManager(
              gh<_i5.CommandFactory>(),
              gh<_i726.BleDevicesStreamsHandler>(),
              gh<_i22.CommandBytesProvider>(),
              gh<_i874.CommandFeedbackService>(),
              gh<_i869.SettingsCompressor>(),
              gh<_i801.AppLogger>(),
            ));
    gh.lazySingleton<_i863.ScannerSettings>(() => _i863.ScannerSettings(
          gh<_i916.Symbology>(),
          gh<_i316.CodeSpecific>(),
          gh<_i381.ReadOptions>(),
          gh<_i378.InidicatorOptions>(),
          gh<_i676.Formatting>(),
          gh<_i325.ConnectionPool>(),
          gh<_i569.CommandHandlersManager>(),
          gh<_i869.SettingsCompressor>(),
          gh<_i801.AppLogger>(),
        ));
    gh.lazySingleton<_i981.ScannerSettings>(() => _i981.ScannerSettings(
          gh<_i916.Symbology>(),
          gh<_i316.CodeSpecific>(),
          gh<_i381.ReadOptions>(),
          gh<_i378.InidicatorOptions>(),
          gh<_i676.Formatting>(),
          gh<_i325.ConnectionPool>(),
          gh<_i569.CommandHandlersManager>(),
          gh<_i869.SettingsCompressor>(),
          gh<_i801.AppLogger>(),
        ));
    gh.lazySingleton<_i976.DevicesInfoManager>(() => _i976.DevicesInfoManager(
          gh<_i569.CommandHandlersManager>(),
          gh<_i801.AppLogger>(),
        ));
    gh.lazySingleton<_i721.BleConnectivityHandler>(
        () => _i721.BleConnectivityHandler(
              gh<_i61.BleConnectionStatesService>(),
              gh<_i726.BleDevicesStreamsHandler>(),
              gh<_i26.BleDevicesHelper>(),
              gh<_i569.CommandHandlersManager>(),
              gh<_i976.DevicesInfoManager>(),
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
