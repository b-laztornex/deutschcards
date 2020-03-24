import 'dart:io';

import 'package:flutter/services.dart';
import 'package:german_card/model/menu_model.dart';
import 'package:german_card/model/verb_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Database db;

class DatabaseUtils {
  static const verbTable = 'verb';
  static const infinitiv = '';
  static const present = '';
  static const perfect = '';
  static const preterite = '';
  static const type = '';
  static const meaning = '';
  static const translation = '';
  static const image = '';
  static const level = '';

  static void databaseLog(String functionName, String sql,
      [List<Map<String, dynamic>> selectQueryResult,
      int insertAndUpdateQueryResult,
      List<dynamic> params]) {
    print(functionName);
    print(sql);
    if (params != null) {
      print(params);
    }
    if (selectQueryResult != null) {
      print(selectQueryResult);
    } else if (insertAndUpdateQueryResult != null) {
      print(insertAndUpdateQueryResult);
    }
  }

  Future<void> initDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "deutsch.db");

    await deleteDatabase(path);

    

    // Check if the database exists
    var exists = await databaseExists(path);

    print(exists);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "deutsch.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }
    db = await openDatabase(path, readOnly: true);
  }

  static Future<List<VerbModel>> getVerbs(String lvl) async {
    final sql = "SELECT * FROM verb WHERE level = '$lvl'";
    final data = await db.rawQuery(sql);
    final verb = data.map((i) => VerbModel.fromMap(i)).toList();
    return verb;
  }

  static Future<List<MenuModel>> getMenu() async {
    final sql = "SELECT * FROM menu";
    final data = await db.rawQuery(sql);
    final menu = data.map((i) => MenuModel.fromMap(i)).toList();
    return menu;
  }
}
