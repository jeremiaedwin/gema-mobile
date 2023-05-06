import 'package:flutter/material.dart';
import 'package:gema_app/pages/setting/kelolaAkun.dart';
import '../controllers/UserController.dart';
import '../models/Profile.dart';
import '../pages/setting/editUsername.dart';
import '../widgets/Akun-widgets.dart';
import '../pages/setting/KelolaProduk.dart';

class Akun extends StatefulWidget {
  @override
  _AkunState createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  UserController _UserController = UserController();
  List<Profile> _data = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final data = await _UserController.getDataDetail();
    setState(() {
      _data = data.cast<Profile>();
    });
  }
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
          _data.isNotEmpty ? new Container(
              child: new InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KelolaProduk()),
              );
            },
            child: new Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                  border: Border.all(color: Color.fromARGB(100, 128, 128, 128)),
                  borderRadius: new BorderRadius.all(
                    new Radius.circular(
                      5.0,
                    ),
                  ),
                  color: Colors.white,
                ),
                child: NamaOpsi(
                  teks: "Kelola Opsi"
                )),
          )): Container(),

          //Opsi->setting-------------------------------------------------------
          _data.isNotEmpty ?  new Container(
              child: new InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KelolaAkun(
                  full_name: _data[0].full_name,
                  email: _data[0].email,
                  nim: _data[0].nim,
                  phone_number: _data[0].phone_number,
                  username: _data[0].username,
                  avatar: _data[0].avatar,
                )),
              );
            },
            child: new Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                  border: Border.all(color: Color.fromARGB(100, 128, 128, 128)),
                  borderRadius: new BorderRadius.all(
                    new Radius.circular(
                      5.0,
                    ),
                  ),
                  color: Colors.white,
                ),
                child:  NamaOpsi(
                  teks: "Kelola Akun", 
                )),
          )): Container()
        ],
      ),
    );
  }
}
