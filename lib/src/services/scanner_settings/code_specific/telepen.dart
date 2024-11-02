import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/constants.dart';
import 'package:opticonnect_sdk/entities/entities.dart';
import 'package:opticonnect_sdk/enums/enums.dart';
import 'package:opticonnect_sdk/interfaces/interfaces.dart';
import 'package:opticonnect_sdk/src/interfaces/settings_base.dart';

/// Implementation of [Telepen] for settings related to Telepen symbology.
///
/// Provides methods to configure the code mode for Telepen symbology.
@LazySingleton(as: Telepen)
class TelepenImpl extends SettingsBase implements Telepen {
  /// A map linking the Telepen code modes to their corresponding commands.
  final Map<TelepenCodeMode, String> _telepenCodeModeCommands = {
    TelepenCodeMode.numericMode: telepenNumericMode,
    TelepenCodeMode.asciiMode: telepenASCIIMode,
  };

  @override
  Future<CommandResponse> setMode({
    required String deviceId,
    required TelepenCodeMode mode,
  }) async {
    return sendCommand(deviceId, _telepenCodeModeCommands[mode]!);
  }
}
