import 'package:flutter/material.dart';
import 'package:gema_app/icons.dart';
import 'package:gema_app/pages/pilihKategory.dart';
import '../controllers/AdController.dart';
import '../models/Ad.dart';
import 'adByCategory.dart';
import '../widgets/CardIklan.dart';

class Home extends StatefulWidget {
  final String nim;

  const Home({required this.nim});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    print(widget.nim);
    return ListView(
      children: [
        new Container(
          margin: EdgeInsets.only(top: 30, left: 20, right: 20),
          child: new Column(
            children: <Widget>[
              //----------------------------------------------------------------
              //Kategori
              //----------------------------------------------------------------
              new Container(
                margin: EdgeInsets.only(bottom: 20),
                child: new Row(
                  children: <Widget>[
                    //----------------------------------------------------------
                    //Pakaian
                    //----------------------------------------------------------
                    SizedBox.fromSize(
                      size: Size(80, 65),
                      child: ClipOval(
                        child: Material(
                          child: InkWell(
                            splashColor: Color.fromARGB(1000, 171, 0, 52),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdByCategory(
                                          category_id: '1',
                                          nim: widget.nim,
                                        )),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  CustomIcon.shirt_solid,
                                  color: Color.fromARGB(255, 52, 53, 57),
                                ), // <-- Icon
                                Text("Pakaian"), // <-- Text
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    //----------------------------------------------------------
                    //Makanan
                    //----------------------------------------------------------
                    SizedBox.fromSize(
                      size: Size(80, 65),
                      child: ClipOval(
                        child: Material(
                          child: InkWell(
                            splashColor: Color.fromARGB(1000, 171, 0, 52),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  AdByCategory(
                                          category_id: '3',
                                          nim: widget.nim,
                                        )),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  CustomIcon.utensils_solid,
                                  color: Color.fromARGB(255, 52, 53, 57),
                                ), // <-- Icon
                                Text("Makanan"), // <-- Text
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    //----------------------------------------------------------
                    //Sepatu
                    //----------------------------------------------------------
                    SizedBox.fromSize(
                      size: Size(80, 65),
                      child: ClipOval(
                        child: Material(
                          child: InkWell(
                            splashColor: Color.fromARGB(1000, 171, 0, 52),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  AdByCategory(
                                          category_id: '5',
                                          nim: widget.nim,
                                        )),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  CustomIcon.shoe_prints_solid,
                                  color: Color.fromARGB(255, 52, 53, 57),
                                ), // <-- Icon
                                Text("Sepatu"), // <-- Text
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    //----------------------------------------------------------
                    //Lihat Semua
                    //----------------------------------------------------------
                    SizedBox.fromSize(
                      size: Size(80, 65),
                      child: ClipOval(
                        child: Material(
                          child: InkWell(
                            splashColor: Color.fromARGB(1000, 171, 0, 52),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                         pilihkategori(nim: widget.nim,)),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  CustomIcon.lihatsemua,
                                  color: Color.fromARGB(255, 52, 53, 57),
                                ), // <-- Icon
                                Text("Semua"), // <-- Text
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //--------------------------------------------------------------------
              //rekomendasi
              //--------------------------------------------------------------------
              new Container(
                margin: EdgeInsets.only(left: 10, top: 10),
                child: new Align(
                  alignment: Alignment.topLeft,
                  child: new Text(
                    "Rekomendasi",
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
