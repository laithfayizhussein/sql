import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/categories_provider.dart';
import '../widgets/categories_widget.dart';
import './add_categories.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = 'CategoriesScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Notes',
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AddCategories.routeName);
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: FutureBuilder(
          future: Provider.of<UserCategories>(context, listen: false)
              .fetchDataFromDb(),
          builder: (context, snapshot) => Consumer<UserCategories>(
            builder: (context, userCat, ch) => userCat.items.length <= 0
                ? ch!
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemCount: userCat.items.length,
                    itemBuilder: (BuildContext context, int index) =>
                        CategoriesWidget(
                      userCat.items[index].id!,
                      userCat.items[index].content,
                    ),
                  ),
            child: Center(
              child: Text('add new categories'),
            ),
          ),
        ));
  }
}
