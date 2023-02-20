import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        new Container(
          margin: EdgeInsets.only(top: 30, left: 20, right: 20),
          child: new Column(
            children: <Widget>[
              //--------------------------------------------------------------------
              //Kategori
              //--------------------------------------------------------------------
              new Container(
                margin: EdgeInsets.only(bottom: 20),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.card_giftcard,
                          color: Color.fromARGB(255, 52, 53, 57),
                          size: 40,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.restaurant,
                          color: Color.fromARGB(255, 52, 53, 57),
                          size: 40,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.local_drink,
                          color: Color.fromARGB(255, 52, 53, 57),
                          size: 40,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.design_services,
                          color: Color.fromARGB(255, 52, 53, 57),
                          size: 40,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.video_camera_back,
                          color: Color.fromARGB(255, 52, 53, 57),
                          size: 40,
                        )),
                  ],
                ),
              ),
              //--------------------------------------------------------------------
              //rekomendasi
              //--------------------------------------------------------------------
              new Container(
                margin: EdgeInsets.only(left: 10, top: 10),
                child: new Align(
                  alignment: Alignment.topLeft,
                  child: new Text(
                    "Rekomendasi",
                    style:
                        new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              //--------------------------------------------------------------------
              //Iklan
              //--------------------------------------------------------------------
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new ListIklan(
                      foto:
                          "https://awsimages.detik.net.id/community/media/visual/2022/08/07/resep-nasi-goreng-ayam-dan-ebi_43.jpeg?w=700&q=90",
                      judul: "Nasi Goreng",
                      harga: "Rp. 12.000"),
                  new ListIklan(
                      foto:
                          "https://awsimages.detik.net.id/community/media/visual/2022/08/07/resep-nasi-goreng-ayam-dan-ebi_43.jpeg?w=700&q=90",
                      judul: "Nasi Goreng",
                      harga: "Rp. 12.000"),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new ListIklan(
                      foto:
                          "https://awsimages.detik.net.id/community/media/visual/2022/08/07/resep-nasi-goreng-ayam-dan-ebi_43.jpeg?w=700&q=90",
                      judul: "Nasi Goreng",
                      harga: "Rp. 12.000"),
                  new ListIklan(
                      foto:
                          "https://awsimages.detik.net.id/community/media/visual/2022/08/07/resep-nasi-goreng-ayam-dan-ebi_43.jpeg?w=700&q=90",
                      judul: "Nasi Goreng",
                      harga: "Rp. 12.000"),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new ListIklan(
                      foto:
                          "https://awsimages.detik.net.id/community/media/visual/2022/08/07/resep-nasi-goreng-ayam-dan-ebi_43.jpeg?w=700&q=90",
                      judul: "Nasi Goreng",
                      harga: "Rp. 12.000"),
                  new ListIklan(
                      foto:
                          "https://awsimages.detik.net.id/community/media/visual/2022/08/07/resep-nasi-goreng-ayam-dan-ebi_43.jpeg?w=700&q=90",
                      judul: "Nasi Goreng",
                      harga: "Rp. 12.000"),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ListIklan extends StatelessWidget {
  ListIklan({required this.foto, required this.judul, required this.harga});

  final String foto;
  final String judul;
  final String harga;

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {},
      child: new Container(
        height: 170,
        width: 165,
        decoration: new BoxDecoration(
          border: Border.all(color: Color.fromARGB(100, 128, 128, 128)),
          borderRadius: new BorderRadius.all(
            new Radius.circular(
              5.0,
            ),
          ),
          color: Colors.white,
        ),
        padding: new EdgeInsets.all(10.0),
        margin: new EdgeInsets.only(top: 10, right: 10, left: 10),
        child: new Column(
          children: <Widget>[
            //--------------------------------------------------------------------
            //foto
            //--------------------------------------------------------------------
            new Container(
              child: new Image(
                image: new NetworkImage(foto),
                width: 140,
                height: 100,
              ),
            ),
            //--------------------------------------------------------------------
            //judul
            //--------------------------------------------------------------------
            new Container(
              margin: EdgeInsets.only(top: 15, left: 5),
              child: new Align(
                alignment: Alignment.topLeft,
                child: new Text(
                  judul,
                  style: new TextStyle(fontSize: 15.0),
                ),
              ),
            ),
            //--------------------------------------------------------------------
            //harga
            //--------------------------------------------------------------------
            new Container(
              margin: EdgeInsets.only(top: 5, left: 5),
              child: new Align(
                alignment: Alignment.topLeft,
                child: new Text(
                  harga,
                  style: new TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
