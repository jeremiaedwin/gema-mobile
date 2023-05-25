import 'package:flutter/material.dart';
import '../pages/detail.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ListIklan extends StatelessWidget {
  ListIklan(
      {required this.foto,
      required this.judul,
      required this.harga,
      required this.ad_id,
      required this.nimUser});
  final String ad_id;
  final String foto;
  final String judul;
  final String harga;
  final String nimUser;

  @override
  Widget build(BuildContext context) {
    print(nimUser);
    return new InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => new Detail(ad_id: ad_id, nimUser: nimUser)),
        );
      },
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
              child: CachedNetworkImage(
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                imageUrl: foto,
                width: MediaQuery.of(context).size.width,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            //--------------------------------------------------------------------
            //judul
            //--------------------------------------------------------------------

            new Container(
              //height: MediaQuery.of(context).size.height / 4.3,
              //width: MediaQuery.of(context).size.width / 2.5,
              height: 15,
              margin: EdgeInsets.only(top: 10),
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
              //margin: EdgeInsets.only(top: 5),
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
