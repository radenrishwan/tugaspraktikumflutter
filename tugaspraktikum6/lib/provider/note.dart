import 'package:flutter/material.dart';
import 'package:tugaspraktikum6/data/facade/note.dart';
import 'package:tugaspraktikum6/data/models/note.dart';

class NoteProvider extends ChangeNotifier {
  List<Note> notes = [];
  final NoteFacade _noteFacade = NoteFacade();

  Future<void> findAll() async {
    final dummy = await _noteFacade.findAll();

    notes = dummy;
    notifyListeners();
  }

  Future<void> add(Note note) async {
    await _noteFacade.create(note);
    findAll();
  }

  Future<void> remove(String id) async {
    await _noteFacade.delete(Note.blank().copyWith(id: id));
    findAll();
  }

  Future<void> update(Note note) async {
    await _noteFacade.update(note);
    findAll();
  }
}
