
class GushiShijiushou {
  final List<GushiShijiushouItem> items;
  const GushiShijiushou({
    required this.items
  });

  factory GushiShijiushou.fromJson(List<dynamic> json) {
    var list = json.map((m) => GushiShijiushouItem.fromJson(m as Map<String, dynamic>)).toList();
    return GushiShijiushou(
        items: list
    );
  }
}
class GushiShijiushouItem {
  String? _title;
  String? _dynasty;
  String? _author;
  List<String>? _paragraphs;
  List<String>? _notes;

  GushiShijiushouItem(
      {String? title,
        String? dynasty,
        String? author,
        List<String>? paragraphs,
        List<String>? notes}) {
    if (title != null) {
      _title = title;
    }
    if (dynasty != null) {
      _dynasty = dynasty;
    }
    if (author != null) {
      _author = author;
    }
    if (paragraphs != null) {
      _paragraphs = paragraphs;
    }
    if (notes != null) {
      _notes = notes;
    }
  }

  String? get title => _title;
  set title(String? title) => _title = title;
  String? get dynasty => _dynasty;
  set dynasty(String? dynasty) => _dynasty = dynasty;
  String? get author => _author;
  set author(String? author) => _author = author;
  List<String>? get paragraphs => _paragraphs;
  set paragraphs(List<String>? paragraphs) => _paragraphs = paragraphs;
  List<String>? get notes => _notes;
  set notes(List<String>? notes) => _notes = notes;

  GushiShijiushouItem.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _dynasty = json['dynasty'];
    _author = json['author'];
    _paragraphs = json['paragraphs'].cast<String>();
    _notes = json['notes'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = _title;
    data['dynasty'] = _dynasty;
    data['author'] = _author;
    data['paragraphs'] = _paragraphs;
    data['notes'] = _notes;
    return data;
  }
}