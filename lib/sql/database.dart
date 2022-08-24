import 'package:path/path.dart' as pth;
import 'package:sqflite/sqflite.dart' as sqlf;

class SqlDb {
  static sqlf.Database? _db;

  // to avoid duplicate the database
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
    String path = pth.join(databasePath, 'laith.db');
    sqlf.Database myDb = await sqlf.openDatabase(path,
        onCreate: _onCreate, version: 3, onUpgrade: _onUpgrade);
    return myDb;
  }

  _onUpgrade(sqlf.Database db, int oldversion, int newversion) async {
    print('_onUpgrade ++++++++++++++++++++++++++++++++++++++');
    await db.execute("ALTER TABLE notes ADD COLUMN color TEXT");
  }

  _onCreate(sqlf.Database db, int version) async {
    await db.execute('''
        CREATE TABLE 'notes'(
        'id' INTEGER  PRIMARY KEY AUTOINCREMENT NOT NULL,
        'text' TEXT NOT NULL)''');
    print(' ONCreate ++++++++++++++++++++++++++++++++++++++++++');
  }

  readData(String sql) async {
    sqlf.Database? myDb = await db;
    var response = await myDb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    sqlf.Database? myDb = await db;
    var response = await myDb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    sqlf.Database? myDb = await db;
    var response = myDb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    sqlf.Database? myDb = await db;
    var response = myDb!.rawDelete(sql);
    return response;
  }

  deleteAllData() async {
    String databasePath = await sqlf.getDatabasesPath();
    String path = pth.join(databasePath, 'laith.db');
    sqlf.deleteDatabase(path);
  }
}
