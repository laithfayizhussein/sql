class CategoriesModel {
  late final String _content;
  late final String? _id;

  String? get id => _id;
  String get content => _content;

  CategoriesModel(this._content, [this._id]);

  CategoriesModel.map(dynamic obj) {
    this._content = obj['content'];
    this._id = obj["id"];
  }

  CategoriesModel.fromMap(Map<String, dynamic> map) {
    this._content = map['content'];
    this._id = map["id"];
  }

  Map<String, Object> toMap() => {
        'text': _content,
        'id': _id.toString(),
      };
}
