import 'package:flutter/material.dart';

class AddItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromARGB(1000, 171, 0, 52),
        title: const Text('Buat Iklan'),
      ),
      body : new Container(
        padding: new EdgeInsets.all(20),
      
        child: new Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: 
              new Text("Choose Category", style: new TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[700])),
            )
          ],
      ),
      )
    );
  }
}