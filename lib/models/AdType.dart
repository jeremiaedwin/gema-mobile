class AdType {

  const AdType({
    required this.ad_type_id,
    required this.ad_type_name, 
  });
  final String ad_type_id;
  final String ad_type_name;

  factory AdType.fromJson(Map<String, dynamic> json) {
    return AdType(
      ad_type_id: json['ad_type_id'],
      ad_type_name: json['ad_type_name'],
    );
  }
}