import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';
import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/src/scanner_settings/base_scanner_settings.dart';

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
class EAN13Settings extends BaseScannerSettings {
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

  /// Enables the transmission of the check digit for EAN-13 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, ean13TransmitCd);
  }

  /// Disables the transmission of the check digit for EAN-13 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableTransmitCD(String deviceId) async {
    return sendCommand(deviceId, ean13DoNotTransmitCd);
  }

  /// Enables the 2-character add-on for EAN-13 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableAddOnPlus2(String deviceId) async {
    return sendCommand(deviceId, enableEAN13Plus2);
  }

  /// Disables the 2-character add-on for EAN-13 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableAddOnPlus2(String deviceId) async {
    return sendCommand(deviceId, disableEAN13Plus2);
  }

  /// Enables the 5-character add-on for EAN-13 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> enableAddOnPlus5(String deviceId) async {
    return sendCommand(deviceId, enableEAN13Plus5);
  }

  /// Disables the 5-character add-on for EAN-13 symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> disableAddOnPlus5(String deviceId) async {
    return sendCommand(deviceId, disableEAN13Plus5);
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

  /// Enables forced add-on for EAN symbology with 378, 379, and 529 prefixes.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> enableForcedAddon378_379_529(String deviceId) async {
    return sendCommand(deviceId, eanEnableForcedAddon378_379_529);
  }

  /// Disables forced add-on for EAN symbology with 378, 379, and 529 prefixes.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> disableForcedAddon378_379_529(String deviceId) async {
    return sendCommand(deviceId, eanDisableForcedAddon378_379_529);
  }

  /// Enables forced add-on for EAN-13 symbology with 434, 439, 414, 419, 977, 978 prefixes.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> enableForcedAddon434_439_414_419_977_978(
      String deviceId) async {
    return sendCommand(deviceId, eanEnableForcedAddon434_439_414_419_977_978);
  }

  /// Disables forced add-on for EAN-13 symbology with 434, 439, 414, 419, 977, 978 prefixes.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> disableForcedAddon434_439_414_419_977_978(
      String deviceId) async {
    return sendCommand(deviceId, eanDisableForcedAddon434_439_414_419_977_978);
  }
}
