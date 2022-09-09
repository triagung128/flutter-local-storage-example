import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_note_controller.dart';

class AddNoteView extends StatelessWidget {
  AddNoteView({Key? key}) : super(key: key);

  final AddNoteController controller = Get.put(AddNoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
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
            height: 16.0,
          ),
          Obx(
            () => ElevatedButton(
              onPressed: (controller.isLoading.value)
                  ? null
                  : () => controller.insert(),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
              ),
              child: Text(
                (controller.isLoading.value) ? 'Loading...' : 'Save',
                style: const TextStyle(fontSize: 18.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
