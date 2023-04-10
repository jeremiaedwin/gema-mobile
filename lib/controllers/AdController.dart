import 'dart:convert';
import 'package:http/http.dart' as http;

class AdController {
  Future<void> postData(
      String ad_id,
      String category_id,
      String ad_type_id,
      String condition_id,
      String nim,
      String title,
      String desc,
      int price) async {
    final apiUrl = Uri.parse('http://10.0.2.2:7000/api/ad/create');
    final response = await http.post(
      apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'ad_id': ad_id,
        'category_id': category_id,
        'type_id': ad_type_id,
        'condition_id': condition_id,
        'nim': nim,
        'title': title,
        'description': desc,
        'price': price.toString(),
        'image': 'image.png',
        'status_id': '1'
      }),
    );

    if (response.statusCode == 200) {
      // Successful request
      print('Post request successful');
    } else {
      // Error occurred
      print('Error occurred while posting data: ${response.reasonPhrase}');
    }
  }
}
