import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/enums/scanner_settings/code_specific/ean_13.dart';
import 'package:opticonnect_sdk/interfaces/scanner_settings/code_specific/ean_13.dart';
import 'package:opticonnect_sdk/src/interfaces/settings_base.dart';

/// Implementation of the [EAN13] interface for settings related to EAN-13 symbology.
///
/// This class provides methods to enable or disable the transmission of check digits,
/// and to manage add-on settings for EAN-13 symbology.
@LazySingleton(as: EAN13)
class EAN13Impl extends SettingsBase implements EAN13 {
  final Map<TranslationMode, String> _issnTranslationCommands = {
    TranslationMode.disable: eanDisableISSNTranslation,
    TranslationMode.enable: eanEnableISSNTranslation,
    TranslationMode.enableIfPossible: eanEnableISSNIfPossible,
  };

  final Map<TranslationMode, String> _ismnTranslationCommands = {
    TranslationMode.disable: eanDisableISMNTranslation,
    TranslationMode.enable: eanEnableISMNTranslation,
    TranslationMode.enableIfPossible: eanEnableISMNIfPossible,
  };

  final Map<TranslationMode, String> _isbnTranslationCommands = {
    TranslationMode.disable: eanDisableISBNTranslation,
    TranslationMode.enable: eanEnableISBNTranslation,
    TranslationMode.enableIfPossible: eanEnableISBNIfPossible,
  };

  @override
  Future<CommandResponse> setTransmitCD({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command = enabled ? ean13TransmitCd : ean13DoNotTransmitCd;
    return sendCommand(deviceId, command);
  }

  @override
  Future<CommandResponse> setAddOnPlus2({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command = enabled ? enableEAN13Plus2 : disableEAN13Plus2;
    return sendCommand(deviceId, command);
  }

  @override
  Future<CommandResponse> setAddOnPlus5({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command = enabled ? enableEAN13Plus5 : disableEAN13Plus5;
    return sendCommand(deviceId, command);
  }

  @override
  Future<CommandResponse> setISSNTranslationMode({
    required String deviceId,
    required TranslationMode mode,
  }) async {
    return sendCommand(deviceId, _issnTranslationCommands[mode]!);
  }

  @override
  Future<CommandResponse> setISMNTranslationMode({
    required String deviceId,
    required TranslationMode mode,
  }) async {
    return sendCommand(deviceId, _ismnTranslationCommands[mode]!);
  }

  @override
  Future<CommandResponse> setISBNTranslationMode({
    required String deviceId,
    required TranslationMode mode,
  }) async {
    return sendCommand(deviceId, _isbnTranslationCommands[mode]!);
  }

  @override
  Future<CommandResponse> setForcedAddon378_379_529({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command = enabled
        ? eanEnableForcedAddon378_379_529
        : eanDisableForcedAddon378_379_529;
    return sendCommand(deviceId, command);
  }

  @override
  Future<CommandResponse> setForcedAddon434_439_414_419_977_978({
    required String deviceId,
    required bool enabled,
  }) async {
    final String command = enabled
        ? eanEnableForcedAddon434_439_414_419_977_978
        : eanDisableForcedAddon434_439_414_419_977_978;
    return sendCommand(deviceId, command);
  }
}
