import 'package:examentp/Entity/Station.dart';
import 'package:examentp/Entity/Voyage.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class databaseManager {
  databaseManager._privateConstructor();

  static final databaseManager instance = databaseManager._privateConstructor();
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
    String path = join(databasePath, 'Voyage.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    print("Creating database...");
    await db.execute('''
      CREATE TABLE Station (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL
      );
      CREATE TABLE Voyage (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        depart TEXT NOT NULL,
        arrive TEXT NOT NULL,
        duree INTEGER
      );
    ''');
    print("FIN Creating database.");
  }

  Future<int> addStation(Station station) async {
    Database db = await instance.database;
    return await db.insert('Station', station.toMap());
  }

  Future<List<Station>> getStations() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> result = await db.query('Station');
    List<Station> stations = result.map((map) => Station.fromMap(map)).toList();
    return stations;
  }
  Future<int> addVoyage(Voyage voyage) async {
    Database db = await instance.database;
    return await db.insert('Voyage', voyage.toMap());
  }
  Future<List<Map<String, dynamic>>> getVoyages() async {
    Database db = await instance.database;
    return await db.query('Voyage');
+9  }
}
