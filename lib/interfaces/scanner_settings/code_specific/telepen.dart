part of 'package:opticonnect_sdk/interfaces.dart';

/// Interface for settings related to Telepen symbology.
///
/// Provides methods to configure the code mode for Telepen symbology.
abstract class Telepen {
  Future<CommandResponse> setMode({
    required String deviceId,
    required TelepenCodeMode mode,
  });
}
