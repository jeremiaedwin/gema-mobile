import 'package:flutter/material.dart';
import 'package:gema_app/widgets/Produk-widgets.dart';
import 'package:gema_app/controllers/AdController.dart';
import '../../models/Ad.dart';

class KelolaProduk extends StatefulWidget {
  final String nim;

  KelolaProduk({
    required this.nim,
  });
  @override
  _KelolaProdukState createState() => _KelolaProdukState();
}

class _KelolaProdukState extends State<KelolaProduk> {
  AdController _adController = AdController();
  List<Ad> _adList = [];
  String? _selectedItem;

    @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    final data = await _adController.getData();
    setState(() {
      _adList = data.cast<Ad>();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    List<Ad> filteredAds = _adList.where((ad) => ad.nim == widget.nim).toList();
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Color.fromARGB(1000, 171, 0, 52),
          title: new Text(
            "Kelola Produk",
            style: TextStyle(fontSize: 14.0, color: Colors.white),
          ),
        ),
        body: ListView.builder(
        itemCount: filteredAds.length,
        itemBuilder: (context, index) {
          Ad ad = filteredAds[index];
          return Column(
          children: <Widget>[
            OpsiProduk(
                foto:
                    ad.image,
                nama: ad.title,
                ad_id : ad.ad_id,
                nimUser: widget.nim,),
          ],
        );
        },
      ),  
    );
  }
}
