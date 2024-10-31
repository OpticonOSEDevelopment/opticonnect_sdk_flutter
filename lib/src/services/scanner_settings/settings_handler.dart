import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/src/interfaces/app_logger.dart';
import 'package:opticonnect_sdk/src/services/database/constants/database_fields.dart';
import 'package:opticonnect_sdk/src/services/database/database_tables_helper.dart';
import 'package:opticonnect_sdk/src/services/scanner_settings/database_manager.dart';
import 'package:sqflite/sqflite.dart';

@lazySingleton
class SettingsHandler {
  final DatabaseTablesHelper _databaseTablesHelper;
  final DatabaseManager _databaseManager;
  final AppLogger _appLogger;

  SettingsHandler(
    this._databaseTablesHelper,
    this._databaseManager,
    this._appLogger,
  );

  final Map<String, List<String>> _groupsForCode = {};
  final Map<String, List<String>> _dimensionsForCode = {};
  final Map<String, List<String>> _codesForGroup = {};
  final Map<String, List<String>> _groupsToEnableForCode = {};
  final Map<String, List<String>> _groupsToDisableForCode = {};
  final Map<String, List<String>> _defaultScannerSettings = {};
  final Map<String, String> _descriptionForCode = {};
  final Map<String, String> _charToDirectInputKey = {};

  Set<String> _directInputKeysSet = {};
  List<String> _directInputKeys = [];

  Future<void> initialize() async {
    try {
      final database = await _databaseManager.database;
      await _initializeCodesDataStructures(database);
      await _setDescriptions(database);
      await _setDirectInputKeys();
      await _databaseManager.closeDatabase();
    } catch (e) {
      _appLogger.error('Failed to initialize ScannerSettingsHandler: $e');
    }
  }

  bool isDirectInputKey(String code) {
    return _directInputKeysSet.contains(code);
  }

  String _getStrippedCode(String code) {
    return code.startsWith('[') || code.startsWith(']')
        ? code.substring(1)
        : code;
  }

  List<String> getGroupsToDisableForCode(String code) {
    return [...?_groupsToDisableForCode[_getStrippedCode(code)]];
  }

  List<String> getGroupsForCode(String code) {
    return [...?_groupsForCode[_getStrippedCode(code)]];
  }

  List<String> _convertCommaSeparatedToLowerCaseList(String commaSeparated) {
    return commaSeparated
        .split(',')
        .where((g) => g.isNotEmpty)
        .map((g) => g.trim().toLowerCase())
        .toList();
  }

  Future<void> _initializeCodesDataStructures(Database database) async {
    try {
      final tables = await _databaseTablesHelper.getTables(database);
      for (final table in tables) {
        try {
          final data = await database.rawQuery("SELECT * FROM $table");
          if (data.isEmpty || !data.first.containsKey(codeField)) {
            continue;
          }
          for (final row in data) {
            final code = row[codeField] as String?;
            final descriptionKey = row[descriptionKeyField] as String?;
            final groupsString = (row[groupsField] as String?) ?? '';
            final dimensionsString = (row[dimensionsField] as String?) ?? '';
            final enablesGroupsString =
                (row[enablesGroupsField] as String?) ?? '';
            final disablesGroupsString =
                (row[disablesGroupsField] as String?) ?? '';

            if (code != null && descriptionKey != null) {
              final groups =
                  _convertCommaSeparatedToLowerCaseList(groupsString);
              _groupsForCode[code] = groups;
              final dimensions =
                  _convertCommaSeparatedToLowerCaseList(dimensionsString);
              _dimensionsForCode[code] = dimensions;
              final enablesGroups =
                  _convertCommaSeparatedToLowerCaseList(enablesGroupsString);
              final disablesGroups =
                  _convertCommaSeparatedToLowerCaseList(disablesGroupsString);
              for (final group in groups) {
                if (!_codesForGroup.containsKey(group)) {
                  _codesForGroup[group] = [];
                }
                _codesForGroup[group]!.add(code);
              }
              _groupsToEnableForCode[code] = enablesGroups;
              _groupsToDisableForCode[code] = disablesGroups;
            }
          }
        } catch (e) {
          _appLogger.error('Failed to process table $table: $e');
        }
      }

      final defaultCodes = _codesForGroup[defaultField];
      if (defaultCodes != null) {
        for (final code in defaultCodes) {
          _defaultScannerSettings[code] = [];
        }
      }
    } catch (e) {
      _appLogger.error('Failed to initialize code data structures: $e');
    }
  }

  Future<void> _setDescriptions(Database database) async {
    try {
      final tables = await _databaseTablesHelper.getTables(database);
      for (final table in tables) {
        try {
          final data = await database.rawQuery("SELECT * FROM $table");
          if (data.isEmpty || !data.first.containsKey(codeField)) {
            continue;
          }
          for (final row in data) {
            final code = row[codeField] as String?;
            final descriptionKey = row[descriptionKeyField] as String?;

            if (code != null && descriptionKey != null) {
              _descriptionForCode[code] = descriptionKey;
            }
          }
        } catch (e) {
          _appLogger.error('Failed to set descriptions for table $table: $e');
        }
      }
    } catch (e) {
      _appLogger.error('Failed to set descriptions: $e');
    }
  }

  Future<void> _setDirectInputKeys() async {
    try {
      _directInputKeys =
          _codesForGroup[directInputKeysField.toLowerCase()] ?? [];
      _directInputKeysSet = _directInputKeys.toSet();

      for (final key in _directInputKeys) {
        final description = _descriptionForCode[key];
        if (description != null && description.length == 1) {
          _charToDirectInputKey[description] = key;
        }
      }
    } catch (e, stackTrace) {
      _appLogger.error('Failed to set direct input keys: $e');
      _appLogger.error(stackTrace.toString());
    }
  }
}
