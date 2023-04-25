import 'package:flutter/material.dart';
import '../pages/profilToko.dart';

class FotoProfile extends StatelessWidget {
  FotoProfile({required this.foto});

  final String foto;

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: ClipOval(
      child: Image(
        image: new NetworkImage(foto),
        height: 75.0,
        width: 75.0,
        fit: BoxFit.cover,
      ),
    ));
  }
}

class Chat extends StatelessWidget {
  Chat();

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => profilToko()),
        // );
      },
      child: new Container(
        margin: EdgeInsets.only(top: 5),
        width: MediaQuery.of(context).size.width / 2,
        height: 30,
        decoration: new BoxDecoration(
          border: Border.all(color: Color.fromARGB(100, 128, 128, 128)),
          borderRadius: new BorderRadius.all(
            new Radius.circular(
              20.0,
            ),
          ),
          color: Color.fromARGB(1000, 171, 0, 52),
        ),
        child: new Align(
          alignment: Alignment.center,
          child: new Text("Hubungi Penjual",
              style: new TextStyle(fontSize: 12.0, color: Colors.white)),
        ),
      ),
    );
  }
}
