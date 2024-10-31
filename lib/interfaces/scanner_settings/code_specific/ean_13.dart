import 'package:opticonnect_sdk/entities/command_response.dart';
import 'package:opticonnect_sdk/enums/scanner_settings/code_specific/ean_13.dart';

/// Interface for settings related to EAN-13 symbology.
///
/// Provides methods to enable or disable the transmission of check digits,
/// and to manage add-on settings for EAN-13 symbology.
abstract class EAN13 {
  Future<CommandResponse> setTransmitCD({
    required String deviceId,
    required bool enabled,
  });

  Future<CommandResponse> setAddOnPlus2({
    required String deviceId,
    required bool enabled,
  });

  Future<CommandResponse> setAddOnPlus5({
    required String deviceId,
    required bool enabled,
  });

  Future<CommandResponse> setISSNTranslationMode({
    required String deviceId,
    required TranslationMode mode,
  });

  Future<CommandResponse> setISMNTranslationMode({
    required String deviceId,
    required TranslationMode mode,
  });

  Future<CommandResponse> setISBNTranslationMode({
    required String deviceId,
    required TranslationMode mode,
  });

  Future<CommandResponse> setForcedAddon378_379_529({
    required String deviceId,
    required bool enabled,
  });

  Future<CommandResponse> setForcedAddon434_439_414_419_977_978({
    required String deviceId,
    required bool enabled,
  });
}
