import 'package:flutter/material.dart';

import '../sql/database_note.dart';
import '../models/categories_model.dart';

class UserCategories with ChangeNotifier {
  SqlDb sql = SqlDb();
  List<CategoriesModel> _items = [
    // CategoriesModel(content: 'jjjj', id: '2'),
    // CategoriesModel(content: 'content', id: '3'),
    // CategoriesModel(content: 'content', id: '4'),
  ];

  List<CategoriesModel> get items {
    print({'_items', _items[0].content});
    return [..._items];
  }

  CategoriesModel findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  addCategories(CategoriesModel cat) {
    print('add method');
    final newCategories = CategoriesModel(cat.content, cat.id);
    _items.add(newCategories);
    notifyListeners();
    sql.insertDb({'text': newCategories.content});
  }

  Future<void> fetchDataFromDb() async {
    final dataList = await sql.getData();
    print({'dataList', dataList});
    _items = dataList
        .map((item) => CategoriesModel(
              item['text'],
              item['id'].toString(),
            ))
        .toList();
    notifyListeners();
  }

  Future<void> updateCategories(String id, CategoriesModel forEditing) async {
    print({'before', forEditing});
    print({'beforeID', id});
    final carIndex = _items.indexWhere((element) => element.id == id);
    print({carIndex, 'carIndex'});
    if (carIndex >= 0) {
      _items[carIndex] = forEditing;
      notifyListeners();
      print({'joj', _items[carIndex]});
      print({'jojID', id});
      sql.updateData(CategoriesModel(_items[carIndex].content.toString(), id));
      notifyListeners();
    } else {
      print('............');
    }
  }

  Future<void> deleteCategories(String id) async {
    await sql.deleteData(id);
    notifyListeners();
  }

  notifyListeners();
}
