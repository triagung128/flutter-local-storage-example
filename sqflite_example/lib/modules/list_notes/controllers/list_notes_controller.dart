import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import '../../../db/db_manager.dart';
import '../../../models/note.dart';

class ListNotesController extends GetxController {
  RxList allNotes = <Note>[].obs;
  final DBManager _dbManager = DBManager.instance;

  Future getAllNotes() async {
    Database db = await _dbManager.db;
    List<Map<String, dynamic>> data = await db.query('notes');

    if (data.isNotEmpty) {
      allNotes(Note.toJsonList(data));
      allNotes.refresh();
    } else {
      allNotes.clear();
      allNotes.refresh();
    }
  }

  Future deleteNote(int id) async {
    Database db = await _dbManager.db;
    db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );

    getAllNotes();
  }

  @override
  void onInit() {
    super.onInit();
    getAllNotes();
  }
}
