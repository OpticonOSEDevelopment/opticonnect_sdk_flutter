part of 'package:opticonnect_sdk/interfaces/interfaces.dart';

/// Interface for managing Codabar-specific settings on the scanner.
///
/// Provides methods for configuring Codabar-related settings such as enabling or disabling
/// check digits, transmitting start and stop characters, and setting the Codabar mode.
abstract class Codabar {
  /// Sets the Codabar mode for the scanner.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [mode] - The Codabar mode to set.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> setMode(
      {required String deviceId, required CodabarMode mode});

  /// Sets the check digit state for Codabar symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the check digit.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> setCheckCD(
      {required String deviceId, required bool enabled});

  /// Sets the transmission state of the check digit for Codabar symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the transmission of the check digit.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> setTransmitCD(
      {required String deviceId, required bool enabled});

  /// Sets the space insertion mode between characters in Codabar symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) space insertion.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> setSpaceInsertion(
      {required String deviceId, required bool enabled});

  /// Sets the minimum data length for Codabar symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [length] - The minimum data length to set.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> setMinimumLength(
      {required String deviceId, required CodabarMinimumLength length});

  /// Sets the intercharacter gap check mode for Codabar symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [enabled] - A boolean indicating whether to enable (`true`) or disable (`false`) the intercharacter gap check.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> setIntercharacterGapCheck(
      {required String deviceId, required bool enabled});

  /// Sets the start and stop character transmission mode for Codabar symbology.
  ///
  /// [deviceId] - The identifier of the target device.
  /// [transmission] - The start and stop character transmission mode.
  ///
  /// Returns a [CommandResponse] indicating the success or failure of the command.
  Future<CommandResponse> setStartStopTransmission(
      {required String deviceId,
      required CodabarStartStopTransmission transmission});
}
