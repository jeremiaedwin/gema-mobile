import 'package:flutter/material.dart';
import 'package:gema_app/controllers/WishlistController.dart';
import '../controllers/AdController.dart';
import '../models/Ad.dart';
import '../widgets/CardIklan.dart';

class Wishlist extends StatefulWidget {
  final String nim;

  const Wishlist({required this.nim});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  AdController _adController = AdController();
  WishlistController _wishlistController = WishlistController();
  List<Ad> _adList = [];

  @override
  void initState() {
    super.initState();
    _getDataIklan();
  }

  Future<void> _getDataIklan() async {
    final adData = await _adController.getData();
    final wishlistData = await _wishlistController.getWishlist(widget.nim);
    print(wishlistData.length);
    setState(() {
      _adList = adData
          .where((ad) =>
              wishlistData.any((wishlist) => wishlist.ad_id == ad.ad_id))
          .toList();
    });
    print(_adList.length);
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
                    "Wishlist Anda",
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
                    (_adList.length / 2).ceil(),// jumlah baris = jumlah iklan dibagi 2
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
                          nimUser: widget.nim
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
                            nimUser: widget.nim
                          ),
                        ),
                        if (secondIndex >= _adList.length)
                        Expanded(
                            child:
                                Container()),
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
