class Chat {
  const Chat({
    required this.ad_id,
    required this.message, 
    required this.receiver_id, 
    required this.sender_id, 
    required this.status_id, 
  });

  final String ad_id;
  final String message;
  final String receiver_id;
  final String sender_id;
  final String status_id;

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
        ad_id: json['ad_id'],
        message: json['message'],
        receiver_id: json['receiver_id'],
        sender_id: json['sender_id'],
        status_id: json['status_id']);
  }
}

// class Message {

//   const Message({
//     required this.sentByMe, 
//     required this.message,  
    // required this.chat_id,
    // required this.message, 
    // required this.receiver_id, 
    // required this.sender_id, 
    // required this.status_id, 
  // });
  // final String sentByMe;
  // final String message;

  // final String chat_id;
  // final String message;
  // final String receiver_id;
  // final String sender_id;
  // final String status_id;

  // factory Message.fromJson(Map<String, dynamic> json) {
  //   return Message(
  //     sentByMe: json['sentByMe'],
  //     message: json['message'],
      // chat_id: json['chat_id'],
      // message: json['message'],
      // receiver_id: json['receiver_id'],
      // sender_id: json['sender_id'],
      // status_id: json['status_id'],
//     );
//   }
// }