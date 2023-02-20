import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/Category.dart';

List<String> list = <String>['Pilih Kategori', 'Two', 'Three', 'Four'];
String dropdownValue = "Select Category";

Future<Ad> createAd(String title, String desc,String price,String condition,String category) async {
  final http.Response response = await http.post(
    Uri.parse('http://10.0.2.2:8080/api/ad/create'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
      'desc': desc,
      'price': price,
      'condition': condition,
      'category': category,
    }),
  );

  print(response.body);
 
  if (response.statusCode == 201) {
    return Ad.fromJson(json.decode(response.body));
  } else {
     throw Exception('Failed to create Ad.');
  }
}

class Ad {
  final int id;
  final String title;
  final String desc;
  final String price;
  final String condition;
  final String category;
 
  Ad({required this.id, required this.title, required this.desc,required this.price,required this.condition,required this.category, });
 
  factory Ad.fromJson(Map<String, dynamic> json) {
    return Ad(
      id: json['id'],
      title: json['title'],
      desc: json['desc'],
      price: json['price'],
      condition: json['condition'],
      category: json['category'],
    );
  }
}

Future<List<Category>> getCategory() async{
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/api/category/'));
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Category>((json) => Category.fromMap(json)).toList();
}
class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
  
}

class _AddItemState extends State<AddItem> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController descController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  
  String _kondisi = '';
  late Future<List<Category>> futureCategory;
  late Future<Ad> _futureAd;
  @override
  void initState() {
    super.initState();
    futureCategory = getCategory();
  }
  
  @override
  

  void _pilihKondisi(String value){
    setState(() {
      _kondisi = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromARGB(1000, 171, 0, 52),
        title: const Text('Buat Iklan'),
      ),
      body : new ListView(
        children: [
          new Container(
            padding: new EdgeInsets.all(10),
              child: new Column(
                children: <Widget>[
                  new Align(
                    alignment: Alignment.topLeft,
                    child: new Text("Kategori", style: new TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[700]),),
                  ),

                  new Align(
                    alignment: Alignment.topLeft,
                    child: DropdownButtonExample(),
                  ),

                  new Padding(padding: EdgeInsets.only(top: 20)),
                  new Align(
                    alignment: Alignment.topLeft,
                    child: new Text("Detail", style: new TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[700]),),
                  ),

                  // Pilih Kondisi
                  new Padding(padding: EdgeInsets.only(top: 20)),
                  new Align(
                    alignment: Alignment.topLeft,
                    child: new Text("Kondisi", style: new TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey[700]),),
                  ),
                  new RadioListTile(value: "Baru", title: new Text("Baru"), groupValue: _kondisi, onChanged: (String? value) { _pilihKondisi(value!); }, activeColor: Color.fromARGB(1000, 171, 0, 52),),
                  new RadioListTile(value: "Bekas", title: new Text("Bekas"), groupValue: _kondisi, onChanged: (String? value) { _pilihKondisi(value!); }, activeColor: Color.fromARGB(1000, 171, 0, 52),),

                  // Input Judul Iklan
                  new Padding(padding: EdgeInsets.only(top: 20)),
                  new Align(
                    alignment: Alignment.topLeft,
                    child: new Text("Judul Iklan", style: new TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey[700]),),
                  ),
                  new TextField(
                    controller: titleController,
                    decoration: new InputDecoration(
                      hintText: "Judul",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5)
                      )
                    ),
                  ),

                  new Padding(padding: EdgeInsets.only(top: 20)),
                  new Align(
                    alignment: Alignment.topLeft,
                    child: new Text("Deskripsi", style: new TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey[700]),),
                  ),
                  new TextField(
                    controller: descController,
                    maxLines: 4,
                    decoration: new InputDecoration(
                      hintText: "Deskripsi",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5)
                      )
                    ),
                  ),


                  new Padding(padding: EdgeInsets.only(top: 20)),
                  new Align(
                    alignment: Alignment.topLeft,
                    child: new Text("Tentukan Harga", style: new TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[700]),),
                  ),

                  // Pilih Kondisi
                  new Padding(padding: EdgeInsets.only(top: 20)),
                  new Align(
                    alignment: Alignment.topLeft,
                    child: new Text("Kondisi", style: new TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey[700]),),
                  ),
                  new TextField(
                    controller: priceController,
                    decoration: new InputDecoration(
                      hintText: "Harga",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5)
                      )
                    ),
                  ),

                  ElevatedButton(
                      child: const Text('Create Data'),
                      onPressed: () {
                        setState(() {
                          _futureAd = createAd(titleController.text, descController.text, priceController.text, _kondisi, dropdownValue);
                        });
                      },
                    ),
                ],
              ),
            ),
        ],
      ) ,
      );
  }
}


class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Color.fromARGB(232, 85, 84, 84)),
      underline: Container(
        height: 2,
        color: Color.fromARGB(1000, 171, 0, 52),
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}