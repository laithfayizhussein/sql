import 'package:path/path.dart' as pth;
import 'package:sqflite/sqflite.dart' as sqlf;
import '../models/categories_model.dart';
import '../models/note_model.dart';

class SqlDb {
  final String categoriesTable = 'categoriesTable';
  final String id = 'id';
  final String text = 'text';
  final String taskTable = 'taskTable';
  final String color = 'color';
  static sqlf.Database? _db;
  // to avoid duplicated db or i can add or use ConflictAlgorithm.replace on insert method
  Future<sqlf.Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    String databasePath = await sqlf.getDatabasesPath();
    String path = pth.join(databasePath, 'notes.db');
    sqlf.Database notesDb = await sqlf.openDatabase(path,
        onCreate: _onCreate, onUpgrade: _onUpgrade, version: 1);
    return notesDb;
  }

  _onCreate(sqlf.Database db, int version) async {
    await db.execute('''
    CREATE TABLE $categoriesTable($id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    $text TEXT NOT NULL)
    ''');
    await db.execute('''
    CREATE TABLE $taskTable($id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,$text TEXT NOT NULL)
    ''');
    print('table has been created ');
  }

  _onUpgrade(sqlf.Database db, int oldVersion, int newVersion) {
    // if i want add something in to the table
  }
  readDb() async {
    sqlf.Database? myDb = await db;
    var response = await myDb!.query("SELECT * FORM $categoriesTable");
    return response;
  }

  readDbTask() async {
    sqlf.Database? myDb = await db;
    var response = await myDb!.query("SELECT * FORM $taskTable");
    return response;
  }

  Future<void> insertDb(Map<String, Object> data) async {
    sqlf.Database? myDb = await db;
    await myDb!.insert('$categoriesTable', data);
  }

  Future<void> insertDbTask(String table, Map<String, Object> data) async {
    sqlf.Database? myDb = await db;
    await myDb!.insert(table, data);
  }

  Future<int> updateData(CategoriesModel pTable) async {
    print('dbupdate');
    sqlf.Database? myDb = await db;
    var response = await myDb!.update(categoriesTable, pTable.toMap(),
        where: 'id =?', whereArgs: [pTable.id]);
    return response;
  }

  Future<int> updateDataTask(CategoriesModel pTable) async {
    print('dbupdate');
    sqlf.Database? myDb = await db;
    var response = await myDb!.update('categories', pTable.toMap(),
        where: 'id =?', whereArgs: [pTable.id]);
    return response;
  }

  Future<List<Map<String, dynamic>>> getData() async {
    sqlf.Database? myDb = await db;
    var response = await myDb!.query(categoriesTable);
    return response;
  }

  Future<List<Map<String, dynamic>>> getDataTask(String table) async {
    sqlf.Database? myDb = await db;
    var response = await myDb!.query(table);
    return response;
  }

  Future deleteData(String id) async {
    sqlf.Database? myDb = await db;
    var response =
        await myDb!.delete('categories', where: "id = ?", whereArgs: [id]);
    return response;
  }

  Future deleteDataTask(String id) async {
    sqlf.Database? myDb = await db;
    var response =
        await myDb!.delete('categories', where: "id = ?", whereArgs: [id]);
    return response;
  }

  deleteAllData() async {
    String databasePath = await sqlf.getDatabasesPath();
    String path = pth.join(databasePath, 'notes.db');
    sqlf.deleteDatabase(path);
    print('deletAll');
  }
}
