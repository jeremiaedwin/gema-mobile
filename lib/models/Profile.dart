class Profile {
  const Profile({
    required this.email,
    required this.full_name, 
    required this.nim, 
    required this.phone_number, 
    required this.username, 
    required this.avatar, 
    required this.password, 
    required this.token, 
  });
  final String email;
  final String full_name; 
  final String nim; 
  final String phone_number; 
  final String username; 
  final String avatar; 
  final String password; 
  final String token; 

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      email: json['email'],
      full_name: json['full_name'],
      nim: json['nim'],
      phone_number: json['phone_number'],
      username: json['username'],
      avatar: json['avatar'],
      password: json['password'],
      token: json['token'],
    );
  }

  Profile copyWith(Profile updatedProfile, {
    String? email,
    String? full_name,
    String? nim,
    String? phone_number,
    String? username,
    String? avatar,
    String? password,
    String? token,
  }) {
    return Profile(
      email: email ?? this.email,
      full_name: full_name ?? this.full_name,
      nim: nim ?? this.nim,
      phone_number: phone_number ?? this.phone_number,
      username: username ?? this.username,
      avatar: avatar ?? this.avatar,
      password: password ?? this.password,
      token: token ?? this.token,
    );
  }
}