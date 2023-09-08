import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_lectine_pal/models/fooditem_model.dart';
import 'package:flutter_application_lectine_pal/provider/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

class DatabaseHelper {
  static const _dbName = 'food_database.db';
  static const _dbVersion = 1;
  static const _tableName = 'food';

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  DatabaseHelper._privateConstructor();
  static Database? database;

  initDataBase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    debugPrint('path: $path');
    if (database != null) {
      return database;
    }
    database =
        await openDatabase(path, version: _dbVersion, onCreate: _onCreate);

    return database;
  }

  _onCreate(Database db, int version) {
    debugPrint('running onCreate');
    db.execute(
        """CREATE TABLE IF NOT EXISTS food ("id" INTEGER PRIMARY KEY AUTOINCREMENT,"type" TEXT NOT NULL,"category" TEXT NOT NULL,"name" TEXT NOT NULL);""");
  }

  insert({required FoodItem item}) async {
    var db = await initDataBase();

    await db.rawQuery(
        """INSERT INTO food (type, category, name) VALUES (?,?,?)""",
        [item.type, item.category, item.name]);
  }

  truncateData() async {
    var db = await initDataBase();
    await db.rawQuery("""DELETE FROM food""");
    await db.rawQuery("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME='food'");
  }

  Future<List<FoodItem>> getAll() async {
    var db = await initDataBase();
    List<FoodItem> items = [];
    var list = await db.rawQuery("SELECT * from food");
    //await db.rawQuery('SELECT * FROM $_tableName WHERE type = ?', [type]);

    for (var listItem in list) {
      FoodItem item = FoodItem.fromJson(listItem);
      items.add(item);
    }
    return items;
  }

  getType(
      {required WidgetRef ref,
      required String type,
      required String category}) async {
    ref.read(foodItemChangeProvider.notifier).deleteAll();
    // List<FoodItem> items = [];
    var db = await initDataBase();
    var response = await await db.rawQuery(
        'SELECT * FROM food WHERE type = ? AND category = ?', [type, category]);
    for (var listItem in response) {
      FoodItem item = FoodItem.fromJson(listItem);
      //debugPrint('item in for: $item');
      ref.read(foodItemChangeProvider.notifier).addItem(item);
    }
  }

  Future<int> update(Map<String, dynamic> row, int columnId) async {
    Database db = initDataBase();
    int id = row[columnId];
    return await db.update(_tableName, row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = initDataBase();
    return await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }
}
