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
                    style: new TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              //--------------------------------------------------------------------
              //Iklan
              //--------------------------------------------------------------------
              
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
        //height: MediaQuery.of(context).size.height / 3.5,
        width: MediaQuery.of(context).size.width / 2.6,
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
              ),
            ),
            //--------------------------------------------------------------------
            //judul
            //--------------------------------------------------------------------
            new Container(
              //height: MediaQuery.of(context).size.height / 4.3,
              //width: MediaQuery.of(context).size.width / 2.5,
              height: 15,
              margin: EdgeInsets.only(top: 5),
              child: new Align(
                alignment: Alignment.topLeft,
                child: new Text(
                  judul,
                  style: new TextStyle(fontSize: 14.0),
                ),
              ),
            ),
            //--------------------------------------------------------------------
            //harga
            //--------------------------------------------------------------------
            new Container(
              height: 15,
              margin: EdgeInsets.only(top: 5),
              child: new Align(
                alignment: Alignment.topLeft,
                child: new Text(
                  harga,
                  style: new TextStyle(
                      fontSize: 14.0, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
