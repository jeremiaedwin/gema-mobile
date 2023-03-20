class Category {

  const Category({
    required this.chat_id,
    required this.message, 
    required this.receiver_id, 
    required this.sender_id, 
    required this.status_id, 
  });
  final String chat_id;
  final String message;
  final String receiver_id;
  final String sender_id;
  final String status_id;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      chat_id: json['chat_id'],
      message: json['message'],
      receiver_id: json['receiver_id'],
      sender_id: json['sender_id'],
      status_id: json['status_id'],
    );
  }
}