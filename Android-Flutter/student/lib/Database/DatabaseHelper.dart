import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:student/Entity/Student.dart';

class DataBaseHelper {

  DataBaseHelper._privateConstructor();

  static final DataBaseHelper instance = DataBaseHelper._privateConstructor();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'student_database.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    print("Creating database...");
    await db.execute('''
      CREATE TABLE students(
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        age INTEGER,
        studentId TEXT NOT NULL
      );
    ''');
    print("FIN Creatin database .");
  }

  Future<int> addStudent(Student student) async {
    Database db = await instance.database;
    return await db.insert('students', student.toMap());
  }

  Future<List<Student>> getStudents() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> result = await db.query('students');
    List<Student> students = result.map((map) => Student.fromMap(map)).toList();
    return students;
  }
}
