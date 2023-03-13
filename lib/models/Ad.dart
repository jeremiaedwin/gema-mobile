class Ad {

  const Ad({
    required this.ad_id,
    required this.category_id,
    required this.ad_type_id,
    required this.condition_id,
    required this.nim,
    required this.title,
    required this.description,
    required this.price, 
    required this.image, 
  });
  final String ad_id;
  final String category_id;
  final String ad_type_id;
  final String condition_id;
  final String nim;
  final String title;
  final String description;
  final int price;
  final String image;

  factory Ad.fromJson(Map<String, dynamic> json) {
    return Ad(
      ad_id: json['ad_id'],
      category_id: json['category_id'],
      ad_type_id: json['ad_type_id'],
      condition_id: json['condition_id'],
      nim: json['nim'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
    );
  }
}