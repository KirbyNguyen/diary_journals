import 'package:sqflite/sqflite.dart';
import 'package:flutter/foundation.dart';
import 'package:diary_journals/models/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:diary_journals/databases/database_helper.dart';

final userDatabaseProvider = ChangeNotifierProvider<UserDatabaseHelper>((ref) {
  return UserDatabaseHelper();
});

class UserDatabaseHelper with ChangeNotifier {
  Future<List<Map<String, Object?>>> getAll() async {
    final Database? database = await DatabaseHelper.instance.database;
    return await database!.query(
      DatabaseHelper.userTableName,
    );
  }

  Future<int> deleteUser(String id) async {
    final Database? database = await DatabaseHelper.instance.database;
    int result = await database!.delete(
      DatabaseHelper.userTableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    notifyListeners();

    return result;
  }

  Future<Map<String, Object?>> getUser(String id) async {
    final Database? database = await DatabaseHelper.instance.database;
    List<Map<String, Object?>> userList = await database!.query(
      DatabaseHelper.userTableName,
      where: "id = ?",
      whereArgs: [id],
    );

    return userList.first;
  }

  Future<Map<String, Object?>> authUser(String name, String password) async {
    final Database? database = await DatabaseHelper.instance.database;
    List<Map<String, Object?>> userList = await database!.query(
      DatabaseHelper.userTableName,
      where: 'name = ? AND password = ?',
      whereArgs: [name, password],
    );

    return userList.first;
  }

  Future<int> insertUser(User user) async {
    final Database? database = await DatabaseHelper.instance.database;
    int result = await database!.insert(
      DatabaseHelper.userTableName,
      user.toJson(),
    );

    notifyListeners();

    return result;
  }

  Future<int> updateUser(User user) async {
    final Database? database = await DatabaseHelper.instance.database;
    int result = await database!.update(
      DatabaseHelper.userTableName,
      user.toJson(),
      where: "id = ?",
      whereArgs: [user.id],
    );

    notifyListeners();

    return result;
  }
}
