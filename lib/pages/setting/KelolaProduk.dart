import 'package:flutter/material.dart';
import 'package:gema_app/widgets/Produk-widgets.dart';

class KelolaProduk extends StatefulWidget {
  @override
  _KelolaProdukState createState() => _KelolaProdukState();
}

class _KelolaProdukState extends State<KelolaProduk> {
  String? _selectedItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Color.fromARGB(1000, 171, 0, 52),
          title: new Text(
            "Kelola Produk",
            style: TextStyle(fontSize: 14.0, color: Colors.white),
          ),
        ),
        body: Column(
          children: <Widget>[
            OpsiProduk(
                foto:
                    "https://awsimages.detik.net.id/community/media/visual/2022/08/07/resep-nasi-goreng-ayam-dan-ebi_43.jpeg?w=700&q=90",
                nama: "nasi")
          ],
        ));
  }
}
