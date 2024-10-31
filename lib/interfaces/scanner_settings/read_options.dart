import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/enums/scanner_settings/read_options.dart';

/// Configures scan options, including read modes, illumination, and barcode settings.
abstract class ReadOptions {
  /// Sets the mode for reading positive and negative barcodes.
  Future<CommandResponse> setPositiveAndNegativeBarcodesMode({
    required String deviceId,
    required PositiveAndNegativeBarcodesMode mode,
  });

  /// Sets the read mode for the scanner.
  Future<CommandResponse> setReadMode({
    required String deviceId,
    required ReadMode mode,
  });

  /// Sets the read time for the scanner.
  Future<CommandResponse> setReadTime({
    required String deviceId,
    required ReadTime time,
  });

  /// Sets the illumination mode for the scanner.
  Future<CommandResponse> setIlluminationMode({
    required String deviceId,
    required IlluminationMode mode,
  });

  /// Toggles the aiming feature for the scanner based on the [enabled] flag.
  Future<CommandResponse> setAiming({
    required String deviceId,
    required bool enabled,
  });

  /// Toggles the trigger repeat feature for the scanner based on the [enabled] flag.
  Future<CommandResponse> setTriggerRepeat({
    required String deviceId,
    required bool enabled,
  });

  /// Toggles the delete key feature for the scanner based on the [enabled] flag.
  Future<CommandResponse> setDeleteKey({
    required String deviceId,
    required bool enabled,
  });
}
