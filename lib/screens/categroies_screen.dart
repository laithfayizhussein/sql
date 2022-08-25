import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/categories_provider.dart';
import '../widgets/categories_widget.dart';
import './add_categories.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = 'CategoriesScreen';

  @override
  Widget build(BuildContext context) {
    var userCategories = Provider.of<UserCategories>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Name'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AddCategories.routeName);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: userCategories.items.length,
        itemBuilder: (BuildContext context, int index) => CategoriesWidget(
            userCategories.items[index].id,
            userCategories.items[index].content),
      ),
    );
  }
}
