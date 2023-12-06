import 'package:fluttertp1/atelier6/Models/Employee.dart';


class DataBaseHelper {
  DataBaseHelper._privateConstructor();//constructaire privée
  DataBaseHelper();
  static final DataBaseHelper instance = DataBaseHelper._privateConstructor();

  

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath,'gestionemploye.db');

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
      id INTEGER PRIMARY KEY, 
      matricule INTEGER, 
      nom TEXT NOT NULL, 
      prenom TEXT NOT NULL
       );
      ''');
      print("fin creation database");
  }

  Future<int> add(ModelEmployee employe) async {
    Database db = await instance.database;
    return await db.insert('Employe',employe.toMap());
  }
  Future<List<Map<String, dynamic>>> getEmploye() async {
  Database db = await instance.database;
  return await db.query('Employe');
}


}