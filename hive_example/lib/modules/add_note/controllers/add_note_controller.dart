import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../db/database.dart';

class AddNoteController extends GetxController {
  final TextEditingController titleC = TextEditingController();
  final TextEditingController descC = TextEditingController();

  RxBool isLoading = false.obs;

  Future<void> addNote() async {
    if (titleC.text.isNotEmpty && descC.text.isNotEmpty) {
      // create without id
      Notes note = Notes()
        ..title = titleC.text
        ..description = descC.text;

      final box = NoteManager.getAllNotes();

      // get id auto increment
      int id = await box.add(note);
      note.id = id;

      note.save();
    }
  }
}
