import 'dart:async';
import 'dart:convert';
import 'package:gema_app/models/Category.dart';
import 'package:http/http.dart' as http;

class CategoryController{

  Future<List<Category>> getCategory(String id) async{
    final String apiUrl = 'http://10.0.2.2:7000/api/category/read/all'; 
    final String id_type = id;
      final response =
          await http.get(Uri.parse('$apiUrl/$id'));
          print(response.body);
          print(id);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;
        return data.map((json) => Category.fromJson(json)).toList();
      }else{
      throw Exception('Failed to load ad category');
    }

    return [];
  }
}