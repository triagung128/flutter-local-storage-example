import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../db/database.dart';

class ListNotesView extends StatelessWidget {
  const ListNotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes App'),
      ),
      body: ValueListenableBuilder<Box<Notes>>(
        valueListenable: NoteManager.getAllNotes().listenable(),
        builder: (context, box, _) {
          List<Notes> allNotes = box.values.toList().cast<Notes>();

          if (allNotes.isEmpty) {
            return const Center(
              child: Text('Data is empty'),
            );
          }

          return ListView.builder(
            itemCount: allNotes.length,
            itemBuilder: (context, index) {
              Notes note = allNotes[index];
              return ListTile(
                onTap: () => Get.toNamed('/edit', arguments: note),
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                ),
                title: Text('${note.title}'),
                subtitle: Text('${note.description}'),
                trailing: IconButton(
                  onPressed: () async => await note.delete(),
                  icon: const Icon(Icons.delete),
                ),
              );
            },
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
