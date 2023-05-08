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
          onTap: () {},
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