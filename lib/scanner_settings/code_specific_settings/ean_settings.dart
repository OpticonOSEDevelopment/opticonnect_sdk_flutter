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

/// A class representing settings for EAN symbology (EAN-8 and EAN-13).
///
/// This class provides methods to configure the ISSN, ISMN, ISBN translation settings,
/// and forced add-on configurations for EAN-8 and EAN-13 symbologies.
class EANSettings extends BaseScannerSettings {
  EANSettings(super.sdk);

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

  /// Sets the translation mode for ISSN in EAN symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [mode] - The desired ISSN translation mode.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> setISSNTranslationMode(
      String deviceId, TranslationMode mode) async {
    return sendCommand(deviceId, _issnTranslationCommands[mode]!);
  }

  /// Sets the translation mode for ISMN in EAN symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [mode] - The desired ISMN translation mode.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> setISMNTranslationMode(
      String deviceId, TranslationMode mode) async {
    return sendCommand(deviceId, _ismnTranslationCommands[mode]!);
  }

  /// Sets the translation mode for ISBN in EAN symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [mode] - The desired ISBN translation mode.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> setISBNTranslationMode(
      String deviceId, TranslationMode mode) async {
    return sendCommand(deviceId, _isbnTranslationCommands[mode]!);
  }

  /// Enables forced add-on for EAN symbology with 378, 379, and 529 codes.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> enableForcedAddon378_379_529(String deviceId) async {
    return sendCommand(deviceId, eanEnableForcedAddon378_379_529);
  }

  /// Disables forced add-on for EAN symbology with 378, 379, and 529 codes.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> disableForcedAddon378_379_529(String deviceId) async {
    return sendCommand(deviceId, eanDisableForcedAddon378_379_529);
  }

  /// Enables forced add-on for EAN symbology with 434, 439, 414, 419, 977, and 978 codes.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> enableForcedAddon434_439_414_419_977_978(
      String deviceId) async {
    return sendCommand(deviceId, eanEnableForcedAddon434_439_414_419_977_978);
  }

  /// Disables forced add-on for EAN symbology with 434, 439, 414, 419, 977, and 978 codes.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> disableForcedAddon434_439_414_419_977_978(
      String deviceId) async {
    return sendCommand(deviceId, eanDisableForcedAddon434_439_414_419_977_978);
  }
}
