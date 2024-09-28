import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/settings_base.dart';

/// Enum representing the translation modes for ISSN, ISMN, and ISBN.
enum TranslationMode {
  /// Disable the translation.
  disable,

  /// Enable the translation.
  enable,

  /// Enable translation if possible.
  enableIfPossible,
}

/// A class representing settings for EAN-13 symbology.
///
/// This class provides methods to enable or disable the transmission of check digits,
/// and to manage add-on settings for EAN-13 symbology.
@lazySingleton
class EAN13 extends SettingsBase {
  /// A map linking the translation modes for ISSN to their respective command strings.
  final Map<TranslationMode, String> _issnTranslationCommands = {
    TranslationMode.disable: eanDisableISSNTranslation,
    TranslationMode.enable: eanEnableISSNTranslation,
    TranslationMode.enableIfPossible: eanEnableISSNIfPossible,
  };

  /// A map linking the translation modes for ISMN to their respective command strings.
  final Map<TranslationMode, String> _ismnTranslationCommands = {
    TranslationMode.disable: eanDisableISMNTranslation,
    TranslationMode.enable: eanEnableISMNTranslation,
    TranslationMode.enableIfPossible: eanEnableISMNIfPossible,
  };

  /// A map linking the translation modes for ISBN to their respective command strings.
  final Map<TranslationMode, String> _isbnTranslationCommands = {
    TranslationMode.disable: eanDisableISBNTranslation,
    TranslationMode.enable: eanEnableISBNTranslation,
    TranslationMode.enableIfPossible: eanEnableISBNIfPossible,
  };

  /// Sets the transmission of the check digit for EAN-13 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the transmission of the check digit.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setTransmitCD(String deviceId,
      {required bool enabled}) async {
    final String command = enabled ? ean13TransmitCd : ean13DoNotTransmitCd;
    return sendCommand(deviceId, command);
  }

  /// Sets the 2-character add-on for EAN-13 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the 2-character add-on.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setAddOnPlus2(String deviceId,
      {required bool enabled}) async {
    final String command = enabled ? enableEAN13Plus2 : disableEAN13Plus2;
    return sendCommand(deviceId, command);
  }

  /// Sets the 5-character add-on for EAN-13 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the 5-character add-on.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setAddOnPlus5(String deviceId,
      {required bool enabled}) async {
    final String command = enabled ? enableEAN13Plus5 : disableEAN13Plus5;
    return sendCommand(deviceId, command);
  }

  /// If enabled, EAN-13 label is verified for the correct format and transmitted as an 8 digit ISSN number.
  /// [deviceId] - The identifier of the target device.
  /// [mode] - The desired ISSN translation mode.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> setISSNTranslationMode(
      String deviceId, TranslationMode mode) async {
    return sendCommand(deviceId, _issnTranslationCommands[mode]!);
  }

  /// Sets the translation mode for ISMN in EAN-13 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [mode] - The desired ISMN translation mode.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> setISMNTranslationMode(
      String deviceId, TranslationMode mode) async {
    return sendCommand(deviceId, _ismnTranslationCommands[mode]!);
  }

  /// If enabled, EAN-13 label is verified for the correct format and transmitted as a 10 digit ISBN number.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [mode] - The desired ISBN translation mode.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> setISBNTranslationMode(
      String deviceId, TranslationMode mode) async {
    return sendCommand(deviceId, _isbnTranslationCommands[mode]!);
  }

  /// Sets the forced add-on for EAN symbology with 378, 379, and 529 prefixes.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the forced add-on for these prefixes.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setForcedAddon378_379_529(String deviceId,
      {required bool enabled}) async {
    final String command = enabled
        ? eanEnableForcedAddon378_379_529
        : eanDisableForcedAddon378_379_529;
    return sendCommand(deviceId, command);
  }

  /// Sets the forced add-on for EAN-13 symbology with 434, 439, 414, 419, 977, and 978 prefixes.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the forced add-on for these prefixes.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setForcedAddon434_439_414_419_977_978(String deviceId,
      {required bool enabled}) async {
    final String command = enabled
        ? eanEnableForcedAddon434_439_414_419_977_978
        : eanDisableForcedAddon434_439_414_419_977_978;
    return sendCommand(deviceId, command);
  }
}
