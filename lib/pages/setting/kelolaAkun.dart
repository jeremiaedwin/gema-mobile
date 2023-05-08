import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gema_app/models/Profile.dart';
import 'package:image_picker/image_picker.dart';
import '../../controllers/UserController.dart';
import '../../widgets/ProfilToko-widgets.dart';
import '../../widgets/DetailProduk-widgets.dart';
import '../../widgets/Akun-widgets.dart';

class KelolaAkun extends StatefulWidget {
  final String nim;

  KelolaAkun({
    required this.nim,
  });
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<KelolaAkun> {
  UserController _UserController = UserController();

  @override
  void initState() {
    super.initState();
    _fetchData();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetchData();
  }
  List<Profile> _data = [];

  Future<void> _fetchData() async {
    setState(() {
      _data = []; // clear the list before fetching new data
    });
    final data = await _UserController.getDataDetail();
    setState(() {
      _data = data.cast<Profile>();
    });
  }
  ////image-picker--------------------------------------------------------------
  File? image;

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? imagePicked =
        await _picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path);
    setState(() {});
  }
  //end-edit-foto---------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //app-bar---------------------------------------------------------------
        appBar: AppBar(
          backgroundColor: Color.fromARGB(1000, 171, 0, 52),
          title: new Text(
            "Kelola Akun",
            style: TextStyle(fontSize: 14.0, color: Colors.white),
          ),
        ),
        //end-app-bar-----------------------------------------------------------

        body: _data.isEmpty
            ? Center(child: CircularProgressIndicator())
            :Column(
          children: <Widget>[
            //edit-foto---------------------------------------------------------
            Container(
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
                child: Column(
                  children: [
                    //foto------------------------------------------------------
                    Container(
                      padding:
                          EdgeInsets.only(right: 120, left: 120, bottom: 20),
                      child: FotoProfile(
                          foto:
                              _data[0].avatar),
                    ),
                    //endfoto---------------------------------------------------

                    //button----------------------------------------------------
                    TextButton(
                        onPressed: () async {
                          await getImage();
                        },
                        child: Text(
                          'Ubah Foto Profil',
                          style: TextStyle(
                              color: Color.fromARGB(1000, 171, 0, 52)),
                        ))
                    //end-button------------------------------------------------
                  ],
                )),
            //end-edit-foto-----------------------------------------------------

            //edit-profile------------------------------------------------------
            Container(
              padding: EdgeInsets.all(20),
              decoration: new BoxDecoration(
                border: Border.all(color: Color.fromARGB(100, 128, 128, 128)),
                borderRadius: new BorderRadius.all(
                  new Radius.circular(
                    5.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  TextBold(teks: "Info Profile"),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: DetailInfoProfile(
                      nim: _data[0].nim
                    ),
                  )
                ],
              ),
            )
            //end-edit-profile--------------------------------------------------
          ],
        ));
  }
}
