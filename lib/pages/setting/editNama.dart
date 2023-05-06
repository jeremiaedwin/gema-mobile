import 'package:flutter/material.dart';
import 'package:gema_app/widgets/DetailProduk-widgets.dart';
import '../../widgets/Akun-widgets.dart';

class EditNama extends StatefulWidget {
  final String full_name;
  final String nim;

  EditNama({
    required this.full_name,
    required this.nim
  });
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<EditNama> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //app-bar---------------------------------------------------------------
        appBar: AppBar(
          backgroundColor: Color.fromARGB(1000, 171, 0, 52),
          title: new Text(
            "Ubah Nama",
            style: TextStyle(fontSize: 14.0, color: Colors.white),
          ),
        ),
        //end-app-bar-----------------------------------------------------------

        body: Column(children: <Widget>[
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
                      labelText: widget.full_name,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 14.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(1000, 171, 0, 52),
                    ),
                    onPressed: () {},
                    child: Text('Simpan'),
                  ),
                ],
              ))
        ]));
  }
}
