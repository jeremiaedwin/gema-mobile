import 'package:flutter/material.dart';
import 'package:gema_app/controllers/AdController.dart';
import '../../widgets/DetailProduk-widgets.dart';
import '../pages/EditIklan.dart';
import '../pages/detail.dart';
import '../pages/setting/KelolaProduk.dart';

class OpsiProduk extends StatelessWidget {
  OpsiProduk({required this.foto, required this.nama, required this.ad_id});

  final String foto;
  final String nama;
  final String ad_id;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: new InkWell(
          onTap: () {},
          child: Row(
            children: [
              //foto-produk---------------------------------------------------------
              Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new Image(
                  image: new NetworkImage(
                    foto,
                  ),
                  fit: BoxFit.cover,
                ),
              ),

              //nama-produk---------------------------------------------------------
              Container(
                  margin: EdgeInsets.only(left: 20),
                  child: TextNormal(
                    teks: nama,
                  )),
                  PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'lihat') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => new Detail(ad_id: ad_id)),
                );
              } else if (value == 'edit') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => new EditIklan(ad_id: ad_id)),
                );
              } else if (value == 'hapus') {
                AdController adController = AdController();
                adController.deleteData(ad_id).then((_) {
                  Navigator.pop(context);
                }).catchError((error) {
                  print('Error deleting data: $error');
                });
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'lihat',
                child: Text('Lihat'),
              ),
              PopupMenuItem<String>(
                value: 'edit',
                child: Text('Edit'),
              ),
              PopupMenuItem<String>(
                value: 'hapus',
                child: Text('Hapus'),
              ),
            ],
          ),
            ],
          ),
        ));
  }
}
