import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/Ad.dart';
import '../models/AdDetail.dart';

class AdController {
  String? basename(File file) {
    return file.path.split('/').last;
  }

  Future<List<Ad>> getDatabyCategory(String category_id) async {
    final apiUrl = Uri.parse('http://192.168.195.2:8080/api/ad/read/all/');
    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      // konversi json ke list of Ad object
      final data = jsonDecode(response.body) as List<dynamic>;
      return data
          .map((json) => Ad.fromJson(json))
          .where((ad) => ad.category_id == category_id)
          .toList();
    } else {
      throw Exception('Failed to load data from server');
    }
  }

  Future<List<Ad>> getData() async {
    final apiUrl = Uri.parse('http://192.168.195.2:8080/api/ad/read/all');
    final response = await http.get(apiUrl);
    print(response.statusCode);

    if (response.statusCode == 200) {
      // konversi json ke list of Ad object
      final data = jsonDecode(response.body) as List<dynamic>;
      print(data);
      List<dynamic> ads = data.map((json) => Ad.fromJson(json)).toList();
      return data.map((json) => Ad.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data from server');
    }
  }

  Future<List<AdDetail>> getDataDetail(String ad_id) async {
    final apiUrl =
        Uri.parse('http://192.168.195.2:8080/api/ad/read/detail/$ad_id');
    final response = await http.get(apiUrl);
    print(response.statusCode); // this won't printed

    if (response.statusCode == 200) {
      // konversi json ke list of Ad object
      final data = jsonDecode(response.body) as List<dynamic>;
      return data.map((json) => AdDetail.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data from server');
    }
  }

  Future<void> postData(
    String category_id,
    String ad_type_id,
    String condition_id,
    String nim,
    String title,
    String desc,
    String price,
    File? image,
  ) async {
    final apiUrl = Uri.parse('http://C/api/ad/create');
    final request = http.MultipartRequest('POST', apiUrl);
    request.fields['category_id'] = category_id;
    request.fields['ad_type_id'] = ad_type_id;
    request.fields['condition_id'] = condition_id;
    request.fields['nim'] = nim;
    request.fields['title'] = title;
    request.fields['description'] = desc;
    request.fields['price'] = price;
    request.fields['status_id'] = '1';
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
    } else {
      print('Image file is not selected');
    }
    final response = await request.send();
    print(request.fields);
    print(response.statusCode);
    final responseString = await response.stream.bytesToString();
    print('Response body: $responseString');
    if (response.statusCode == 200) {
      // Successful request
      print('Post request successful');
    } else {
      // Error occurred
      print('Error occurred while posting data: ${response.reasonPhrase}');
    }
  }
}
