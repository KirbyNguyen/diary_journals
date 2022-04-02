import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DatabaseHelperProvider with ChangeNotifier {
  static const databaseVersion = 1;
  static const databaseName = 'diary_entries';
  static const userTableName = 'USERS';
  static const journalTableName = 'JOUNRALS';
  static const entryTableName = 'ENTRIES';

  late sql.Database db;

  DatabaseProvider() {
    init();
  }

  void init() async {
    final dbPath = await sql.getDatabasesPath();
    db = await sql.openDatabase(
      path.join(dbPath, databaseName),
      onCreate: (db, version) {
        // final stmt = '''CREATE TABLE IF NOT EXISTS $tableName (
        //     id TEXT PRIMARY KEY,
        //     title TEXT,
        //     image TEXT
        // )'''
        //     .trim()
        //     .replaceAll(RegExp(r'[\s]{2,}'), ' ');
        // return db.execute(stmt);
      },
      version: 1,
    );
    // the init funciton is async so it won't block the main thread
    // notify provider that depends on it when done
    notifyListeners();
  }
}
