import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tugass_fluterr/tugas13/model/model.dart'; // sesuaikan path-nya

class DatabaseHelper {
  static const _databaseName = 'student_manager.db';
  static const _databaseVersion = 1;

  static const tableStudent = 'students';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableStudent (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT NOT NULL,
        nis TEXT NOT NULL,
        kelas TEXT NOT NULL
      )
    ''');
  }

  // Tambahkan data
  Future<int> insertStudent(StudentModel student) async {
    final db = await database;
    return await db.insert(tableStudent, student.toMap());
  }

  // menampilkan data
  Future<List<StudentModel>> getStudents() async {
    final db = await database;
    final maps = await db.query(tableStudent, orderBy: 'id DESC');

    return maps.map((map) => StudentModel.fromMap(map)).toList();
  }

  // Edit Data
  Future<int> updateStudent(StudentModel student) async {
    final db = await database;
    return await db.update(
      tableStudent,
      student.toMap(),
      where: 'id = ?',
      whereArgs: [student.id],
    );
  }

  // Hapus Data
  Future<int> deleteStudent(int id) async {
    final db = await database;
    return await db.delete(tableStudent, where: 'id = ?', whereArgs: [id]);
  }

  // Detail
  Future<StudentModel?> getStudentById(int id) async {
    final db = await database;
    final maps = await db.query(tableStudent, where: 'id = ?', whereArgs: [id]);

    if (maps.isNotEmpty) {
      return StudentModel.fromMap(maps.first);
    } else {
      return null;
    }
  }
}
