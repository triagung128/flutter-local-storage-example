import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import '../../../db/db_manager.dart';
import '../../list_notes/controllers/list_notes_controller.dart';

class AddNoteController extends GetxController {
  final DBManager _dbManager = DBManager.instance;

  final TextEditingController titleC = TextEditingController();
  final TextEditingController descC = TextEditingController();

  final ListNotesController _listNotesController = Get.find();

  RxBool isLoading = false.obs;

  void insert() async {
    if (titleC.text.isNotEmpty && descC.text.isNotEmpty) {
      isLoading.value = true;
      Database db = await _dbManager.db;
      db.insert('notes', {
        'title': titleC.text,
        'description': descC.text,
      });
      isLoading.value = false;

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
