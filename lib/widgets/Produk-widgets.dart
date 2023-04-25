import 'package:flutter/material.dart';
import '../../widgets/DetailProduk-widgets.dart';
import '../pages/setting/KelolaProduk.dart';

class OpsiProduk extends StatelessWidget {
  OpsiProduk({required this.foto, required this.nama});

  final String foto;
  final String nama;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        decoration: new BoxDecoration(
          border: Border.all(color: Color.fromARGB(100, 128, 128, 128)),
          borderRadius: new BorderRadius.all(
            new Radius.circular(
              5.0,
            ),
          ),
          color: Colors.white,
        ),
        child: new InkWell(
          onTap: () {
            _showDropdown(context);
          },
          child: Row(
            children: [
              //foto-produk---------------------------------------------------------
              Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new Image(
                  image: new NetworkImage(
                    foto,
                  ),
                  fit: BoxFit.cover,
                ),
              ),

              //nama-produk---------------------------------------------------------
              Container(
                  margin: EdgeInsets.only(left: 20),
                  child: TextNormal(
                    teks: "Nasi Goreng teh nur",
                  ))
            ],
          ),
        ));
  }
}

void _showDropdown(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          width: double.maxFinite,
          child: DropdownButton<String>(
            value: _selectedItem,
            items: [
              DropdownMenuItem(child: Text('Item 1'), value: 'item_1'),
              DropdownMenuItem(child: Text('Item 2'), value: 'item_2'),
              DropdownMenuItem(child: Text('Item 3'), value: 'item_3'),
            ],
            onChanged: (String? value) {
              setState(() {
                _selectedItem = value;
              });
            },
          ),
        ),
      );
    },
  );
}
