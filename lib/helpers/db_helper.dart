import 'package:sqflite/sqflite.dart' as sql;
import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Future<sql.Database> database() async {
    Directory documentsDirectory = await getExternalStorageDirectory();
    String path = join(documentsDirectory.path, "campus-connect.db");
    return openDatabase(
      path,
      onCreate: (db, version) => db.execute(
        'CREATE TABLE ChatMessages(id TEXT PRIMARY KEY, userId TEXT, username TEXT, message TEXT, subjectName TEXT)',
      ),
      version: 2,
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }
}