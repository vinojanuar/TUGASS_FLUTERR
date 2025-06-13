import 'package:sqflite/sqflite.dart';
import 'package:tugass_fluterr/projectlatihan/model/users_model.dart';

class DbHelper {
  Database? _database;

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT ,
        email TEXT 
      )
    ''');
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = dbPath + filePath;
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<Database> get getDB async {
    _database ??= await _initDB('users.db');
    return _database!;
  }

  Future<int> insert(UsersModel user) async {
    final db = await getDB;
    try {
      return await db.insert('users', user.toMap());
    } catch (e) {
      throw Exception('Eror inserting user: $e');
    }
  }
}
