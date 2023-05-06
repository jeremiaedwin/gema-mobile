import 'package:flutter/material.dart';
import 'package:gema_app/pages/setting/kelolaAkun.dart';
import '../controllers/UserController.dart';
import '../models/Profile.dart';
import '../pages/setting/editUsername.dart';
import '../widgets/Akun-widgets.dart';
import '../pages/produk.dart';

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

  void _updateData(Profile updatedProfile) {
  setState(() {
    _data = [_data[0].copyWith(updatedProfile)];
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
              _data.isNotEmpty ? new Container(
                margin: EdgeInsets.only(right: 20),
                child: FotoProfil(
                    foto:
                        _data[0].avatar),
              ):Container(),
              new Column(
                children: <Widget>[
                  _data.isNotEmpty ? new Container(
                    margin: EdgeInsets.only(top: 25),
                    child: new NamaAkun(teks: _data[0].full_name),
                  ):Container()
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
                MaterialPageRoute(builder: (context) => produk()),
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
                  nim: _data[0].nim,
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
