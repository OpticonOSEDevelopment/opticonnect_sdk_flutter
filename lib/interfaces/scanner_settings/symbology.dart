part of 'package:opticonnect_sdk/interfaces.dart';

/// Interface for managing symbology settings on the scanner.
///
/// Provides methods to enable, disable, or exclusively enable specific symbologies.
abstract class Symbology {
  /// Enables a specific symbology exclusively on the device.
  ///
  /// [deviceId] is the ID of the device where the symbology should be enabled exclusively.
  /// [type] is the symbology to enable exclusively.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableOnlySymbology({
    required String deviceId,
    required SymbologyType type,
  });

  /// Toggles a specific symbology on the device based on the [enabled] flag.
  ///
  /// [deviceId] is the ID of the device where the symbology should be enabled or disabled.
  /// [type] is the symbology to enable or disable.
  /// [enabled] is a boolean flag indicating whether to enable (true) or disable (false) the symbology.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setSymbology({
    required String deviceId,
    required SymbologyType type,
    required bool enabled,
  });
}
