import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sql/providers/categories_provider.dart';

import './screens/notes_screen.dart';
import './screens/categroies_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => UserCategories()),
      ],
      child: MaterialApp(
        home: CategoriesScreen(),
        routes: {
          CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
          NoteScreen.routeName: (ctx) => NoteScreen(),
        },
      ),
    );
  }
}
