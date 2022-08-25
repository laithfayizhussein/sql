import 'package:flutter/material.dart';

import '../models/categories_model.dart';

class UserCategories with ChangeNotifier {
  List<CategoriesModel> _items = [
    // CategoriesModel(content: 'jjjj', id: '2'),
    // CategoriesModel(content: 'content', id: '3'),
    // CategoriesModel(content: 'content', id: '4'),
  ];

  List<CategoriesModel> get items {
    return [..._items];
  }

  CategoriesModel findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  addCategories(CategoriesModel cat) {
    print('add method');
    final newCategories =
        CategoriesModel(content: cat.content, id: DateTime.now().toString());
    _items.add(newCategories);
    notifyListeners();
  }

  Future<void> updateCategories(String id, CategoriesModel forEditing) async {
    final carIndex = _items.indexWhere((element) => element.id == id);
    print({carIndex, 'carIndex'});
    if (carIndex >= 0) {
      _items[carIndex] = forEditing;
      notifyListeners();
    } else {
      print('............');
    }
  }

  notifyListeners();
}
