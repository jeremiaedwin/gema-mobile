class User {

  const User({
    required this.socketId
  });
  final String socketId;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      socketId: json['socketId'],
    );
  }
}

