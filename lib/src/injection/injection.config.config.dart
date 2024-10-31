// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../interfaces/bluetooth_manager.dart' as _i601;
import '../../interfaces/scanner_feedback.dart' as _i556;
import '../../interfaces/scanner_info.dart' as _i83;
import '../../interfaces/scanner_settings/code_specific/codabar.dart' as _i74;
import '../../interfaces/scanner_settings/code_specific/code_11.dart' as _i1045;
import '../../interfaces/scanner_settings/code_specific/code_128_and_gs1_128.dart'
    as _i1044;
import '../../interfaces/scanner_settings/code_specific/code_2_of_5_and_s_code.dart'
    as _i830;
import '../../interfaces/scanner_settings/code_specific/code_39.dart' as _i792;
import '../../interfaces/scanner_settings/code_specific/code_93.dart' as _i82;
import '../../interfaces/scanner_settings/code_specific/code_specific.dart'
    as _i556;
import '../../interfaces/scanner_settings/code_specific/composite_codes.dart'
    as _i71;
import '../../interfaces/scanner_settings/code_specific/ean_13.dart' as _i849;
import '../../interfaces/scanner_settings/code_specific/ean_8.dart' as _i1039;
import '../../interfaces/scanner_settings/code_specific/gs1_databar.dart'
    as _i833;
import '../../interfaces/scanner_settings/code_specific/iata.dart' as _i108;
import '../../interfaces/scanner_settings/code_specific/korean_postal_authority'
    as _i1019;
import '../../interfaces/scanner_settings/code_specific/msi_plessey.dart'
    as _i909;
import '../../interfaces/scanner_settings/code_specific/telepen.dart' as _i480;
import '../../interfaces/scanner_settings/code_specific/uk_plessey.dart'
    as _i198;
import '../../interfaces/scanner_settings/code_specific/upc_a.dart' as _i1021;
import '../../interfaces/scanner_settings/code_specific/upc_e.dart' as _i572;
import '../../interfaces/scanner_settings/code_specific/upc_e1.dart' as _i209;
import '../../interfaces/scanner_settings/connection_pool.dart' as _i655;
import '../../interfaces/scanner_settings/formatting.dart' as _i1031;
import '../../interfaces/scanner_settings/indicator_options.dart' as _i997;
import '../../interfaces/scanner_settings/read_options.dart' as _i143;
import '../../interfaces/scanner_settings/scanner_settings.dart' as _i967;
import '../../interfaces/scanner_settings/symbology.dart' as _i458;
import '../interfaces/app_logger.dart' as _i801;
import '../interfaces/command_bytes_provider.dart' as _i22;
import '../services/ble/ble_connection_states_service.dart' as _i886;
import '../services/ble/ble_connectivity_handler.dart' as _i551;
import '../services/ble/ble_devices_discoverer.dart' as _i570;
import '../services/ble/ble_devices_helper.dart' as _i976;
import '../services/ble/bluetooth_manager.dart' as _i19;
import '../services/ble/streams/battery/battery_handler.dart' as _i752;
import '../services/ble/streams/ble_devices_streams_handler.dart' as _i686;
import '../services/ble/streams/data/data_handler.dart' as _i90;
import '../services/core/crc_16_handler.dart' as _i267;
import '../services/core/devices_info_manager.dart' as _i976;
import '../services/core/opticonnect_logger.dart' as _i207;
import '../services/core/permission_handler.dart' as _i401;
import '../services/core/scanner_info.dart' as _i1072;
import '../services/core/symbology_handler.dart' as _i307;
import '../services/database/database_path_helper.dart' as _i904;
import '../services/database/database_tables_helper.dart' as _i422;
import '../services/scanner_commands/command_executors_manager.dart' as _i307;
import '../services/scanner_commands/command_factory.dart' as _i473;
import '../services/scanner_commands/command_feedback_service.dart' as _i280;
import '../services/scanner_commands/opc_command_protocol_handler.dart'
    as _i381;
import '../services/scanner_settings/code_specific/codabar.dart' as _i495;
import '../services/scanner_settings/code_specific/code_11.dart' as _i203;
import '../services/scanner_settings/code_specific/code_128_and_gs1_128.dart'
    as _i503;
import '../services/scanner_settings/code_specific/code_2_of_5_and_s_code.dart'
    as _i928;
import '../services/scanner_settings/code_specific/code_39.dart' as _i772;
import '../services/scanner_settings/code_specific/code_93.dart' as _i628;
import '../services/scanner_settings/code_specific/code_specific.dart' as _i516;
import '../services/scanner_settings/code_specific/composite_codes.dart'
    as _i496;
