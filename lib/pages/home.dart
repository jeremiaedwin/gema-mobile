import 'package:flutter/material.dart';
import '../controllers/AdController.dart';
import '../models/Ad.dart';
import 'adByCategory.dart';
import '../widgets/CardIklan.dart';

class Home extends StatefulWidget {
  const Home({super.key});

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
    return ListView(
      children: [
        new Container(
          margin: EdgeInsets.only(top: 30, left: 20, right: 20),
          child: new Column(
            children: <Widget>[
              //--------------------------------------------------------------------
              //Kategori
              //--------------------------------------------------------------------
              new Container(
                margin: EdgeInsets.only(bottom: 20),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AdByCategory(
                                      category_id: '1',
                                    )),
                          );
                        },
                        icon: const Icon(
                          Icons.card_giftcard,
                          color: Color.fromARGB(255, 52, 53, 57),
                          size: 40,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.restaurant,
                          color: Color.fromARGB(255, 52, 53, 57),
                          size: 40,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.local_drink,
                          color: Color.fromARGB(255, 52, 53, 57),
                          size: 40,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.design_services,
                          color: Color.fromARGB(255, 52, 53, 57),
                          size: 40,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.video_camera_back,
                          color: Color.fromARGB(255, 52, 53, 57),
                          size: 40,
                        )),
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
