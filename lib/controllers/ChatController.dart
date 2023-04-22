import 'package:gema_app/models/User.dart';
import 'package:get/get.dart';
import '../models/Chat.dart';
import '../models/User.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ChatController extends GetxController{
  var chatMessages = <Message>[].obs;

  // static Future<void> addChat(Map<String, dynamic> chat) async {
  //   final response = await http.post(Uri.parse('localhost:7000/api/chat/create'),
  //       body: jsonEncode(chat), headers: {'Content-Type': 'application/json'});
  //   if (response.statusCode != 200) {
  //     throw Exception('Failed to add chat');
  //   }
  // }
}