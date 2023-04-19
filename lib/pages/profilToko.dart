import 'package:flutter/material.dart';
import '../widgets/search.dart';
import 'detail.dart';
import '../widgets/ProfilToko-widgets.dart';
import '../widgets/DetailProduk-widgets.dart';

class profilToko extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Color.fromARGB(1000, 171, 0, 52),
          title: new Text(
            "Profile Toko",
            style: TextStyle(fontSize: 14.0, color: Colors.white),
          ),
        ),
        body: new Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 7,
          decoration: new BoxDecoration(
            border: Border.all(color: Color.fromARGB(100, 128, 128, 128)),
            borderRadius: new BorderRadius.all(
              new Radius.circular(
                5.0,
              ),
            ),
            color: Colors.white,
          ),
          child: new Row(
            children: <Widget>[
              new Row(
                children: [
                  new Container(
                    margin: EdgeInsets.only(right: 20),
                    child: DataToko(
                        foto:
                            "https://awsimages.detik.net.id/community/media/visual/2022/08/07/resep-nasi-goreng-ayam-dan-ebi_43.jpeg?w=700&q=90"),
                  ),
                  new Column(
                    children: <Widget>[
                      new Container(
                        child: new DataProdukBold(teks: "Warung Teh Nur"),
                      ),
                      Chat()
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
