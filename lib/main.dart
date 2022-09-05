import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sql/providers/categories_provider.dart';

import './screens/notes_screen.dart';
import './screens/categroies_screen.dart';
import './screens/add_categories.dart';
import './design/constant.dart';

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
        theme: ThemeData(
          canvasColor:
              Color.fromRGBO(255, 254, 229, 1), // for background on app
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                bodyText2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
              ),
          colorScheme: KColorScheme,
        ),
        home: CategoriesScreen(),
        routes: {
          CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
          NoteScreen.routeName: (ctx) => NoteScreen(),
          AddCategories.routeName: (ctx) => AddCategories(),
        },
      ),
    );
  }
}
