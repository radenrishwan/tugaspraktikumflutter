import 'package:tugaspraktikum6/data/config/sqlite.dart';
import 'package:tugaspraktikum6/data/models/note.dart';
import 'package:tugaspraktikum6/exception/database.dart';

class NoteFacade {
  static final NoteFacade _instance = NoteFacade._();

  factory NoteFacade() {
    return _instance;
  }

  NoteFacade._();

  Future<Note> create(Note note) async {
    final database = await Sqlite().database;

    final int status = await database.insert(Note.tableName, note.toJson());

    if (status == 0) {
      throw DatabaseException("Failed to create note");
    }

    return note;
  }

  Future<Note> findById(String id) async {
    final database = await Sqlite().database;

    final List<Map<String, Object?>> result = await database.query(
      Note.tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (result.isEmpty) {
      throw DatabaseException("Note not found");
    }

    return Note.fromJson(result.first);
  }

  Future<List<Note>> findAll() async {
    final database = await Sqlite().database;

    final List<Map<String, Object?>> result = await database.query(
      Note.tableName,
    );

    return result.map((e) => Note.fromJson(e)).toList();
  }

  Future<Note> update(Note note) async {
    final database = await Sqlite().database;

    // check if note exists
    try {
      await findById(note.id);
    } catch (e) {
      throw DatabaseException("Note not found");
    }

    final int status = await database.update(
      Note.tableName,
      note.toJson(),
      where: 'id = ?',
      whereArgs: [note.id],
    );

    if (status == 0) {
      throw DatabaseException("Failed to update note");
    }

    return note;
  }

  Future<void> delete(Note note) async {
    final database = await Sqlite().database;

    // check if note exists
    try {
      await findById(note.id);
    } catch (e) {
      throw DatabaseException("Note not found");
    }

    final int status = await database.delete(
      Note.tableName,
      where: 'id = ?',
      whereArgs: [note.id],
    );

    if (status == 0) {
      throw DatabaseException("Failed to delete note");
    }
  }
}
