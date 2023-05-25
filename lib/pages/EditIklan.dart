import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gema_app/controllers/AdController.dart';
import 'package:gema_app/models/AdDetail.dart';
import 'package:image_picker/image_picker.dart';

File? _image;

class EditIklan extends StatefulWidget {
  const EditIklan({
    required this.ad_id,
    required this.nim,
    Key? key,
  }) : super(key: key);

  final String ad_id;
  final String nim;

  @override
  State<EditIklan> createState() => _EditIklanState();
}

class _EditIklanState extends State<EditIklan> {
  AdController _adController = AdController();
  List<AdDetail> _data = [];
  TextEditingController titleController = new TextEditingController();
  TextEditingController descController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  String _kondisi = '';
  
  @override

  void initState() {
    super.initState();
    _fetchData();
  }

  void _pilihKondisi(String value) {
    setState(() {
      _kondisi = value;
    });
  }

  Future<void> _fetchData() async {
    final data = await _adController.getDataDetail(widget.ad_id);
    setState(() {
      _data = data.cast<AdDetail>();
      titleController.text = _data[0].title;
      descController.text = _data[0].description;
      priceController.text = _data[0].price;
      _kondisi = _data[0].condition_id;

      // Memasukkan data gambar yang sudah ada ke variabel _image
    if (_data[0].image != null) {
      _image = File(_data[0].image!);
    }
    });
  }

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
                        if (_image!.path.startsWith('https://storage.googleapis.com/'))
                           Container(
                            width: 200,
                            height: 300,
                            child: Image.network(_image!.path),
                          )
                        else
                            Container(
                            width: 200,
                            height: 300,
                            child: Image.file(_image!),
                          )
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
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700]),
                  ),
                ),

                new TextField(
                  controller: priceController,
                  decoration: new InputDecoration(
                      hintText: "Harga",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5))),
                ),

                  ElevatedButton(
                      child: const Text('Edit Data'),
                      onPressed: () {
                        setState(() {
                          _adController.putData(context,_data[0].ad_id, _data[0].ad_type_id, _data[0].category_id, _kondisi, widget.nim, titleController.text, descController.text, priceController.text, _image);
                          
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