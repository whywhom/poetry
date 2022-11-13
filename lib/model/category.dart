
class Category {
  final List<CategoryItem> items;
  const Category({
    required this.items
  });

  factory Category.fromJson(List<dynamic> json) {
    var list = json.map((m) => CategoryItem.fromJson(m as Map<String, dynamic>)).toList();
    return Category(
        items: list
    );
  }
}
class CategoryItem {
  String? _title;
  String? _path;

  CategoryItem(
      {String? title,
        String? path}) {
    if (title != null) {
      _title = title;
    }
    if (path != null) {
      _path = path;
    }
  }

  String? get title => _title;
  set title(String? title) => _title = title;
  String? get path => _path;
  set path(String? path) => _path = path;

  CategoryItem.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = _title;
    data['path'] = _path;
    return data;
  }
}