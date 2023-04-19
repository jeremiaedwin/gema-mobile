import 'package:flutter/material.dart';
import 'package:gema_app/pages/input.dart';
import 'package:gema_app/pages/setting.dart';
import '../widgets/Akun-widgets.dart';
import '../pages/produk.dart';
import '../pages/setting.dart';

class Akun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          //Data Akun---------------------------------------------------------------
          new Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 7,
            decoration: new BoxDecoration(
              border: Border.all(color: Color.fromARGB(100, 128, 128, 128)),
              borderRadius: new BorderRadius.all(
                new Radius.circular(
                  0.0,
                ),
              ),
              color: Color.fromARGB(1000, 171, 0, 52),
            ),
            child: new Row(children: <Widget>[
              new Container(
                margin: EdgeInsets.only(right: 20),
                child: FotoProfil(
                    foto:
                        "https://awsimages.detik.net.id/community/media/visual/2022/08/07/resep-nasi-goreng-ayam-dan-ebi_43.jpeg?w=700&q=90"),
              ),
              new Column(
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.only(top: 25),
                    child: new NamaAkun(teks: "User 09238409238049"),
                  )
                ],
              ),
            ]),
          ),

          //Opsi->produk--------------------------------------------------------
          new Container(
              child: new InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => produk()),
              );
            },
            child: new Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 12,
                decoration: new BoxDecoration(
                  border: Border.all(color: Color.fromARGB(100, 128, 128, 128)),
                  borderRadius: new BorderRadius.all(
                    new Radius.circular(
                      5.0,
                    ),
                  ),
                  color: Colors.white,
                ),
                child: NamaOpsi(teks: "Kelola Produk")),
          )),

          //Opsi->setting-------------------------------------------------------
          new Container(
              child: new InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FormPage()),
              );
            },
            child: new Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 12,
                decoration: new BoxDecoration(
                  border: Border.all(color: Color.fromARGB(100, 128, 128, 128)),
                  borderRadius: new BorderRadius.all(
                    new Radius.circular(
                      5.0,
                    ),
                  ),
                  color: Colors.white,
                ),
                child: NamaOpsi(teks: "Kelola Akun")),
          ))
        ],
      ),
    );
  }
}
