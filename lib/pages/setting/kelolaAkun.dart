import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../widgets/ProfilToko-widgets.dart';
import '../../widgets/DetailProduk-widgets.dart';
import '../../widgets/Akun-widgets.dart';

class KelolaAkun extends StatefulWidget {
  final String full_name;
  final String email;
  final String nim;
  final String phone_number;
  final String username;
  final String avatar;

  KelolaAkun({
    required this.full_name,
    required this.email,
    required this.nim,
    required this.phone_number,
    required this.username, required this.avatar,
  });
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<KelolaAkun> {
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

        body: Column(
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
                              widget.avatar),
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
                      nim: widget.nim,
                      username: widget.username,
                      nama: widget.full_name,
                      email: widget.email,
                      telpon: widget.phone_number,
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
