class NoteModel {
  late final String _noteContent;
  late final String _id;
  String get id => _id;
  String get noteContent => _noteContent;

  NoteModel(this._noteContent, this._id);

  NoteModel.map(dynamic obj) {
    this._noteContent = obj['noteContent'];
    this._id = obj['id'];
  }
  NoteModel.fromMap(Map<String, dynamic> map) {
    this._noteContent = map['noteContent'];
    this._id = map['id'];
  }

  Map<String, Object> toMap() => {
        'text': _noteContent,
        'id': _id.toString(),
      };
}
