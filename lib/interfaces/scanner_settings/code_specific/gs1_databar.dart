part of 'package:opticonnect_sdk/interfaces.dart';

/// Interface for settings related to GS1 Databar symbology.
///
/// Provides methods to manage the transmission of check digits and AI (Application Identifier) settings.
abstract class GS1Databar {
  Future<CommandResponse> setTransmitCD({
    required String deviceId,
    required bool enabled,
  });

  Future<CommandResponse> setTransmitAI({
    required String deviceId,
    required bool enabled,
  });
}
