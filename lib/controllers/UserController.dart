import 'dart:async';
import 'dart:convert';
import 'package:gema_app/models/Profile.dart';
import 'package:http/http.dart' as http;

class UserController {
  Future<List<Profile>> getDataDetail() async {
    final nim = "211511097";
    final apiUrl = Uri.parse('http://192.168.195.2:8080/api/user/read/$nim');
    final response = await http.get(apiUrl);
    print(response.statusCode);

    if (response.statusCode == 200) {
      // konversi json ke list of Ad object
      print('test');
      final data = jsonDecode(response.body) as List<dynamic>;
      print('test2');

      return data.map((json) => Profile.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data from server');
    }
  }
}
