import 'package:sqflite/sqflite.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:diary_journals/models/journal.dart';
import 'package:diary_journals/databases/database_helper.dart';

final journaldatabaseProvider =
    ChangeNotifierProvider<JournalDatabaseHelper>((ref) {
  return JournalDatabaseHelper();
});

class JournalDatabaseHelper with ChangeNotifier {

  Future<List<Map<String, Object?>>> getAll() async {
    final Database? database = await DatabaseHelper.instance.database;
    return await database!.query(
      DatabaseHelper.journalTableName,
    );
  }

  Future<int> deleteJournal(String id) async {
    final Database? database = await DatabaseHelper.instance.database;
    int result = await database!.delete(
      DatabaseHelper.journalTableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    notifyListeners();

    return result;
  }

  Future<Map<String, Object?>> getJournal(String id) async {
    final Database? database = await DatabaseHelper.instance.database;
    List<Map<String, Object?>> journalList = await database!.query(
      DatabaseHelper.journalTableName,
      where: "id = ?",
      whereArgs: [id],
    );

    return journalList.first;
  }

  Future<int> insertJournal(Journal journal) async {
    final Database? database = await DatabaseHelper.instance.database;
    int result = await database!.insert(
      DatabaseHelper.journalTableName,
      journal.toJson(),
    );

    notifyListeners();

    return result;
  }

  Future<int> updateJournal(Journal journal) async {
    final Database? database = await DatabaseHelper.instance.database;
    int result = await database!.update(
      DatabaseHelper.journalTableName,
      journal.toJson(),
      where: "id = ?",
      whereArgs: [journal.id],
    );

    notifyListeners();

    return result;
  }
}
