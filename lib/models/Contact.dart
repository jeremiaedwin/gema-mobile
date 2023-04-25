class Contact {
  const Contact({
    required this.nim, 
    required this.full_name, 
    required this.avatar, 
  });

  final String nim;
  final String full_name;
  final String avatar;

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
        nim: json['nim'],
        full_name: json['full_name'],
        avatar: json['avatar'],
    );
  }
}