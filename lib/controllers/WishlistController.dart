import 'dart:async';
import 'dart:convert';
import 'package:gema_app/models/Wishlist.dart';
import 'package:http/http.dart' as http;

class WishlistController{

  Future<List<Wishlist>> getWishlist(String id) async{
  final String apiUrl = 'http://10.0.2.2:8080/api/wishlist/read/all/$id'; 
  try {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      return data.map((json) => Wishlist.fromJson(json)).toList();
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
    String ad_id,
    String wishlist_id
  ) async {
    final apiUrl = Uri.parse('http://10.0.2.2:8080/api/wishlist/create');
    final response = await http.post(apiUrl, body: {
      'ad_id': ad_id,
      'nim': nim,
      'wishlist_id': wishlist_id,
    });

    if (response.statusCode == 200) {
      print('Wishlist created successfully');
    } else {
      throw Exception('Failed to create wishlist');
    }
  }

  
}