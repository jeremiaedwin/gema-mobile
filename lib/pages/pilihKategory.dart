import 'package:flutter/material.dart';
import '../controllers/AdController.dart';
import '../models/Ad.dart';
import 'adByCategory.dart';
import '../widgets/CardIklan.dart';
import 'package:gema_app/icons.dart';

class pilihkategori extends StatefulWidget {
  const pilihkategori({
    required this.nim,
    Key? key,
  }) : super(key: key);
  final String nim;

  @override
  State<pilihkategori> createState() => _pilihkategoriState();
}

class _pilihkategoriState extends State<pilihkategori> {
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
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Color.fromARGB(1000, 171, 0, 52),
          title: new Text(
            "Semua Kategori",
            style: TextStyle(fontSize: 14.0, color: Colors.white),
          ),
        ),
        body: ListView(
          children: [
            new Container(
              margin: EdgeInsets.only(top: 30, left: 20, right: 20),
              child: new Column(
                children: <Widget>[
                  new Row(
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
                                    splashColor:
                                        Color.fromARGB(1000, 171, 0, 52),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                 AdByCategory(
                                                  category_id: '1',
                                                  nim: widget.nim,
                                                )),
                                      );
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          CustomIcon.shirt_solid,
                                          color:
                                              Color.fromARGB(255, 52, 53, 57),
                                        ), // <-- Icon
                                        Text("Pakaian"), // <-- Text
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            //----------------------------------------------------------
                            //Edit Foto
                            //----------------------------------------------------------
                            SizedBox.fromSize(
                              size: Size(80, 65),
                              child: ClipOval(
                                child: Material(
                                  child: InkWell(
                                    splashColor:
                                        Color.fromARGB(1000, 171, 0, 52),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                 AdByCategory(
                                                  category_id: '2',
                                                  nim: widget.nim,
                                                )),
                                      );
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          CustomIcon.image_solid,
                                          color:
                                              Color.fromARGB(255, 52, 53, 57),
                                        ), // <-- Icon
                                        Text("Editing"), // <-- Text
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
                                    splashColor:
                                        Color.fromARGB(1000, 171, 0, 52),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                 AdByCategory(
                                                  category_id: '3',
                                                  nim: widget.nim,
                                                )),
                                      );
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          CustomIcon.utensils_solid,
                                          color:
                                              Color.fromARGB(255, 52, 53, 57),
                                        ), // <-- Icon
                                        Text("Makanan"), // <-- Text
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            //----------------------------------------------------------
                            //Install ulang Windows
                            //----------------------------------------------------------
                            SizedBox.fromSize(
                              size: Size(80, 65),
                              child: ClipOval(
                                child: Material(
                                  child: InkWell(
                                    splashColor:
                                        Color.fromARGB(1000, 171, 0, 52),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                 AdByCategory(
                                                  category_id: '4',
                                                  nim: widget.nim,
                                                )),
                                      );
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          CustomIcon.windows,
                                          color:
                                              Color.fromARGB(255, 52, 53, 57),
                                        ), // <-- Icon
                                        Text("Install ulang"), // <-- Text
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  new Row(
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
                                    splashColor:
                                        Color.fromARGB(1000, 171, 0, 52),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                 AdByCategory(
                                                  category_id: '5',
                                                  nim: widget.nim,
                                                )),
                                      );
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          CustomIcon.shoe_prints_solid,
                                          color:
                                              Color.fromARGB(255, 52, 53, 57),
                                        ), // <-- Icon
                                        Text("Sepatu"), // <-- Text
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
                                    splashColor:
                                        Color.fromARGB(1000, 171, 0, 52),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                 AdByCategory(
                                                  category_id: '6',
                                                  nim: widget.nim,
                                                )),
                                      );
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          CustomIcon.gift_solid,
                                          color:
                                              Color.fromARGB(255, 52, 53, 57),
                                        ), // <-- Icon
                                        Text("Aksesoris"), // <-- Text
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
