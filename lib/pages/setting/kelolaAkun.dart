import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../widgets/ProfilToko-widgets.dart';
import '../../widgets/DetailProduk-widgets.dart';
import '../../widgets/Akun-widgets.dart';

class KelolaAkun extends StatefulWidget {
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
                              "https://awsimages.detik.net.id/community/media/visual/2022/08/07/resep-nasi-goreng-ayam-dan-ebi_43.jpeg?w=700&q=90"),
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
                      nim: "211511050",
                      username: "nasrullohfajar",
                      nama: "Nasrulloh Fajar Muharam",
                      email: "nasrulloh.fajar.tif21@polban.ac.id",
                      telpon: "082120092578",
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
