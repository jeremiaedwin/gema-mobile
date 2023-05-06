class Wishlist {

  const Wishlist({
    required this.ad_id,
    required this.nim, 
    required this.wishlist_id, 
  });
  final String ad_id;
  final String nim;
  final String wishlist_id;

  factory Wishlist.fromJson(Map<String, dynamic> json) {
    return Wishlist(
      ad_id: json['ad_id'],
      nim: json['nim'],
      wishlist_id: json['wishlist_id'],
    );
  }
}