import 'package:flutter/material.dart';
import '../widgets/search.dart';
import '../widgets/DetailProduk-widgets.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Color.fromARGB(1000, 171, 0, 52),
          title: new Text(
            "Detail Produk",
            style: TextStyle(fontSize: 14.0, color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                },
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addItem');
                },
                icon: const Icon(Icons.add)),
          ],
        ),
        body: new ListView(
          children: <Widget>[
            new Container(
              child: new Column(
                children: <Widget>[
                  //gambar produk-----------------------------------------------------
                  new Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 4,
                    decoration: new BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(100, 128, 128, 128)),
                      borderRadius: new BorderRadius.all(
                        new Radius.circular(
                          5.0,
                        ),
                      ),
                      color: Colors.white,
                    ),
                    child: new Image(
                      image: new NetworkImage(
                        "https://awsimages.detik.net.id/community/media/visual/2022/08/07/resep-nasi-goreng-ayam-dan-ebi_43.jpeg?w=700&q=90",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),

                  //produk------------------------------------------------------------
                  new Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(20),
                      decoration: new BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(100, 128, 128, 128)),
                        borderRadius: new BorderRadius.all(
                          new Radius.circular(
                            5.0,
                          ),
                        ),
                        color: Colors.white,
                      ),
                      child: new Column(
                        children: <Widget>[
                          //harga-----------------------------------------------------
                          new DataProdukBold(teks: "Rp. 12000"),

                          //nama------------------------------------------------------
                          new DataProdukNormal(teks: "Nasi Goreng")
                        ],
                      )),

                  //Detail Produk-----------------------------------------------------
                  new Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: new BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(100, 128, 128, 128)),
                      borderRadius: new BorderRadius.all(
                        new Radius.circular(
                          5.0,
                        ),
                      ),
                      color: Colors.white,
                    ),
                    child: new Column(
                      children: <Widget>[
                        //Detail produk kategori
                        new Container(
                          margin: EdgeInsets.all(20),
                          child: new Column(
                            children: <Widget>[
                              new Container(
                                child:
                                    new DataProdukBold(teks: "Detail Produk"),
                              ),
                              new Container(
                                child: DetailProduk(
                                  kondisi: "Baru",
                                  min: "1",
                                  kategori: "Makanan",
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  //Deskripsi Produk--------------------------------------------------
                  new Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(20),
                    decoration: new BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(100, 128, 128, 128)),
                      borderRadius: new BorderRadius.all(
                        new Radius.circular(
                          5.0,
                        ),
                      ),
                      color: Colors.white,
                    ),
                    child: new Column(
                      children: [
                        new DataProdukBold(teks: "Deskripsi Produk"),
                        new DataProdukNormal(
                            teks:
                                "Nasi goreng kualitas terbaik, harga bersahabat, tersedia dalam beberapa jenis"),
                      ],
                    ),
                  ),

                  //Toko--------------------------------------------------
                  new Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(20),
                    decoration: new BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(100, 128, 128, 128)),
                      borderRadius: new BorderRadius.all(
                        new Radius.circular(
                          5.0,
                        ),
                      ),
                      color: Colors.white,
                    ),
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            child: new Row(
                              children: <Widget>[
                                new Container(
                                  margin: EdgeInsets.only(right: 20),
                                  child: FotoToko(
                                      foto:
                                          "https://awsimages.detik.net.id/community/media/visual/2022/08/07/resep-nasi-goreng-ayam-dan-ebi_43.jpeg?w=700&q=90"),
                                ),
                                new Container(
                                  child: new DataProdukBold(
                                      teks: "Warung Teh Nur"),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  //Hubungi Penjual---------------------------------------------------
                  new Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(20),
                    decoration: new BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(100, 128, 128, 128)),
                      borderRadius: new BorderRadius.all(
                        new Radius.circular(
                          5.0,
                        ),
                      ),
                      color: Colors.white,
                    ),
                    child: HubungiPenjual(),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
