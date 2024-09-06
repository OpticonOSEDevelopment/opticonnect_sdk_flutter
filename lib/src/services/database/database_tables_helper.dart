import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@lazySingleton
class DatabaseTablesHelper {
  Future<List<String>> getTables(Database database) async {
    final tables = await database.rawQuery(
      '''
      SELECT 
          name
      FROM 
          sqlite_master
      WHERE 
          type ='table' AND 
      name NOT LIKE 'sqlite_%' AND name NOT LIKE 'android_%';
      ''',
    );

    final List<String> tablesList = [];

    for (final t in tables) {
      final table = t['name'] as String?;
      if (table != null) {
        tablesList.add(table);
      }
    }

    return tablesList;
  }

  Future<bool> containsTable(
    Database database,
    String tableName,
  ) async {
    final tables = await getTables(database);
    return tables.contains(tableName);
  }
}
