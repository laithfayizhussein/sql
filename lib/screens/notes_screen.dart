import 'package:flutter/material.dart';
import '../widgets/notes_widget.dart';
import '../screens/add_note.dart';

class NoteScreen extends StatelessWidget {
  static const String routeName = 'NoteScreen';
  late final String title;
  Widget buildButtomSheet(BuildContext context) {
    return AddNote(
        //newTaskTitle // it was passing to the obj
        // setState(() {
        //   // tasks.add(Task(name: newTaskTitle));
        //   // Navigator.pop(context);
        // });
        );
  }

  @override
  Widget build(BuildContext context) {
    final categoriesName =
        ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(categoriesName!)),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: buildButtomSheet,
                );
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: NotesWidget('2', 'mama'),
    );
  }
}
