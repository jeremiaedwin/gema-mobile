import 'package:flutter/material.dart';
import '../controllers/AdController.dart';
import '../controllers/WishlistController.dart';
import '../models/Ad.dart';
import '../models/AdDetail.dart';
import '../widgets/search.dart';
import '../widgets/DetailProduk-widgets.dart' as DetailWidget;


class Detail extends StatefulWidget {
  const Detail({
    required this.ad_id,
    Key? key,
  }) : super(key: key);
  final String ad_id;
  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  AdController _adController = AdController();
  WishlistController _wishlistController = WishlistController();
  List<AdDetail> _data = [];
  bool isWishlist = false;
  Set<Icon> icon = Set<Icon>();

  @override
  void initState() {
    super.initState();
    _fetchData();
    _adInWishlist();
  }

  Future<void> _fetchData() async {
    final data = await _adController.getDataDetail(widget.ad_id);
    setState(() {
      _data = data.cast<AdDetail>();
    });
  }

  Future<void> _adInWishlist() async {
    final adData = await _adController.getData();
    final wishlistData  = await _wishlistController.getWishlist("211511097");
    final adInWishlist = wishlistData.any((wishlist) => wishlist.ad_id == widget.ad_id);
    setState(() {
       isWishlist = wishlistData.any((element) => element.ad_id == widget.ad_id);
          if (isWishlist==1) {
            icon.add(
              Icon(
                Icons.favorite_border,
                color: Colors.red,
              ),
            );
          } else {
            icon.add(
              Icon(
                Icons.favorite_border,
              ),
            );
          }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromARGB(1000, 171, 0, 52),
        title: new Text(
          "Detail Produk",
          style: TextStyle(fontSize: 14.0, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: _data
              .map((ad) => Container(
                    child: Column(
                      children: <Widget>[
                        new Container(
                          child: new Column(
                            children: <Widget>[
                              //gambar produk-----------------------------------------------------
                              new Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height / 4,
                                decoration: new BoxDecoration(
                                  border: Border.all(
                                      color:
                                          Color.fromARGB(100, 128, 128, 128)),
                                  borderRadius: new BorderRadius.all(
                                    new Radius.circular(
                                      5.0,
                                    ),
                                  ),
                                  color: Colors.white,
                                ),
                                child: new Image(
                                  image: new NetworkImage(
                                    ad.image,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),

                              //header-----------------------------------------------------
                              new Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 20, bottom: 10),
                                  decoration: new BoxDecoration(
                                    border: Border.all(
                                        color:
                                            Color.fromARGB(100, 128, 128, 128)),
                                    borderRadius: new BorderRadius.all(
                                      new Radius.circular(
                                        5.0,
                                      ),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: new Column(
                                    children: <Widget>[
                                      //wishlist-----------------------------------------------------
                                     
                                      SizedBox(
                                        height: 24,
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: IconButton(
                                            padding: EdgeInsets.zero,
                                            icon: icon.elementAt(0),
                                            onPressed: () {
                                              setState(() {
                                                _wishlistController.addWishlist('211511097', ad.ad_id, '5');

                                              });
                                            },
                                          ),
                                        ),
                                      ),

                                      //harga-----------------------------------------------------
                                      new DetailWidget.TextBold(
                                          teks: "Rp. " + ad.price),

                                      //nama------------------------------------------------------
                                      new DetailWidget.TextNormal(
                                          teks: ad.title)
                                    ],
                                  )),

                              // Detail Produk-----------------------------------------------------
                              new Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: new BoxDecoration(
                                  border: Border.all(
                                      color:
                                          Color.fromARGB(100, 128, 128, 128)),
                                  borderRadius: new BorderRadius.all(
                                    new Radius.circular(
                                      5.0,
                                    ),
                                  ),
                                  color: Colors.white,
                                ),
                                child: new Column(
                                  children: <Widget>[
                                    //Detail produk kategori
                                    new Container(
                                      margin: EdgeInsets.all(20),
                                      child: new Column(
                                        children: <Widget>[
                                          new Container(
                                            child: new DetailWidget.TextBold(
                                                teks: "Detail Produk"),
                                          ),
                                          new Container(
                                            child: DetailWidget.DetailInfo(
                                              kondisi: ad.condition,
                                              min: "1",
                                              kategori: ad.category,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                    //Deskripsi Produk--------------------------------------------------
                                    new Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: new BoxDecoration(
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                100, 128, 128, 128)),
                                        borderRadius: new BorderRadius.all(
                                          new Radius.circular(
                                            5.0,
                                          ),
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: new Column(
                                        children: [
                                          DetailWidget.TextBold(
                                              teks: "Deskripsi Produk"),
                                          DetailWidget.TextNormal(
                                              teks: ad.description),
                                        ],
                                      ),
                                    ),

                                    //Toko--------------------------------------------------
                                    new Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: new BoxDecoration(
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                100, 128, 128, 128)),
                                        borderRadius: new BorderRadius.all(
                                          new Radius.circular(
                                            5.0,
                                          ),
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: new Container(
                                        child: new Column(
                                          children: <Widget>[
                                            new Container(
                                              child: new Row(
                                                children: <Widget>[
                                                  new Container(
                                                    margin: EdgeInsets.only(
                                                        right: 20),
                                                    child: new DetailWidget
                                                            .FotoToko(
                                                        foto: ad.avatar),
                                                  ),
                                                  new Container(
                                                    child:
                                                        DetailWidget.TextBold(
                                                            teks: ad.nama),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),

                                    //Hubungi Penjual---------------------------------------------------
                                    new Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.all(20),
                                      decoration: new BoxDecoration(
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                100, 128, 128, 128)),
                                        borderRadius: new BorderRadius.all(
                                          new Radius.circular(
                                            5.0,
                                          ),
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: DetailWidget.HubungiPenjual(),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
