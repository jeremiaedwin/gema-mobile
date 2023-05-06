import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gema_app/controllers/AdTypeController.dart';
import 'package:gema_app/controllers/CategoryController.dart';
import 'package:gema_app/controllers/AdController.dart';
import 'package:gema_app/models/AdType.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/Category.dart';
import 'package:image_picker/image_picker.dart';

File? _image;

void main() {
  runApp(new MaterialApp(home: new AdTypeView(), routes: {
    '/addItem/ad': (BuildContext context) => new AdTypeView(),
  }));
}

class AdTypeView extends StatefulWidget {
  @override
  _AdTypeViewState createState() => _AdTypeViewState();
}

class _AdTypeViewState extends State<AdTypeView> {
  AdTypeController _adTypeController = AdTypeController();
  List<AdType> _data = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final data = await _adTypeController.getAdType();
    setState(() {
      _data = data.cast<AdType>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromARGB(1000, 171, 0, 52),
        title: const Text('Pilih Jenis Iklan'),
      ),
      body: new ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          final item = _data[index];
          new Padding(padding: EdgeInsets.only(top: 20));
          return Card(
              child: ListTile(
                  title: Text(
                    item.ad_type_name,
                    style: new TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => new AdCategory(
                          ad_type_id: item.ad_type_id,
                        ),
                      ),
                    );
                  }));
        },
      ),
    );
  }
}

class AdCategory extends StatefulWidget {
  final String ad_type_id;

  const AdCategory({required this.ad_type_id, Key? key}) : super(key: key);

  @override
  State<AdCategory> createState() => _AdCategoryState();
}

class _AdCategoryState extends State<AdCategory> {
  CategoryController _categoryController = CategoryController();
  List<Category> _data = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final data = await _categoryController.getCategory(widget.ad_type_id);
    setState(() {
      _data = data.cast<Category>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromARGB(1000, 171, 0, 52),
        title: const Text('Pilih Jenis Iklan'),
      ),
      body: new ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          final item = _data[index];
          new Padding(padding: EdgeInsets.only(top: 20));
          return Card(
              child: ListTile(
                  title: Text(
                    item.category_name,
                    style: new TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => new AddItem(
                            ad_type_id: item.category_id,
                            category_id: widget.ad_type_id),
                      ),
                    );
                  }));
        },
      ),
    );
  }
}

class AddItem extends StatefulWidget {
  final String ad_type_id;
  final String category_id;

  const AddItem({
    required this.ad_type_id,
    required this.category_id,
    Key? key,
  }) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  AdController _adController = AdController();

  TextEditingController titleController = new TextEditingController();
  TextEditingController descController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  String _kondisi = '';

  @override
  void _pilihKondisi(String value) {
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
      body: new ListView(
        children: [
          new Container(
            padding: new EdgeInsets.all(10),
            child: new Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.only(top: 20)),
                new Align(
                  alignment: Alignment.topLeft,
                  child: new Text(
                    "Detail",
                    style: new TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  ),
                ),

                new Padding(padding: EdgeInsets.only(top: 20)),
                new Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      MaterialButton(
                        color: Color.fromARGB(1000, 171, 0, 52),
                        child: const Text("Pick Image from Gallery",
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold)),
                        onPressed: () async {
                          final pickedImage = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (pickedImage != null) {
                            setState(() {
                              _image = File(pickedImage.path);
                            });
                          }
                        },
                      ),
                      MaterialButton(
                        color: Color.fromARGB(1000, 171, 0, 52),
                        child: const Text("Pick Image from Camera",
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold)),
                        onPressed: () async {
                          final pickedImage = await ImagePicker()
                              .pickImage(source: ImageSource.camera);
                          if (pickedImage != null) {
                            setState(() {
                              _image = File(pickedImage.path);
                            });
                          }
                        },
                      ),
                      if (_image != null)
                        Container(
                          width: 200,
                          height: 300,
                          child: Image.file(_image!),
                        ),
                    ],
                  ),
                ),

                // Pilih Kondisi
                new Padding(padding: EdgeInsets.only(top: 20)),
                new Align(
                  alignment: Alignment.topLeft,
                  child: new Text(
                    "Kondisi",
                    style: new TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700]),
                  ),
                ),
                new RadioListTile(
                  value: "1",
                  title: new Text("Baru"),
                  groupValue: _kondisi,
                  onChanged: (String? value) {
                    _pilihKondisi(value!);
                  },
                  activeColor: Color.fromARGB(1000, 171, 0, 52),
                ),
                new RadioListTile(
                  value: "2",
                  title: new Text("Bekas"),
                  groupValue: _kondisi,
                  onChanged: (String? value) {
                    _pilihKondisi(value!);
                  },
                  activeColor: Color.fromARGB(1000, 171, 0, 52),
                ),

                // Input Judul Iklan
                new Padding(padding: EdgeInsets.only(top: 20)),
                new Align(
                  alignment: Alignment.topLeft,
                  child: new Text(
                    "Judul Iklan",
                    style: new TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700]),
                  ),
                ),
                new TextField(
                  controller: titleController,
                  decoration: new InputDecoration(
                      hintText: "Judul",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5))),
                ),

                new Padding(padding: EdgeInsets.only(top: 20)),
                new Align(
                  alignment: Alignment.topLeft,
                  child: new Text(
                    "Deskripsi",
                    style: new TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700]),
                  ),
                ),
                new TextField(
                  controller: descController,
                  maxLines: 4,
                  decoration: new InputDecoration(
                      hintText: "Deskripsi",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5))),
                ),

                new Padding(padding: EdgeInsets.only(top: 20)),
                new Align(
                  alignment: Alignment.topLeft,
                  child: new Text(
                    "Tentukan Harga",
                    style: new TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  ),
                ),

                // Pilih Kondisi
                new Padding(padding: EdgeInsets.only(top: 20)),

                new TextField(
                  controller: priceController,
                  decoration: new InputDecoration(
                      hintText: "Harga",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5))),
                ),

                  ElevatedButton(
                      child: const Text('Create Data'),
                      onPressed: () {
                        setState(() {
                          _adController.postData(widget.ad_type_id, widget.category_id, _kondisi, '211511097', titleController.text, descController.text, priceController.text, _image);
                          titleController.clear();
                          descController.clear();
                          priceController.clear();
                          _kondisi = '';
                          _image = null;
                        });
                      },
                    ),
                ],
              ),
          ),
        ],
      ),
    );
  }
}
