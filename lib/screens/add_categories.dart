import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../models/categories_model.dart';
import '../providers/categories_provider.dart';

class AddCategories extends StatefulWidget {
  static const String routeName = 'AddCategories';
  @override
  State<AddCategories> createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddCategories> {
  final _formKey = GlobalKey<FormState>();
  var _editedCategoires = CategoriesModel('', '');
  var _initValues = {
    'content': '',
  };
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final categoriesId =
          ModalRoute.of(context)!.settings.arguments as String?;
      if (categoriesId != null) {
        _editedCategoires = Provider.of<UserCategories>(context, listen: false)
            .findById(categoriesId);

        _initValues = {
          'content': _editedCategoires.content,
        };
      }
      ;
    }
    _isInit = false;
    super.didChangeDependencies();
    print('didCange');
  }

  Future<void> _saveForm() async {
    var isValid = _formKey.currentState!.validate();
    print({isValid, 'isValid'});
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    if (_editedCategoires.id == 'null' || _editedCategoires.id!.isEmpty) {
      try {
        print('is empty');
        await Provider.of<UserCategories>(context, listen: false)
            .addCategories(_editedCategoires);
      } catch (error) {
        print(error);
      }
    } else {
      await Provider.of<UserCategories>(context, listen: false)
          .updateCategories(_editedCategoires.id!, _editedCategoires);
      print({'_editedCategoires update', _editedCategoires});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  initialValue: _initValues['content'],
                  decoration: InputDecoration(labelText: 'content'),
                  validator: (value) {
                    return value!.isNotEmpty ? null : "Enter any text";
                  },
                  onSaved: (val) {
                    _editedCategoires =
                        CategoriesModel(val.toString(), _editedCategoires.id);
                  },
                ),
              ],
            )),
        title: Text('Add Your Categories'),
        actions: <Widget>[
          InkWell(
            child: Text('OK'),
            onTap: () {
              setState(() {
                _saveForm();
              });

              print('ok');

              // Do something like updating SharedPreferences or User Settings etc.
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
