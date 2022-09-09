import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/edit_note_controller.dart';
import '../../../models/note.dart';

class EditNoteView extends StatelessWidget {
  EditNoteView({Key? key}) : super(key: key);

  final EditNoteController _controller = Get.put(EditNoteController());

  final Note _note = Get.arguments;

  @override
  Widget build(BuildContext context) {
    _controller.titleC.text = _note.title!;
    _controller.descC.text = _note.description!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          TextField(
            controller: _controller.titleC,
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
            controller: _controller.descC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Description',
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Obx(
            () => ElevatedButton(
              onPressed: (_controller.isLoading.value)
                  ? null
                  : () => _controller.edit(_note.id!),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
              ),
              child: Text(
                (_controller.isLoading.value) ? 'Loading...' : 'Edit',
                style: const TextStyle(fontSize: 18.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
