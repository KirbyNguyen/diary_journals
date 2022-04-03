import 'package:sqflite/sqflite.dart';
import 'package:flutter/foundation.dart';
import 'package:diary_journals/models/entry.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:diary_journals/databases/database_helper.dart';

final entrydatabaseProvider =
    ChangeNotifierProvider<EntryDatabaseHelper>((ref) {
  return EntryDatabaseHelper();
});

class EntryDatabaseHelper with ChangeNotifier {

  Future<List<Map<String, Object?>>> getAll() async {
    final Database? database = await DatabaseHelper.instance.database;
    return await database!.query(
      DatabaseHelper.entryTableName,
    );
  }

  Future<int> deleteEntry(String id) async {
    final Database? database = await DatabaseHelper.instance.database;
    int result = await database!.delete(
      DatabaseHelper.entryTableName,
      where: "id = ?",
      whereArgs: [id],
    );

    notifyListeners();

    return result;
  }

  Future<List<Map<String, Object?>>> getEntry(String id) async {
    final Database? database = await DatabaseHelper.instance.database;
    return await database!.query(
      DatabaseHelper.entryTableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> insertEntry(Entry entry) async {
    final Database? database = await DatabaseHelper.instance.database;
    int result = await database!.insert(
      DatabaseHelper.entryTableName,
      entry.toJson(),
    );

    notifyListeners();

    return result;
  }

  Future<int> updateJournal(Entry entry) async {
    final Database? database = await DatabaseHelper.instance.database;
    int result = await database!.update(
      DatabaseHelper.entryTableName,
      entry.toJson(),
      where: "id = ?",
      whereArgs: [entry.id],
    );

    notifyListeners();

    return result;
  }
}
