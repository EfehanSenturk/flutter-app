import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('mydatabase.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const String textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE certificates (
      id $idType,
      title $textType,
      description $textType
    )
    ''');

    await db.execute('''
    CREATE TABLE projects (
      id $idType,
      title $textType,
      description $textType
    )
    ''');

    await db.execute('''
    CREATE TABLE skills (
      id $idType,
      title $textType,
      description $textType
    )
    ''');
  }

  
  Future<void> insertCertificate(Map<String, String> certificate) async {
    final db = await instance.database;
    await db.insert('certificates', certificate,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> fetchCertificates() async {
    final db = await instance.database;
    return await db.query('certificates');
  }

  Future<int> deleteCertificate(int id) async {
    final db = await instance.database;
    return await db.delete('certificates', where: 'id = ?', whereArgs: [id]);
  }

  
  Future<void> insertProject(Map<String, String> project) async {
    final db = await instance.database;
    await db.insert('projects', project,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> fetchProjects() async {
    final db = await instance.database;
    return await db.query('projects');
  }

  Future<int> deleteProject(int id) async {
    final db = await instance.database;
    return await db.delete('projects', where: 'id = ?', whereArgs: [id]);
  }

  
  Future<void> insertSkill(Map<String, String> skill) async {
    final db = await instance.database;
    await db.insert('skills', skill,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> fetchSkills() async {
    final db = await instance.database;
    return await db.query('skills');
  }

  Future<int> deleteSkill(int id) async {
    final db = await instance.database;
    return await db.delete('skills', where: 'id = ?', whereArgs: [id]);
  }
}
