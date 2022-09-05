import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import '../providers/categories_provider.dart';
import '../screens/add_categories.dart';
import '../design/dialog.dart';

import '../screens/notes_screen.dart';

class CategoriesWidget extends StatefulWidget {
  final String id;
  final String categoriesText;
  CategoriesWidget(this.id, this.categoriesText);

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  void initState() {
    print('rebuild');
    super.initState();
  }

  var randomeColor =
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
      child: GridTile(
        child: GestureDetector(
          onLongPress: () {
            Navigator.pushNamed(context, AddCategories.routeName,
                arguments: widget.id);
          },
          onTap: () {
            Navigator.pushNamed(context, NoteScreen.routeName);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            child: Text(
              '${widget.categoriesText}',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: randomeColor == Color(0xFFFFFF)
                      ? Colors.black
                      : Colors.white),
            ),
            color: randomeColor,
            margin: EdgeInsets.all(10),
          ),
        ),
        footer: Container(
          height: 30,
          margin: EdgeInsets.all(10),
          child: GridTileBar(
              title: Text('${DateTime.now().day}'),
              trailing: IconButton(
                onPressed: () {
                  myAlert(context, 'Hello laith ', 'would u like to delete it',
                      'OK', 'NO', () {
                    Provider.of<UserCategories>(context, listen: false)
                        .deleteCategories(widget.id);
                    Provider.of<UserCategories>(context, listen: false)
                        .fetchDataFromDb();
                    Navigator.pop(context);
                  }, () => Navigator.pop(context));
                },
                icon: Icon(
                  Icons.delete,
                ),
              ),
              backgroundColor: Colors.black45),
        ),
      ),
    );
  }
}
