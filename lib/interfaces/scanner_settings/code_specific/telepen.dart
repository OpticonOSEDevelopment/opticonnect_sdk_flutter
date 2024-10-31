import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/enums/scanner_settings/code_specific/telepen.dart';

/// Interface for settings related to Telepen symbology.
///
/// Provides methods to configure the code mode for Telepen symbology.
abstract class Telepen {
  Future<CommandResponse> setMode({
    required String deviceId,
    required TelepenCodeMode mode,
  });
}
