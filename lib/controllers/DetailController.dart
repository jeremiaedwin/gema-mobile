import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import "../pages/detail.dart";
import '../pages/profilToko.dart';

class DataProdukNormal extends StatelessWidget {
  DataProdukNormal({required this.teks});

  final String teks;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: new Align(
        alignment: Alignment.topLeft,
        child: new Text(teks, style: new TextStyle(fontSize: 14.0)),
      ),
    );
  }
}

class DataProdukBold extends StatelessWidget {
  DataProdukBold({required this.teks});

  final String teks;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: new Align(
        alignment: Alignment.topLeft,
        child: new Text(teks,
            style: new TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class DetailProduk extends StatelessWidget {
  DetailProduk(
      {required this.kondisi, required this.min, required this.kategori});

  final String kondisi, min, kategori;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: new Column(
      children: <Widget>[
        new Row(
          children: [
            new Container(
              margin: EdgeInsets.only(bottom: 10, right: 100),
              child: new Align(
                alignment: Alignment.topLeft,
                child:
                    new Text("Kondisi", style: new TextStyle(fontSize: 14.0)),
              ),
            ),
            new DataProdukNormal(teks: kondisi)
          ],
        ),
        new Row(
          children: [
            new Container(
              margin: EdgeInsets.only(bottom: 10, right: 50),
              child: new Align(
                alignment: Alignment.topLeft,
                child: new Text("Min. Pembelian",
                    style: new TextStyle(fontSize: 14.0)),
              ),
            ),
            new DataProdukNormal(teks: min)
          ],
        ),
        new Row(
          children: [
            new Container(
              margin: EdgeInsets.only(bottom: 10, right: 90),
              child: new Align(
                alignment: Alignment.topLeft,
                child:
                    new Text("Kategori", style: new TextStyle(fontSize: 14.0)),
              ),
            ),
            new DataProdukNormal(teks: kategori)
          ],
        )
      ],
    ));
  }
}

class FotoToko extends StatelessWidget {
  FotoToko({required this.foto});

  final String foto;

  @override
  Widget build(BuildContext context) {
    return new InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => profilToko()),
          );
        },
        child: ClipOval(
          //no need to provide border radius to make circular image
          child: new CachedNetworkImage(
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  imageUrl: foto,
            height: 50.0,
            width: 50.0,
            fit: BoxFit.cover, //change image fill type
          ),
        ));
  }
}

class HubungiPenjual extends StatelessWidget {
  HubungiPenjual();

  @override
  Widget build(BuildContext context) {
    return new InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => profilToko()),
          );
        },
        child: new Container(
          padding: EdgeInsets.all(10),
          decoration: new BoxDecoration(
            border: Border.all(color: Color.fromARGB(100, 128, 128, 128)),
            borderRadius: new BorderRadius.all(
              new Radius.circular(
                5.0,
              ),
            ),
            color: Color.fromARGB(1000, 171, 0, 52),
          ),
          child: new Align(
            alignment: Alignment.center,
            child: new Text("Hubungi Penjual",
                style: new TextStyle(fontSize: 14.0, color: Colors.white)),
          ),
        ));
  }
}
