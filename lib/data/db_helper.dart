import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
class DbTables{
  static const String Categories = "Categories";
  static const String Transactions = "MyTransaction";
  static const String Goal = "Goal";
}
String _catTbl = 'CREATE TABLE ${DbTables.Categories} (CatId INTEGER PRIMARY KEY AUTOINCREMENT, CatName TEXT  NULL UNIQUE, CatIcon INTEGER, Type INTEGER )';
String _transTbl = '''CREATE TABLE ${DbTables.Transactions} (TransId INTEGER PRIMARY KEY AUTOINCREMENT, TransName TEXT NOT NULL, Total REAL NOT NULL, TransDate INTEGER, CatId INTEGER NOT NULL, FOREIGN KEY (CatId) REFERENCES ${DbTables.Categories} (CatId) )''';
String _planTbl = '''CREATE TABLE ${DbTables.Goal} (GoalId INTEGER PRIMARY KEY AUTOINCREMENT,SpentLimit REAL NOT NULL, GoalDate INTEGER,
    CatId INTEGER NOT NULL, FOREIGN KEY (CatId) REFERENCES ${DbTables.Categories} (CatId)  )''';


class DbHelper{
  static DbHelper? dbHelper;
  static Database? _database;

  DbHelper._createInstance();
  factory DbHelper() {
    dbHelper ??= DbHelper._createInstance();
    return dbHelper as DbHelper;
  }

  Future<Database> _initializeDatabase() async {
    int dbVersion =1;
    final dbFolder = await getExternalStorageDirectory();
    final dbPath = p.join(dbFolder!.path, "Database");
    Directory dbFolderDir = await Directory(dbPath).create(recursive: true);

    final file = File(p.join(dbFolderDir.path, 'exptrack4.db'));
    var testDb = await openDatabase(
        file.path,
        version: dbVersion,
        onCreate: _createDatabaseV1,
        onDowngrade: onDatabaseDowngradeDelete,
    );
    return testDb;
  }
  void deleteDatabase() async {
    final dbFolder = await getExternalStorageDirectory();
    final path = p.join(dbFolder!.path, "Database").toString();
    //final path = File(p.join(dbFolderDir.path, 'exptrack.db')).toString();
    databaseFactory.deleteDatabase(path);
  }
  // Future<void> deleteDatabase(String path) =>
  //     databaseFactory.deleteDatabase(path);

  void _createDatabaseV1(Database db, int version) async {
    try {
      await db.execute(_catTbl);
      await db.execute(_transTbl);
      await db.execute(_planTbl);
    }
    catch(e){
      print("CreateExp:- "+ e.toString());
      rethrow;
    }
  }

  Future<Database> get database async {
    _database ??= await _initializeDatabase();
    return _database as Database;
  }

  Future<List<Map<String, dynamic>>?> getAll(String tbl) async{
    try {
      Database db = await database;
      var res = await db.query(tbl);
      return res;
    } on Exception catch (e) {
      print("Exception in getAll: $e");
      return null;
    }
  }

  Future<List<Map<String, dynamic>>?> getAllTransCat() async{
    try {
      Database db = await database;
      var res = await db.rawQuery('SELECT * FROM ${DbTables.Transactions} INNER JOIN ${DbTables.Categories} ON ${DbTables.Transactions}.catId = ${DbTables.Categories}.catId');
      print("------------------------------${res}");
      return res;
    } on Exception catch (e) {
      print("Exception in getAll: $e");
      return null;
    }
  }

  Future<List<Map<String, dynamic>>?> getAllPlansCat() async{
    try {
      Database db = await database;
      var res = await db.rawQuery('SELECT * FROM ${DbTables.Goal} INNER JOIN ${DbTables.Categories} ON ${DbTables.Goal}.catId = ${DbTables.Categories}.catId');
      print("------------------------------${res}");
      return res;
    } on Exception catch (e) {
      print("Exception in getAll: $e");
      return null;
    }
  }


  Future<List<Map<String, dynamic>>?> getAllPlanWithAll() async{
    try {
      Database db = await database;
      var res = await db.rawQuery('SELECT * FROM ${DbTables.Goal} INNER JOIN ${DbTables.Categories} INNER JOIN ${DbTables.Categories} ON ${DbTables.Transactions}.catId = ${DbTables.Categories}.catId');
      print("------------------------------${res}");
      return res;
    } on Exception catch (e) {
      print("Exception in getAll: $e");
      return null;
    }
  }

  Future<Map<String, dynamic>?> getById(String tableName, int id, {String pkName = "Id"}) async{
    try {
      Database db = await database;
      var result= await db.query(tableName,where: "$pkName = ?", whereArgs: [id]);
      return result.isNotEmpty ? result.first : null;
    } on Exception catch (e) {
      print("Exception in getById: ${e}");
      return null;
    }

  }

  Future<int> add(String tbl, Map<String, dynamic> obj)async{
    try {

      Database db = await database;

      var res = await db.insert(tbl, obj, conflictAlgorithm: ConflictAlgorithm.ignore );
      print("llll${res}");
      return res;
    } on Exception catch (e) {
      print("EXP in Insert : ${e}");
      return 0;
    }
  }

  Future<int> update(String tbl, Map<String, dynamic> obj, String pkName )async{
    try {
      Database db = await database;
      var pkValue = obj[pkName];
      if(pkValue != null){
        var res = await db.update(tbl, obj, where: '$pkName = ?', whereArgs: [pkValue], conflictAlgorithm: ConflictAlgorithm.ignore);
        return res;
      }
      return 0;
    } on Exception catch (e) {
      print("EXP in update : ${e}");
      return 0;
    }
  }

  Future<int> delete(String tbl,Object pkValue,String pkName)async{
    try {
     // String pkName = pk;
      Database db = await database;
      if(pkValue != null){
        var res = await db.delete(tbl, where: '$pkName = ?', whereArgs: [pkValue]);
        print("Deleted item with id ${pkValue}");
        return res;
      }
      return 0;
    } on Exception catch (e) {
      print("EXP in delete : ${e}");
      return 0;
    }
  }




}