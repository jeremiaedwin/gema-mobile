import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gema_app/main.dart' as main;

class AuthController {
  Future<void> signIn(BuildContext context, String email, String password) async {
    final apiUrl = Uri.parse('http://10.0.2.2:8080/api/auth/signin');
    final response = await http.post(apiUrl, body: {
      'email': email,
      'password': password
    });
    if (response.statusCode == 200) {
      print('Logged In');

      final userApiUrl = Uri.parse('http://10.0.2.2:8080/api/user/read/all');
      final userResponse = await http.get(userApiUrl);

      if (userResponse.statusCode == 200) {
        final userData = jsonDecode(userResponse.body);

        final users = List<Map<String, dynamic>>.from(userData);

        final user = users.firstWhere(
          (user) => user['email'] == email,
        );

        
          final nim = user['nim'].toString();

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => main.MyHomePage(nim: nim)),
          );
      }
    } else {
      throw Exception('Failed to Log In');
    }
  }
}