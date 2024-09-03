// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../services/ble_connection_states_service.dart' as _i767;
import '../services/ble_connectivity_handler.dart' as _i34;
import '../services/ble_devices_discoverer.dart' as _i301;
import '../services/ble_devices_streams_handler.dart' as _i56;
import '../services/crc_16_handler.dart' as _i974;
import '../services/permission_handler.dart' as _i199;
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
    gh.lazySingleton<_i767.BleConnectionStatesService>(
        () => _i767.BleConnectionStatesService());
    gh.lazySingleton<_i56.BleDevicesStreamsHandler>(
        () => _i56.BleDevicesStreamsHandler());
    gh.lazySingleton<_i974.CRC16Handler>(() => _i974.CRC16Handler());
    gh.lazySingleton<_i199.PermissionHandler>(() => _i199.PermissionHandler());
    gh.lazySingleton<_i11.SymbologyHandler>(() => _i11.SymbologyHandler());
    gh.lazySingleton<_i34.BleConnectivityHandler>(
        () => _i34.BleConnectivityHandler(
              gh<_i767.BleConnectionStatesService>(),
              gh<_i56.BleDevicesStreamsHandler>(),
            ));
    gh.lazySingleton<_i301.BleDevicesDiscoverer>(
        () => _i301.BleDevicesDiscoverer(gh<_i199.PermissionHandler>()));
    return this;
  }
}
