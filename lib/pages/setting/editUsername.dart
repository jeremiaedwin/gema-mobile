import 'package:flutter/material.dart';
import 'package:gema_app/pages/setting/kelolaAkun.dart';
import 'package:gema_app/widgets/DetailProduk-widgets.dart';
import '../../controllers/UserController.dart';
import '../../models/Profile.dart';
import '../../widgets/Akun-widgets.dart';

class EditUsername extends StatefulWidget {
  EditUsername(
      {required this.nim,
      });

  final String nim;
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<EditUsername> {
  UserController _UserController = UserController();
  List<Profile> _data = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final data = await _UserController.getDataDetail(widget.nim);
    setState(() {
      _data = data.cast<Profile>();
    });
  }
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //app-bar---------------------------------------------------------------
        appBar: AppBar(
          backgroundColor: Color.fromARGB(1000, 171, 0, 52),
          title: new Text(
            "Ubah Username",
            style: TextStyle(fontSize: 14.0, color: Colors.white),
          ),
        ),
        //end-app-bar-----------------------------------------------------------

        body: _data.isEmpty
            ? Center(child: CircularProgressIndicator())
            :Column(children: <Widget>[
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
                  TextField(
                    decoration: InputDecoration(
                      labelText: '@'+_data[0].username,
                      border: OutlineInputBorder(),
                    ),
                    controller: _usernameController,
                  ),
                  SizedBox(height: 14.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(1000, 171, 0, 52),
                    ),
                    onPressed: () async {
                      final String updatedProfile = await _UserController.updateProfile(_data[0].nim, _data[0].full_name, _usernameController.text, _data[0].phone_number, _data[0].password, _data[0].token, _data[0].email,null); // Call the function here
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => KelolaAkun(nim: _data[0].nim,),
                        ),
                      );
                    },
                    child: Text('Simpan'),
                  ),
                ],
              ))
        ]));
  }
}
