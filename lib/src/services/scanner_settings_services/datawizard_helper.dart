import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/constants/commands_constants.dart';

@lazySingleton
class DataWizardHelper {
  final Set<String> _dataWizardCommands = {
    dataWizardConfiguration0,
    dataWizardConfiguration1,
    dataWizardConfiguration2,
    dataWizardConfiguration3,
    dataWizardConfiguration4,
    dataWizardConfiguration5,
    dataWizardConfiguration6,
    dataWizardConfiguration7,
    dataWizardEnableConfiguration0,
    dataWizardEnableConfiguration1,
    dataWizardEnableConfiguration2,
    dataWizardEnableConfiguration3,
    dataWizardEnableConfiguration4,
    dataWizardEnableConfiguration5,
    dataWizardEnableConfiguration6,
    dataWizardEnableConfiguration7,
    dataWizardDisableConfiguration0,
    dataWizardDisableConfiguration1,
    dataWizardDisableConfiguration2,
    dataWizardDisableConfiguration3,
    dataWizardDisableConfiguration4,
    dataWizardDisableConfiguration5,
    dataWizardDisableConfiguration6,
    dataWizardDisableConfiguration7,
    dataWizardEnableUnprocessedBeep,
    dataWizardDisableUnprocessedBeep,
    dataWizardReset,
    dataWizardTransmitConfigurationSettings,
    dataWizardTransmitAllBarcodes,
    dataWizardTransmitValidatedBarcodes
  };

  bool _isDataWizardCommand(String command) {
    return _dataWizardCommands.contains(command);
  }

  bool isDataWizardParameter(String candidate) {
    return (candidate.startsWith(dataWizardCommandPrefix0) ||
            candidate.startsWith(dataWizardCommandPrefix1)) &&
        !_isDataWizardCommand(candidate);
  }
}
