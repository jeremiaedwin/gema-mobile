import 'package:flutter/material.dart';
import '../controllers/AdController.dart';
import '../controllers/DetailController.dart';
import '../models/Ad.dart';
import '../models/AdDetail.dart';
import '../widgets/search.dart';
import '../widgets/DetailProduk-widgets.dart' as detail;

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
  List<AdDetail> _data = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final data = await _adController.getDataDetail(widget.ad_id);
    setState(() {
      _data = data.cast<AdDetail>();
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
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                },
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addItem');
                },
                icon: const Icon(Icons.add)),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: _data.map((ad) => Container(
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
                            border: Border.all(color: Color.fromARGB(100, 128, 128, 128)),
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

                        new Container(
                          padding: EdgeInsets.all(20),
                          decoration: new BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(100, 128, 128, 128)),
                            borderRadius: new BorderRadius.all(
                              new Radius.circular(
                                5.0,
                              ),
                            ),
                            color: Colors.white,
                          ),
                          child: new Column(
                            children: <Widget>[
                              //harga-----------------------------------------------------
                              new DataProdukBold(teks: "Rp. " + ad.price),

                              //nama------------------------------------------------------
                              new DataProdukNormal(teks: ad.title)
                            ],
                          )
                        ),

                        // Detail Produk-----------------------------------------------------
                        new Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: new BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(100, 128, 128, 128)),
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
                                      child: new DataProdukBold(
                                          teks: "Detail Produk"),
                                    ),
                                    new Container(
                                      child: DetailProduk(
                                        kondisi: ad.condition,
                                        min: "1",
                                        kategori: ad.category,
                                      ),
                                    )
                                  ],
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
                                color: Color.fromARGB(100, 128, 128, 128)),
                            borderRadius: new BorderRadius.all(
                              new Radius.circular(
                                5.0,
                              ),
                            ),
                            color: Colors.white,
                          ),
                          child: new Column(
                            children: [
                              new DataProdukBold(teks: "Deskripsi Produk"),
                              new DataProdukNormal(
                                  teks:
                                      ad.description),
                            ],
                          ),
                        ),

                        //Toko--------------------------------------------------
                        new Container(
                          padding: EdgeInsets.all(20),
                          decoration: new BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(100, 128, 128, 128)),
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
                                        margin: EdgeInsets.only(right: 20),
                                        child: new FotoToko(
                                            foto:
                                                ad.avatar),
                                      ),
                                      new Container(
                                        child: new DataProdukBold(
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
                                color: Color.fromARGB(100, 128, 128, 128)),
                            borderRadius: new BorderRadius.all(
                              new Radius.circular(
                                5.0,
                              ),
                            ),
                            color: Colors.white,
                          ),
                          child: HubungiPenjual(),
                        )

                      ],
                    ),
                  ),
                ],
              ),
            )).toList(),
          ),
        ),
    );
  }
}

