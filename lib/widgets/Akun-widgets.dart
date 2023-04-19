import 'package:flutter/material.dart';

class NamaAkun extends StatelessWidget {
  NamaAkun({required this.teks});

  final String teks;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: new Align(
        alignment: Alignment.topLeft,
        child: new Text(teks,
            style: new TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
    );
  }
}

class NamaOpsi extends StatelessWidget {
  NamaOpsi({required this.teks});

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

class FotoProfil extends StatelessWidget {
  FotoProfil({required this.foto});

  final String foto;

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: ClipOval(
      child: Image(
        image: new NetworkImage(foto),
        height: 75.0,
        width: 75.0,
        fit: BoxFit.cover,
      ),
    ));
  }
}
