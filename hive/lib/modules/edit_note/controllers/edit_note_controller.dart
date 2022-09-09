import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../db/database.dart';

class EditNoteController extends GetxController {
  final TextEditingController titleC = TextEditingController();
  final TextEditingController descC = TextEditingController();

  RxBool isLoading = false.obs;

  Future<void> editNote(Notes note) async {
    note.title = titleC.text;
    note.description = descC.text;

    note.save();
  }
}
