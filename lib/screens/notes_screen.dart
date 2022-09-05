import 'package:flutter/material.dart';

class NoteScreen extends StatelessWidget {
  static const String routeName = 'NoteScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('will be dynamic'),
      ),
      body: Center(
        child: Text('lISTVIEW BUILDER'),
      ),
    );
  }
}
