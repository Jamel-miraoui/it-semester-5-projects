import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tp5/model/employe.dart';

class DataBaseHelper {
  DataBaseHelper();
  DataBaseHelper._privateConstructor();

  static final DataBaseHelper instance = DataBaseHelper._privateConstructor();
  static Database? _database; //privé

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'gestionemploye.db');
    
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      //onUpgrade:_onupgrade,
      //onDowngrade:
    );
  }

  Future _onCreate(Database db, int version) async {
    print("Creatin database...........");
    await db.execute('''
      CREATE TABLE Employe(
      id INTEGER PRIMARY KEY ,
      matricule INTEGER ,
      nom TEXT NOT NULL ,
      prenom TEXT NOT NULL
       );
      ''');
    print("FIN Creatin database...........");
  }

  Future<int> add(ModelEmploye emp) async {
    Database db = await instance.database;
    return await db.insert('Employe', emp.toMap());
  }
}