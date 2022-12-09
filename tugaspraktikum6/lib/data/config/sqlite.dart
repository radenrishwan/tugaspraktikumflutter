import 'package:sqflite/sqflite.dart';
import 'package:tugaspraktikum6/data/models/note.dart';

class Sqlite {
  static final Sqlite _instance = Sqlite._();
  static Database? _database;

  factory Sqlite() {
    return _instance;
  }

  Future<Database> get database async {
    return _database ??= await _initDB();
  }

  Sqlite._();

  Future<Database> _initDB() async {
    return await openDatabase(
      'database.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE  IF NOT EXISTS ${Note.tableName} (
            id TEXT PRIMARY KEY,
            title TEXT,
            content TEXT,
            createdAt INT,
            updatedAt INT
          )
          ''');
      },
    );
  }
}
