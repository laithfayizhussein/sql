import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  static const String routeName = 'AddNote';

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: TextFormField(
            autofocus: true,
            decoration: InputDecoration(labelText: 'content'),
            validator: (value) {
              return value!.isNotEmpty ? null : "Enter any text";
            },
            onSaved: (val) {},
          ),
        ),
      ],
    ));
  }
}
