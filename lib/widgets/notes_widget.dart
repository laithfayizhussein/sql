import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../screens/add_note.dart';

class NotesWidget extends StatefulWidget {
  final String id;
  final String noteContent;
  NotesWidget(this.id, this.noteContent);
  @override
  State<NotesWidget> createState() => _NotesWidgetState();
}

class _NotesWidgetState extends State<NotesWidget> {
  Widget buildButtomSheet(BuildContext context) {
    return AddNote(
        //newTaskTitle // it was passing to the obj
        // setState(() {
        //   // tasks.add(Task(name: newTaskTitle));
        //   // Navigator.pop(context);
        // });
        );
  }

  var randomeColor =
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              border: Border(left: BorderSide(color: randomeColor, width: 5))),
          child: ListTile(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: buildButtomSheet,
              );
            },
            leading: Text('lorem lorem lorem '),
            trailing: IconButton(
              padding: EdgeInsets.only(left: 40),
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                color: randomeColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
