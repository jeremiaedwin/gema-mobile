import 'dart:convert';

List<Category> categoryFromJson(String str) =>
    List<Category>.from(json.decode(str).map((x) => Category.fromMap(x)));

class Category {
  Category({
    required this.category_id,
    required this.category_name,
  });
  String category_id;
  String category_name;
  factory Category.fromMap(Map<String, dynamic> json) => Category(
        category_id: json["category_id"],
        category_name: json["category_name"],
      );
}
