import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import '../../../db/db_manager.dart';
import '../../list_notes/controllers/list_notes_controller.dart';

class EditNoteController extends GetxController {
  final TextEditingController titleC = TextEditingController();
  final TextEditingController descC = TextEditingController();

  final ListNotesController _listNotesController = Get.find();

  RxBool isLoading = false.obs;

  final DBManager _dbManager = DBManager.instance;

  void edit(int id) async {
    if (titleC.text.isNotEmpty && descC.text.isNotEmpty) {
      Database db = await _dbManager.db;
      db.update(
        'notes',
        {
          'title': titleC.text,
          'description': descC.text,
        },
        where: 'id = ?',
        whereArgs: [id],
      );

      _listNotesController.getAllNotes();
      Get.back();
    } else {
      Get.defaultDialog(
        title: 'Warning',
        middleText: 'The form is still empty',
      );
    }
  }
}
