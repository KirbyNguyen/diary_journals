import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const databaseVersion = 1;
  static const databaseName = 'diary_entries';
  static const userTableName = 'USERS';
  static const journalTableName = 'JOUNRALS';
  static const entryTableName = 'ENTRIES';

  Database? _database;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database?> get database async {
    _database ??= await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    Directory _directory = await getApplicationDocumentsDirectory();
    String path = join(_directory.path, databaseName);
    return await openDatabase(
      path,
      version: databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("PRAGMA foreign_keys = ON;");
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $userTableName(
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        password TEXT NOT NULL,
        UNIQUE(name, password)
      );
    ''');
    await db.execute('''          
      CREATE TABLE IF NOT EXISTS $journalTableName(
        id TEXT PRIMARY KEY,
        userId TEXT NOT NULL,
        name TEXT NOT NULL,
        isPrivate INT NOT NULL,
        colorValue INT NOT NULL,
        password TEXT,
        FOREIGN KEY(userId) REFERENCES $userTableName(id)
      );
    ''');
    await db.execute('''          
      CREATE TABLE IF NOT EXISTS $entryTableName(
        id TEXT PRIMARY KEY,
        journalId TEXT NOT NULL,
        title TEXT NOT NULL,
        content TEXT NOT NULL,
        dateTime TEXT NOT NULL,
        FOREIGN KEY(journalId) REFERENCES $journalTableName(id)
      );
    ''');
  }
}
