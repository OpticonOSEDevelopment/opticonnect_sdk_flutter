import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/entities/command_data.dart';
import 'package:opticonnect_sdk/src/entities/command.dart';
import 'package:opticonnect_sdk/src/entities/raw_command.dart';
import 'package:opticonnect_sdk/src/services/scanner_settings/datawizard_helper.dart';
import 'package:opticonnect_sdk/src/services/scanner_settings/settings_handler.dart';

@lazySingleton
class SettingsCompressor {
  final SettingsHandler _settingsHandler;
  final DataWizardHelper _datawizardHelper;

  SettingsCompressor(this._settingsHandler, this._datawizardHelper);

  Future<Command> getCompressedSettingsCommand(String settings) async {
    final compressedSettingsList = await getCompressedSettingsList(settings);

    StringBuffer compressedCommandData = StringBuffer();
    for (final commandData in compressedSettingsList) {
      compressedCommandData.write(commandData.command);
      for (final parameter in commandData.parameters) {
        compressedCommandData.write(parameter);
      }
    }
    return RawCommand(compressedCommandData.toString(), sendFeedback: false);
  }

  bool _isDirectInputCommand(String command) {
    return _settingsHandler.isDirectInputKey(command) || command[0] == '\$';
  }

  Future<void> _addCommandToCompressedList(
      CommandData commandData, List<CommandData> compressedList) async {
    final groupsToDisable =
        _settingsHandler.getGroupsToDisableForCode(commandData.command);

    compressedList.removeWhere((e) {
      if (e.command == commandData.command) {
        return true;
      }

      if (groupsToDisable.isNotEmpty) {
        final groupsForCode = _settingsHandler.getGroupsForCode(e.command);
        if (groupsForCode.isNotEmpty) {
          return groupsToDisable.any((g) => groupsForCode.contains(g));
        }
      }

      return false;
    });

    compressedList.add(commandData);
  }

  Future<List<CommandData>> _compressCommandList(
      List<CommandData> commandList) async {
    List<CommandData> compressedList = [];

    for (final commandData in commandList) {
      await _addCommandToCompressedList(commandData, compressedList);
    }

    return compressedList;
  }

  Future<List<CommandData>> getCompressedSettingsList(String settings) async {
    final List<CommandData> commandsList = [];
    for (int i = 0; i < settings.length; i++) {
      final currentChar = settings[i];
      if (currentChar == '[') {
        commandsList.add(CommandData(settings.substring(i, i + 4)));
        i += 3;
      } else if (currentChar == ']') {
        commandsList.add(CommandData(settings.substring(i, i + 5)));
        i += 4;
      } else if (currentChar == "'") {
        final start = i;
        i++; // Move to the next character after opening quote
        while (i < settings.length &&
            settings.codeUnitAt(i) != "'".codeUnitAt(0)) {
          i++;
        }
        // Add the entire quoted string (inclusive of quotes) as parameter
        final parameter =
            settings.substring(start, i + 1); // Include the closing quote
        if (commandsList.isNotEmpty) {
          commandsList.last.parameters.add(parameter);
        }
      } else {
        commandsList.add(CommandData(settings.substring(i, i + 2)));
        i++;
      }

      if (commandsList.isNotEmpty &&
              _isDirectInputCommand(commandsList.last.command) ||
          _datawizardHelper.isDataWizardParameter(commandsList.last.command)) {
        final parameter = commandsList.last.command;
        commandsList.removeLast();
        if (commandsList.isNotEmpty) {
          commandsList.last.parameters.add(parameter);
        }
      }
    }

    return await _compressCommandList(commandsList);
  }
}
