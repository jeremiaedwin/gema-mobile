import 'dart:async';
import 'dart:convert';
import 'package:gema_app/models/Wishlist.dart';
import 'package:http/http.dart' as http;

class WishlistController{

  Future<List<Wishlist>> getWishlist(String id) async{
    final String apiUrl = 'http://10.0.2.2:8080/api/wishlist/read/all/$id'; 
    final String id_type = id;
      final response =
          await http.get(Uri.parse('$apiUrl/$id'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;
        return data.map((json) => Wishlist.fromJson(json)).toList();
      }else{
      throw Exception('Failed to load Wishlist');
    }

    return [];
  }

  
}