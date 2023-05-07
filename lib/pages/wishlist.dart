import 'package:flutter/material.dart';
import '../controllers/AdController.dart';
import '../models/Ad.dart';
import '../widgets/CardIklan.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  AdController _adController = AdController();
  List<Ad> _adList = [];

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
    return ListView(
      children: [
        new Container(
          margin: EdgeInsets.only(top: 30, left: 20, right: 20),
          child: new Column(
            children: <Widget>[
              //--------------------------------------------------------------------
              //rekomendasi
              //--------------------------------------------------------------------
              new Container(
                margin: EdgeInsets.only(left: 10, top: 10),
                child: new Align(
                  alignment: Alignment.topLeft,
                  child: new Text(
                    "Wishlist",
                    style: new TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              //--------------------------------------------------------------------
              //Iklan
              //--------------------------------------------------------------------
              //new Text(_adList.toString()),
              new ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount:
                    _adList.length ~/ 2, // jumlah baris = jumlah iklan dibagi 2
                itemBuilder: (context, index) {
                  final int firstIndex = index * 2;
                  final int secondIndex = firstIndex + 1;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Menampilkan iklan pertama
                      Expanded(
                        child: ListIklan(
                          ad_id: _adList[firstIndex].ad_id,
                          foto: _adList[firstIndex].image,
                          judul: _adList[firstIndex].title,
                          harga: _adList[firstIndex].price.toString(),
                        ),
                      ),

                      // Jika ada iklan kedua, menampilkannya di kolom kedua
                      if (secondIndex < _adList.length)
                        Expanded(
                          child: ListIklan(
                            ad_id: _adList[secondIndex].ad_id,
                            foto: _adList[secondIndex].image,
                            judul: _adList[secondIndex].title,
                            harga: _adList[secondIndex].price.toString(),
                          ),
                        ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
