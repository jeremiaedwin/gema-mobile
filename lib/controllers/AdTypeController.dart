import 'dart:async';
import 'dart:convert';
import 'package:gema_app/models/AdType.dart';
import 'package:http/http.dart' as http;

class AdTypeController {
  Future<List<AdType>> getAdType() async {
    final response = await http
        .get(Uri.parse('http://192.168.1.8:7000/api/adtype/read/all'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      return data.map((json) => AdType.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load ad type');
    }

    return [];
  }
}
