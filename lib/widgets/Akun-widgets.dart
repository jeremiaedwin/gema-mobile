import 'package:flutter/material.dart';
import 'package:gema_app/pages/setting/editNama.dart';
import 'package:gema_app/pages/setting/editNomorHP.dart';
import 'package:gema_app/pages/setting/editUsername.dart';
import '../../widgets/DetailProduk-widgets.dart';
import '../controllers/UserController.dart';
import '../models/Profile.dart';

class NamaAkun extends StatelessWidget {
  NamaAkun({required this.teks});

  final String teks;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: new Align(
        alignment: Alignment.topLeft,
        child: new Text(teks,
            style: new TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
    );
  }
}

class NamaOpsi extends StatelessWidget {
  NamaOpsi({required this.teks});

  final String teks;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: new Align(
        alignment: Alignment.topLeft,
        child: new Text(teks, style: new TextStyle(fontSize: 14.0)),
      ),
    );
  }
}

class FotoProfil extends StatelessWidget {
  FotoProfil({required this.foto});

  final String foto;

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: ClipOval(
      child: foto.isEmpty
            ? Center(child: CircularProgressIndicator())
            :Image(
        image: new NetworkImage(foto),
        height: 75.0,
        width: 75.0,
        fit: BoxFit.cover,
      ),
    ));
  }
}

class TextInfoProfile extends StatelessWidget {
  TextInfoProfile({required this.teks});

  final String teks;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Align(
        alignment: Alignment.topLeft,
        child: teks.isEmpty
            ? Center(child: CircularProgressIndicator())
            :new Text(teks,
            style: new TextStyle(
              fontSize: 14.0,
            )),
      ),
    );
  }
}

class DetailInfoProfile extends StatefulWidget {
  DetailInfoProfile({
      required this.nim
  });

  final String nim;

  @override
  State<DetailInfoProfile> createState() => _DetailInfoProfileState();
}

class _DetailInfoProfileState extends State<DetailInfoProfile> {
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
    return Container(
        child: _data.isEmpty
            ? Center(child: CircularProgressIndicator())
            :Column(
      children: <Widget>[
        //NIM-------------------------------------------------------------------
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 60),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("NIM",
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Color.fromARGB(255, 165, 165, 165))),
                ),
              ),
              TextInfoProfile(teks: _data[0].nim),
            ],
          ),
        ),

        //Username--------------------------------------------------------------
        Container(
          child: Row(
            children: [
              new Container(
                margin: EdgeInsets.only(right: 25),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Username",
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Color.fromARGB(255, 165, 165, 165))),
                ),
              ),
              TextInfoProfile(teks: _data[0].username),
              IconButton(
                iconSize: 15,
                icon: const Icon(Icons.arrow_forward_ios,
                    color: Color.fromARGB(255, 165, 165, 165)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditUsername(nim:_data[0].nim)));
                },
              ),
            ],
          ),
        ),

        //Nama------------------------------------------------------------------
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 51),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Nama",
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Color.fromARGB(255, 165, 165, 165))),
                ),
              ),
              TextInfoProfile(teks: _data[0].full_name),
              IconButton(
                iconSize: 15,
                icon: const Icon(Icons.arrow_forward_ios,
                    color: Color.fromARGB(255, 165, 165, 165)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditNama(nim:_data[0].nim)));
                },
              ),
            ],
          ),
        ),

        //Email-----------------------------------------------------------------
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 55),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Email",
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Color.fromARGB(255, 165, 165, 165))),
                ),
              ),
              TextInfoProfile(teks: _data[0].email)
            ],
          ),
        ),

        //Nomor HP--------------------------------------------------------------
        Container(
            child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 24),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Nomor HP",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Color.fromARGB(255, 165, 165, 165))),
              ),
            ),
            TextInfoProfile(teks: _data[0].phone_number),
            IconButton(
              iconSize: 15,
              icon: const Icon(Icons.arrow_forward_ios,
                  color: Color.fromARGB(255, 165, 165, 165)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditNomorHP(nim:_data[0].nim)));
              },
            ),
          ],
        ))
      ],
    ));
  }
}
