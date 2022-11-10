
class Shijing {
  final List<ShijingItem> items;
  const Shijing({
    required this.items
  });

  factory Shijing.fromJson(List<dynamic> json) {
    var list = json.map((m) => ShijingItem.fromJson(m as Map<String, dynamic>)).toList();
    return Shijing(
        items: list
    );
  }
}
class ShijingItem {
  String? _title;
  String? _chapter;
  String? _section;
  List<String>? _content;

  ShijingItem(
      {String? title,
        String? chapter,
        String? section,
        List<String>? content}) {
    if (title != null) {
      _title = title;
    }
    if (chapter != null) {
      _chapter = chapter;
    }
    if (section != null) {
      _section = section;
    }
    if (content != null) {
      _content = content;
    }
  }

  String? get title => _title;
  set title(String? title) => _title = title;
  String? get chapter => _chapter;
  set chapter(String? chapter) => _chapter = chapter;
  String? get section => _section;
  set section(String? section) => _section = section;
  List<String>? get content => _content;
  set content(List<String>? content) => _content = content;

  ShijingItem.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _chapter = json['chapter'];
    _section = json['section'];
    _content = json['content'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = _title;
    data['chapter'] = _chapter;
    data['section'] = _section;
    data['content'] = _content;
    return data;
  }
}