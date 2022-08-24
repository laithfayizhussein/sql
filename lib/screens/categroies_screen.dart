import 'package:flutter/material.dart';
import '../widgets/categories_widget.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = 'CategoriesScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) => CategoriesWidget(),
      ),
    );
  }
}
