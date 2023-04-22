import 'dart:async';
import 'dart:convert';
import 'package:gema_app/models/Category.dart';
import 'package:http/http.dart' as http;

class CategoryController{

  Future<List<Category>> getCategory(String id) async{
    final String apiUrl = 'http://10.0.2.2:8080/api/category/read/all'; 
    final String id_type = id;
      final response =
          await http.get(Uri.parse('$apiUrl/$id'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;
        return data.map((json) => Category.fromJson(json)).toList();
      }else{
      throw Exception('Failed to load ad category');
    }

    return [];
  }

  Future<List<Category>> getDataDetail(String category_id) async {
    final apiUrl = Uri.parse('http://10.0.2.2:8080/api/category/read/all');
    final response = await http.get(apiUrl); 
    print(response.statusCode); // this won't printed

    if (response.statusCode == 200) {
      // konversi json ke list of Ad object
      final data = jsonDecode(response.body) as List<dynamic>;
      return data.map((json) => Category.fromJson(json)).where((category) => category.category_id == category_id).toList();
    } else {
      throw Exception('Failed to load data from server');
    }
  }
}