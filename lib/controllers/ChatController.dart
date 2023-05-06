import 'package:gema_app/models/User.dart';
import 'package:get/get.dart';
import '../models/Chat.dart';
import '../models/Contact.dart';
import '../models/User.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ChatController extends GetxController {
  // var chatMessages = <Message>[].obs;

  // static Future<void> addChat(Map<String, dynamic> chat) async {
  //   final response = await http.post(Uri.parse('localhost:7000/api/chat/create'),
  //       body: jsonEncode(chat), headers: {'Content-Type': 'application/json'});
  //   if (response.statusCode != 200) {
  //     throw Exception('Failed to add chat');
  //   }
  // }

  Future<List<Contact>> getContact() async {
    final String apiUrl = 'http://192.168.231.2:8080/api/chat/contact';
    final response = await http.get(Uri.parse('$apiUrl'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      return data.map((json) => Contact.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load ad Contact');
    }

    return [];
  }

  Future<void> sendMessage(String? ad_id, String message, String receiver_id,
      String sender_id) async {
    final apiUrl = Uri.parse('http://192.168.231.2:8080/api/chat/create');
    final headers = {'Content-Type': 'application/json'};
      final data = <String, dynamic>{
      'message': message,
      'receiver_id': receiver_id,
      'sender_id': sender_id,
      'status_id': '3',
    };
    if (ad_id != null) {
      data['ad_id'] = ad_id;
    } else {
      data['ad_id'] = null;
    }
    final response =
        await http.post(apiUrl, headers: headers, body: jsonEncode(data));
    print(response.statusCode);
    if (response.statusCode == 200) {
      // Successful request
      print('Post request successful');
    } else {
      // Error occurred
      print('Error occurred while posting data: ${response.reasonPhrase}');
    }
  }
}
