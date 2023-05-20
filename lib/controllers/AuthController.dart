import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:gema_app/main.dart' as main;

class AuthController{

  Future <void> signIn(
    BuildContext context,
    String email,
    String password
  ) async {
    
    final apiUrl = Uri.parse('http://10.0.2.2:8080/api/auth/signin');
    final response = await http.post(apiUrl, body: {
      'email': email,
      'password': password
    });

    if (response.statusCode == 200) {
      // print('Logged In successfully');
      // main.MyApp app = context.findAncestorWidgetOfExactType<main.MyApp>()!;
      // app.setLoggedIn(true); 
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => main.MyApp(),
        ),
      );
    } else {
      throw Exception('Failed to Log In');
    }
  }

  
}