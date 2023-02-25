class Category {

  const Category({
    required this.category_id,
    required this.category_name, 
    required this.ad_type_id, 
  });
  final String category_id;
  final String category_name;
  final String ad_type_id;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      category_id: json['category_id'],
      category_name: json['category_name'],
      ad_type_id: json['ad_type_id'],
    );
  }
}