import '../services/scanner_settings/code_specific/ean_13.dart' as _i205;
import '../services/scanner_settings/code_specific/ean_8.dart' as _i606;
import '../services/scanner_settings/code_specific/gs1_databar.dart' as _i463;
import '../services/scanner_settings/code_specific/iata.dart' as _i1003;
import '../services/scanner_settings/code_specific/msi_plessey.dart' as _i334;
import '../services/scanner_settings/code_specific/telepen.dart' as _i973;
import '../services/scanner_settings/code_specific/uk_plessey.dart' as _i851;
import '../services/scanner_settings/code_specific/upc_a.dart' as _i256;
import '../services/scanner_settings/code_specific/upc_e.dart' as _i259;
import '../services/scanner_settings/code_specific/upc_e1.dart' as _i33;
import '../services/scanner_settings/connection_pool.dart' as _i70;
import '../services/scanner_settings/database_manager.dart' as _i488;
import '../services/scanner_settings/datawizard_helper.dart' as _i540;
import '../services/scanner_settings/formatting.dart' as _i261;
import '../services/scanner_settings/indicator_options.dart' as _i50;
import '../services/scanner_settings/read_options.dart' as _i638;
import '../services/scanner_settings/scanner_feedback.dart' as _i436;
import '../services/scanner_settings/scanner_settings.dart' as _i102;
import '../services/scanner_settings/settings_compressor.dart' as _i619;
import '../services/scanner_settings/settings_handler.dart' as _i399;
import '../services/scanner_settings/symbology.dart' as _i970;

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
    gh.lazySingleton<_i267.CRC16Handler>(() => _i267.CRC16Handler());
    gh.lazySingleton<_i401.PermissionHandler>(() => _i401.PermissionHandler());
    gh.lazySingleton<_i307.SymbologyHandler>(() => _i307.SymbologyHandler());
    gh.lazySingleton<_i904.DatabasePathHelper>(
        () => _i904.DatabasePathHelper());
    gh.lazySingleton<_i422.DatabaseTablesHelper>(
        () => _i422.DatabaseTablesHelper());
    gh.lazySingleton<_i473.CommandFactory>(() => _i473.CommandFactory());
    gh.lazySingleton<_i540.DataWizardHelper>(() => _i540.DataWizardHelper());
    gh.lazySingleton<_i886.BleConnectionStatesService>(
        () => _i886.BleConnectionStatesService());
    gh.lazySingleton<_i976.BleDevicesHelper>(() => _i976.BleDevicesHelper());
    gh.lazySingleton<_i833.GS1Databar>(() => _i463.GS1DatabarImpl());
    gh.lazySingleton<_i71.CompositeCodes>(() => _i496.CompositeCodesImpl());
    gh.lazySingleton<_i572.UPCE>(() => _i259.UPCEImpl());
    gh.lazySingleton<_i830.Code2Of5AndSCode>(
        () => _i928.Code2Of5AndSCodeImpl());
    gh.lazySingleton<_i1021.UPCA>(() => _i256.UPCAImpl());
    gh.lazySingleton<_i792.Code39>(() => _i772.Code39Impl());
    gh.lazySingleton<_i108.IATA>(() => _i1003.IATAImpl());
    gh.lazySingleton<_i849.EAN13>(() => _i205.EAN13Impl());
    gh.lazySingleton<_i1044.Code128AndGS1128>(
        () => _i503.Code128AndGS1128Impl());
    gh.lazySingleton<_i801.AppLogger>(() => _i207.OptiConnectLogger());
    gh.lazySingleton<_i74.Codabar>(() => _i495.CodabarImpl());
    gh.lazySingleton<_i143.ReadOptions>(() => _i638.ReadOptionsImpl());
    gh.lazySingleton<_i82.Code93>(() => _i628.Code93Impl());
    gh.lazySingleton<_i1039.EAN8>(() => _i606.EAN8Impl());
    gh.lazySingleton<_i556.ScannerFeedback>(() => _i436.ScannerFeedbackImpl());
    gh.lazySingleton<_i1045.Code11>(() => _i203.Code11Impl());
    gh.lazySingleton<_i209.UPCE1>(() => _i33.UPCE1Impl());
    gh.lazySingleton<_i198.UKPlessey>(() => _i851.UKPlesseyImpl());
    gh.lazySingleton<_i570.BleDevicesDiscoverer>(
        () => _i570.BleDevicesDiscoverer(
              gh<_i401.PermissionHandler>(),
              gh<_i801.AppLogger>(),
            ));
    gh.lazySingleton<_i480.Telepen>(() => _i973.TelepenImpl());
    gh.lazySingleton<_i909.MSIPlessey>(() => _i334.MSIPlesseyImpl());
    gh.lazySingleton<_i22.CommandBytesProvider>(
        () => _i381.OpcCommandProtocolHandler(
              gh<_i267.CRC16Handler>(),
              gh<_i801.AppLogger>(),
            ));
    gh.lazySingleton<_i280.CommandFeedbackService>(
        () => _i280.CommandFeedbackService(gh<_i556.ScannerFeedback>()));
    gh.lazySingleton<_i1031.Formatting>(
        () => _i261.FormattingImpl(gh<_i801.AppLogger>()));
    gh.lazySingleton<_i488.DatabaseManager>(
        () => _i488.DatabaseManager(gh<_i904.DatabasePathHelper>()));
    gh.lazySingleton<_i655.ConnectionPool>(
        () => _i70.ConnectionPoolImpl(gh<_i801.AppLogger>()));
    gh.lazySingleton<_i458.Symbology>(
        () => _i970.SymbologyImpl(gh<_i801.AppLogger>()));
    gh.lazySingleton<_i752.BatteryHandler>(
        () => _i752.BatteryHandler(gh<_i801.AppLogger>()));
    gh.lazySingleton<_i90.DataHandler>(
        () => _i90.DataHandler(gh<_i801.AppLogger>()));
    gh.lazySingleton<_i997.IndicatorOptions>(
        () => _i50.IndicatorOptionsImpl(gh<_i801.AppLogger>()));
    gh.lazySingleton<_i556.CodeSpecific>(() => _i516.CodeSpecificImpl(
          gh<_i830.Code2Of5AndSCode>(),
          gh<_i74.Codabar>(),
          gh<_i1045.Code11>(),
          gh<_i792.Code39>(),
          gh<_i82.Code93>(),
          gh<_i1044.Code128AndGS1128>(),
          gh<_i71.CompositeCodes>(),
          gh<_i1039.EAN8>(),
          gh<_i849.EAN13>(),
          gh<_i833.GS1Databar>(),
          gh<_i108.IATA>(),
          gh<_i1019.KoreanPostalAuthority>(),
          gh<_i909.MSIPlessey>(),
          gh<_i480.Telepen>(),
          gh<_i198.UKPlessey>(),
          gh<_i1021.UPCA>(),
          gh<_i572.UPCE>(),
          gh<_i209.UPCE1>(),
        ));
    gh.lazySingleton<_i399.SettingsHandler>(() => _i399.SettingsHandler(
          gh<_i422.DatabaseTablesHelper>(),
          gh<_i488.DatabaseManager>(),
          gh<_i801.AppLogger>(),
        ));
    gh.lazySingleton<_i619.SettingsCompressor>(() => _i619.SettingsCompressor(
          gh<_i399.SettingsHandler>(),
          gh<_i540.DataWizardHelper>(),
        ));
    gh.lazySingleton<_i686.BleDevicesStreamsHandler>(
        () => _i686.BleDevicesStreamsHandler(
              gh<_i752.BatteryHandler>(),
              gh<_i90.DataHandler>(),
            ));
    gh.lazySingleton<_i307.CommandExecutorsManager>(
        () => _i307.CommandExecutorsManager(
              gh<_i473.CommandFactory>(),
              gh<_i90.DataHandler>(),
              gh<_i22.CommandBytesProvider>(),
              gh<_i280.CommandFeedbackService>(),
              gh<_i619.SettingsCompressor>(),
              gh<_i801.AppLogger>(),
            ));
    gh.lazySingleton<_i967.ScannerSettings>(() => _i102.ScannerSettingsImpl(
          gh<_i458.Symbology>(),
          gh<_i556.CodeSpecific>(),
          gh<_i143.ReadOptions>(),
          gh<_i997.IndicatorOptions>(),
          gh<_i1031.Formatting>(),
          gh<_i655.ConnectionPool>(),
          gh<_i307.CommandExecutorsManager>(),
          gh<_i619.SettingsCompressor>(),
          gh<_i801.AppLogger>(),
        ));
    gh.lazySingleton<_i976.DevicesInfoManager>(() => _i976.DevicesInfoManager(
          gh<_i307.CommandExecutorsManager>(),
          gh<_i801.AppLogger>(),
        ));
    gh.lazySingleton<_i551.BleConnectivityHandler>(
        () => _i551.BleConnectivityHandler(
              gh<_i886.BleConnectionStatesService>(),
              gh<_i686.BleDevicesStreamsHandler>(),
              gh<_i976.BleDevicesHelper>(),
              gh<_i307.CommandExecutorsManager>(),
              gh<_i976.DevicesInfoManager>(),
              gh<_i801.AppLogger>(),
            ));
    gh.lazySingleton<_i83.ScannerInfo>(
        () => _i1072.ScannerInfoImpl(gh<_i976.DevicesInfoManager>()));
    gh.lazySingleton<_i601.BluetoothManager>(() => _i19.BluetoothManagerImpl(
          gh<_i570.BleDevicesDiscoverer>(),
          gh<_i551.BleConnectivityHandler>(),
          gh<_i686.BleDevicesStreamsHandler>(),
          gh<_i801.AppLogger>(),
        ));
    return this;
  }
}
