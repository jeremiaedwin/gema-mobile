import 'package:flutter/material.dart';

class setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Color.fromARGB(1000, 171, 0, 52),
          title: new Text(
            "Kelola Akun",
            style: TextStyle(fontSize: 14.0, color: Colors.white),
          ),
        ),
        body: new Container(
          child: new Text("akun"),
        ));
  }
}
