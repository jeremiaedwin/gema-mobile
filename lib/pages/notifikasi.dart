import 'package:flutter/material.dart';

class Notifikasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        new Container(
            margin: EdgeInsets.only(top: 30, left: 20, right: 20),
            child: new Column(
              children: <Widget>[
                //--------------------------------------------------------------------
                //Notifikasi-Terbaru
                //--------------------------------------------------------------------
                new Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: new Column(
                            children: <Widget>[
                              new Align(
                                alignment: Alignment.topLeft,
                                child: new Text(
                                  "Terbaru",
                                  style: new TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              new ListNotifikasi(
                                  judul: "Warung Teh Nur diskon 20%",
                                  deskripsi:
                                      "Hari ini nasi goreng teh nur sedang ada promo, yuk buruan cek sebelum kamu kehabisan"),
                              new ListNotifikasi(
                                  judul: "Ada pesan masuk nih",
                                  deskripsi:
                                      "Warung teh nur baru saja mengirim pesan, ketuk untuk melihat pesan"),
                            ],
                          ),
                        ),
                        new Container(
                          child: new Column(
                            children: <Widget>[
                              new Align(
                                alignment: Alignment.topLeft,
                                child: new Text(
                                  "Sebelumnya",
                                  style: new TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              new ListNotifikasi(
                                  judul: "Warung Teh Nur diskon 20%",
                                  deskripsi:
                                      "Hari ini nasi goreng teh nur sedang ada promo, yuk buruan cek sebelum kamu kehabisan"),
                              new ListNotifikasi(
                                  judul: "Ada pesan masuk nih",
                                  deskripsi:
                                      "Warung teh nur baru saja mengirim pesan, ketuk untuk melihat pesan"),
                            ],
                          ),
                        )
                      ],
                    )),
              ],
            ))
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
    return new InkWell(
        onTap: () {},
        child: new Container(
          padding: new EdgeInsets.all(10.0),
          margin: new EdgeInsets.only(top: 10.0),
          //height: MediaQuery.of(context).size.width / 5.7,
          width: MediaQuery.of(context).size.width / 1.06,
          decoration: new BoxDecoration(
            border: Border.all(color: Color.fromARGB(100, 128, 128, 128)),
            borderRadius: new BorderRadius.all(
              new Radius.circular(
                5.0,
              ),
            ),
            color: Colors.white,
          ),
          child: new Column(
            children: <Widget>[
              new Container(
                child: new Align(
                  alignment: Alignment.topLeft,
                  child: new Text(
                    judul,
                    style: new TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              new Container(
                margin: EdgeInsets.only(top: 10),
                child: new Align(
                  alignment: Alignment.topLeft,
                  child: new Text(
                    deskripsi,
                    style: new TextStyle(fontSize: 14),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
