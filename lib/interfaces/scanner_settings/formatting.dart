part of 'package:opticonnect_sdk/interfaces/interfaces.dart';

/// Responsible for configuring formatting options like preambles, prefixes, suffixes, and postambles.
///
/// Allows setting these options using direct input keys or strings and sends the corresponding commands to the BLE device.
abstract class Formatting {
  /// Sets the preamble formatting using a list of [DirectInputKey].
  ///
  /// [deviceId] - The identifier of the target device.
  /// [keys] - A list of [DirectInputKey] values for the preamble, with a maximum length of 8.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setPreambleFromKeys(
      {required String deviceId, required List<DirectInputKey> keys});

  /// Sets the preamble formatting using a string.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [preamble] - A string used as the preamble, with a maximum length of 8.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setPreambleFromString(
      {required String deviceId, required String preamble});

  /// Clears the preamble formatting on the device.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> clearPreamble(String deviceId);

  /// Sets the prefix formatting using a list of [DirectInputKey].
  ///
  /// [deviceId] - The identifier of the target device.
  /// [keys] - A list of [DirectInputKey] values for the prefix, with a maximum length of 4.
  /// [symbology] - The [FormattableSymbology] to apply the prefix for.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setPrefixFromKeys({
    required String deviceId,
    required List<DirectInputKey> keys,
    FormattableSymbology symbology = FormattableSymbology.allCodes,
  });

  /// Sets the prefix formatting using a string.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [prefix] - A string for the prefix, with a maximum length of 4.
  /// [symbology] - The [FormattableSymbology] to apply the prefix for.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setPrefixFromString({
    required String deviceId,
    required String prefix,
    FormattableSymbology symbology = FormattableSymbology.allCodes,
  });

  /// Clears the prefix formatting on the device.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> clearAllPrefixes(String deviceId);

  /// Sets the suffix formatting using a list of [DirectInputKey].
  ///
  /// [deviceId] - The identifier of the target device.
  /// [keys] - A list of [DirectInputKey] values for the suffix, with a maximum length of 4.
  /// [symbology] - The [FormattableSymbology] to apply the suffix for.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setSuffixFromKeys({
    required String deviceId,
    required List<DirectInputKey> keys,
    FormattableSymbology symbology = FormattableSymbology.allCodes,
  });

  /// Sets the suffix formatting using a string.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [suffix] - A string for the suffix, with a maximum length of 4.
  /// [symbology] - The [FormattableSymbology] to apply the suffix for.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setSuffixFromString({
    required String deviceId,
    required String suffix,
    FormattableSymbology symbology = FormattableSymbology.allCodes,
  });

  /// Clears the suffix formatting on the device.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> clearAllSuffixes(String deviceId);

  /// Sets the postamble formatting using a list of [DirectInputKey].
  ///
  /// [deviceId] - The identifier of the target device.
  /// [keys] - A list of [DirectInputKey] values for the postamble, with a maximum length of 8.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setPostambleFromKeys(
      {required String deviceId, required List<DirectInputKey> keys});

  /// Sets the postamble formatting using a string.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [postamble] - A string for the postamble, with a maximum length of 8.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> setPostambleFromString(
      {required String deviceId, required String postamble});

  /// Clears the postamble formatting on the device.
  ///
  /// [deviceId] - The identifier of the target device.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the operation.
  Future<CommandResponse> clearPostamble(String deviceId);
}
