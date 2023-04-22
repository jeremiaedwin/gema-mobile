class AdDetail {

  const AdDetail({
    required this.ad_id,
    required this.category_id,
    required this.ad_type_id,
    required this.condition_id,
    required this.nim,
    required this.title,
    required this.description,
    required this.price, 
    required this.image, 
    required this.nama, 
    required this.category, 
    required this.ad_type, 
    required this.avatar, 
    required this.condition, 
  });
  final String ad_id;
  final String category_id;
  final String ad_type_id;
  final String condition_id;
  final String nim;
  final String title;
  final String description;
  final String price;
  final String image;
  final String nama;
  final String category;
  final String ad_type;
  final String avatar;
  final String condition;

  factory AdDetail.fromJson(Map<String, dynamic> json) {
    return AdDetail(
      ad_id: json['ad_id'],
      category_id: json['category_id'],
      ad_type_id: json['ad_type_id'],
      condition_id: json['condition_id'],
      nim: json['nim'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      nama: json['full_name'],
      category: json['category_name'],
      ad_type: json['ad_type_name'],
      avatar: json['avatar'],
      condition: json['condition_name']
    );
  }
}