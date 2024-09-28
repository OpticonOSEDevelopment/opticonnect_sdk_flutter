import 'dart:io';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/src/services/database/database_path_helper.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

@lazySingleton
class DatabaseManager {
  final DatabasePathHelper _databasePathHelper;
  static const String dbName = 'commands.db';
  static const String dbPath =
      'packages/opticonnect_sdk/assets/database/$dbName';

  Database? _database;

  DatabaseManager(this._databasePathHelper);

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    return await _initializeDatabase();
  }

  Future<Database> _initializeDatabase() async {
    if (Platform.isWindows || Platform.isLinux) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }

    final databasePath = path.join(
      await _databasePathHelper.getDatabasesPath(),
      dbName,
    );

    if (!await Directory(path.dirname(databasePath)).exists()) {
      await Directory(path.dirname(databasePath)).create(recursive: true);
    }

    await deleteDatabase(databasePath);

    final bytes = await rootBundle.load(dbPath);
    await File(databasePath)
        .writeAsBytes(bytes.buffer.asUint8List(), flush: true);

    _database = await databaseFactory.openDatabase(
      databasePath,
      options: OpenDatabaseOptions(readOnly: true),
    );

    return _database!;
  }

  Future<void> closeDatabase() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }
}
