import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../db/database.dart';
import '../controllers/edit_note_controller.dart';

class EditNoteView extends StatelessWidget {
  EditNoteView({Key? key}) : super(key: key);

  final EditNoteController controller = Get.put(EditNoteController());

  final Notes note = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.titleC.text = note.title!;
    controller.descC.text = note.description!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          TextField(
            controller: controller.titleC,
            autocorrect: false,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Title',
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          TextField(
            controller: controller.descC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Description',
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          ElevatedButton(
            onPressed: controller.isLoading.isTrue
                ? null
                : () async {
                    await controller.editNote(note);
                    Get.back();
                  },
            child: Text(controller.isLoading.isFalse ? 'Edit' : 'Loading'),
          ),
        ],
      ),
    );
  }
}
