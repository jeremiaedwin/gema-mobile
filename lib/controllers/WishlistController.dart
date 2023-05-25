import 'dart:async';
import 'dart:convert';
import 'package:gema_app/models/Wishlist.dart';
import 'package:http/http.dart' as http;
import 'dart:math';


class WishlistController{

  Future<List<Wishlist>> getWishlist(String id) async {
  final String apiUrl = 'http://10.0.2.2:8080/api/wishlist/read/all/$id';
  try {
    final response = await http.get(Uri.parse(apiUrl));
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      final data = jsonDecode(response.body) as List<dynamic>?; // Add null safety
      if (data != null) {
        return data.map((json) => Wishlist.fromJson(json)).toList();
      } else {
        return []; // Return an empty list if data is null
      }
    } else {
      throw Exception('Failed to load Wishlist: ${response.statusCode}');
    }
  } catch (e) {
    print('Error loading wishlist: $e');
    throw Exception('Failed to load Wishlist');
  }
}

  Future <void> addWishlist(
    String nim,
    String ad_id
  ) async {
    
    final apiUrl = Uri.parse('http://10.0.2.2:8080/api/wishlist/create');
    final response = await http.post(apiUrl, body: {
      'nim': nim,
      'ad_id': ad_id,
    });

    if (response.statusCode == 200) {
      print('Wishlist created successfully');
    } else {
      throw Exception('Failed to create wishlist');
    }
  }
}
