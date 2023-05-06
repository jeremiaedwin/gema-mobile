import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:gema_app/models/Profile.dart';
import 'package:http/http.dart' as http;

class UserController{
  
  String? basename(File file) {
      return file.path.split('/').last;
    }

  Future<List<Profile>> getDataDetail() async {
    final nim = "211511097";
    final apiUrl = Uri.parse('http://10.0.2.2:8080/api/user/read/$nim');
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

  Future<String> updateProfile(
      String nim,
      String full_name,
      String username,
      String telepon,
      String password,
      String token,
      String email,
      File? image,) async {
    final apiUrl = Uri.parse('http://10.0.2.2:8080/api/user/update/$nim');
    final request = http.MultipartRequest('PATCH', apiUrl);
    request.fields['full_name'] = full_name;
    request.fields['nim'] = nim;
    request.fields['phone_number'] = telepon;
    request.fields['username'] = username;
    request.fields['token'] = token;
    request.fields['password'] = password;
    request.fields['email'] = email;
    if (image != null) {
      final stream = http.ByteStream(image.openRead());
      final length = await image.length();
      final multipartFile = http.MultipartFile.fromBytes(
        'image',
        await image.readAsBytes(),
        filename: basename(image),
      );
      request.files.add(multipartFile);
      print('File is attached: ${request.files.first.filename}');
    }else {
      print('Image file is not selected');
    }
    final response = await request.send();
    print(request.fields);
    print(response.statusCode);
    final responseString = await response.stream.transform(utf8.decoder).join();
    if (response.statusCode == 200) {
      // Successful request
      print('Post request successful');
    } else {
      // Error occurred
      print('Error occurred while posting data: ${response.reasonPhrase}');
    }
    return response.statusCode.toString();
  }
}