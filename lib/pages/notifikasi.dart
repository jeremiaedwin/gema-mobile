import 'package:flutter/material.dart';

class Notifikasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            children: <Widget>[
              //--------------------------------------------------------------------
              //Notifikasi-Terbaru
              //--------------------------------------------------------------------
              Container(
                margin: EdgeInsets.only(left: 10, top: 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Terbaru",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    ListNotifikasi(
                      judul: "Warung Teh Nur diskon 20%",
                      deskripsi:
                          "Hari ini nasi goreng teh nur sedang ada promo, yuk buruan cek sebelum kamu kehabisan",
                    ),
                    ListNotifikasi(
                      judul: "Ada pesan masuk nih",
                      deskripsi:
                          "Warung teh nur baru saja mengirim pesan, ketuk untuk melihat pesan",
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Sebelumnya",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListNotifikasi(
                      judul: "Warung Teh Nur diskon 20%",
                      deskripsi:
                          "Hari ini nasi goreng teh nur sedang ada promo, yuk buruan cek sebelum kamu kehabisan",
                    ),
                    ListNotifikasi(
                      judul: "Ada pesan masuk nih",
                      deskripsi:
                          "Warung teh nur baru saja mengirim pesan, ketuk untuk melihat pesan",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ListNotifikasi extends StatelessWidget {
  ListNotifikasi({required this.judul, required this.deskripsi});

  final String judul;
  final String deskripsi;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(top: 10.0),
      width: MediaQuery.of(context).size.width / 1.06,
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(100, 128, 128, 128)),
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Container(
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                judul,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                deskripsi,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'lihat') {
                // Aksi untuk Menu 1
              } else if (value == 'edit') {
                // Aksi untuk Menu 2
              } else if (value == 'hapus') {
                // Aksi untuk Menu 2
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'lihat',
                child: Text('Lihat'),
              ),
              PopupMenuItem<String>(
                value: 'edit',
                child: Text('Edit'),
              ),
              PopupMenuItem<String>(
                value: 'hapus',
                child: Text('Hapus'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
