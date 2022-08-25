import 'package:flutter/material.dart';

import '../models/categories_model.dart';

class UserCategories with ChangeNotifier {
  List<CategoriesModel> _items = [
    CategoriesModel('sport', '1'),
    CategoriesModel('hhhhhh', '2'),
    CategoriesModel('ffffff', '3'),
  ];

  List<CategoriesModel> get items {
    return [..._items];
  }

  notifyListeners();
}
