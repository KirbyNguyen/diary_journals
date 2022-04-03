import 'package:sqflite/sqflite.dart';
import 'package:flutter/foundation.dart';
import 'package:diary_journals/models/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:diary_journals/databases/database_helper.dart';

final userdatabaseProvider = ChangeNotifierProvider<UserDatabaseHelper>((ref) {
  return UserDatabaseHelper();
});

class UserDatabaseHelper with ChangeNotifier {
  late Database database;

  UserDatabaseHelper() {
    database = DatabaseHelper.database!;
  }

  Future<List<Map<String, Object?>>> getAll() async {
    return await database.query(
      DatabaseHelper.userTableName,
    );
  }

  Future<int> deleteUser(String id) async {
    int result = await database.delete(
      DatabaseHelper.userTableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    notifyListeners();

    return result;
  }

  Future<List<Map<String, Object?>>> getUser(String id) async {
    return await database.query(
      DatabaseHelper.userTableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> insertUser(User user) async {
    int result = await database.insert(
      DatabaseHelper.userTableName,
      user.toJson(),
    );

    notifyListeners();

    return result;
  }

  Future<int> updateUser(User user) async {
    int result = await database.update(
      DatabaseHelper.userTableName,
      user.toJson(),
      where: 'id = ?',
      whereArgs: [user.id],
    );

    notifyListeners();

    return result;
  }
}
