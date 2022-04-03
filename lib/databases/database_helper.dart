import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const databaseVersion = 1;
  static const databaseName = 'diary_entries';
  static const userTableName = 'USERS';
  static const journalTableName = 'JOUNRALS';
  static const entryTableName = 'ENTRIES';

  static Database? database;

  Future<Database?> initDatabase() async {
    final dbPath = await getDatabasesPath();
    database = await openDatabase(
      join(dbPath, databaseName),
      onCreate: (db, version) {
        final stmt = '''
          PRAGMA foreign_keys = ON;
          CREATE TABLE IF NOT EXISTS $userTableName (
            id TEXT PRIMARY KEY,
            name TEXT NOT NULL,
            password TEXT NOT NULL
          );
          CREATE TABLE IF NOT EXISTS $journalTableName(
            id TEXT PRIMARY KEY,
            userId TEXT NOT NULL,
            name TEXT NOT NULL,
            isPrivate INT NOT NULL,
            colorValue INT NOT NULL,
            password TEXT,
            FOREIGN KEY(userId) REFERENCES $userTableName(id)
          );
          CREATE TABLE IF NOT EXISTS $entryTableName(
            id TEXT PRIMARY KEY,
            journalId TEXT NOT NULL,
            title TEXT NOT NULL,
            content TEXT NOT NULL,
            dateTime TEXT NOT NULL,
            FOREIGN KEY(journalId) REFERENCES $journalTableName(id)
          );
          '''
            .trim()
            .replaceAll(RegExp(r'[\s]{2,}'), ' ');
        return db.execute(stmt);
      },
      version: databaseVersion,
    );

    return database;
  }

  Future<Database?> getDatabaseConnect() async {
    if (database != null) {
      return database;
    } else {
      return await initDatabase();
    }
  }

  Future<void> close() async => await database!.close();
}
