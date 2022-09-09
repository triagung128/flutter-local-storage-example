import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/note.dart';
import '../controllers/list_notes_controller.dart';

class ListNotesView extends StatelessWidget {
  ListNotesView({Key? key}) : super(key: key);

  final ListNotesController controller = Get.put(ListNotesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes App'),
      ),
      body: FutureBuilder(
        future: controller.getAllNotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Obx(
            () => (controller.allNotes.isEmpty)
                ? const Center(
                    child: Text('Data is empty'),
                  )
                : ListView.builder(
                    itemCount: controller.allNotes.length,
                    itemBuilder: (context, index) {
                      Note note = controller.allNotes[index];
                      return ListTile(
                        onTap: () => Get.toNamed(
                          '/edit',
                          arguments: note,
                        ),
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: Text('${note.title}'),
                        subtitle: Text('${note.description}'),
                        trailing: IconButton(
                          onPressed: () => controller.deleteNote(note.id!),
                          icon: const Icon(Icons.delete),
                        ),
                      );
                    },
                  ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/add'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
