import 'package:sqflite/sqflite.dart';
import 'package:tugaspraktikum6/data/models/note.dart';
import 'package:uuid/uuid.dart';

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
      onUpgrade: (db, oldVersion, newVersion) async {
        await db.execute(
          '''
  INSERT INTO ${Note.tableName} (id, title, content, createdAt, updatedAt) VALUES (
            '${const Uuid().v4()}',
            'Welcome to Simple Note',
            'Hi, Buddy 👋👋👋.

Thanks for using our app. please send us star at github if this app really usefull. And we also open to all contribute, please check our github if you interested

https://github.com/radenrishwan/tugaspraktikumflutter/tree/master/tugaspraktikum6

note: im gonna update github link later',
            ${DateTime.now().millisecondsSinceEpoch},
            ${DateTime.now().millisecondsSinceEpoch}
          )''',
        );
      },
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
