import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../design/constant.dart';
import '../screens/notes_screen.dart';

class CategoriesWidget extends StatelessWidget {
  var hello =
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, NoteScreen.routeName);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'sport',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color:
                      hello == Color(0xFFFFFF) ? Colors.black : Colors.white),
            ),
            color: hello,
            margin: EdgeInsets.all(10),
          ),
        ),
        footer: Container(
          height: 30,
          margin: EdgeInsets.all(10),
          child: GridTileBar(
              title: Text('${DateTime.now().day}'),
              backgroundColor: Colors.black45),
        ),
      ),
    );
  }
}