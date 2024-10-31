import 'package:opticonnect_sdk/entities/command_response.dart';

/// Interface for UPCE1 symbology settings.
///
/// Provides methods to configure add-on support for UPCE1 symbology.
abstract class UPCE1 {
  Future<CommandResponse> setAddOnPlus2({
    required String deviceId,
    required bool enabled,
  });

  Future<CommandResponse> setAddOnPlus5({
    required String deviceId,
    required bool enabled,
  });
}
