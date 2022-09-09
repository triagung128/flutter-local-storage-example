import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './modules/list_notes/views/list_notes_view.dart';
import './modules/add_note/views/add_note_view.dart';
import './modules/edit_note/views/edit_note_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes App',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => ListNotesView()),
        GetPage(name: '/add', page: () => AddNoteView()),
        GetPage(name: '/edit', page: () => EditNoteView()),
      ],
    );
  }
}
