import 'package:flutter/material.dart';
import 'detail.dart';
import '../controllers/AdController.dart';
import '../models/Ad.dart';
import 'adByCategory.dart';
import 'package:cached_network_image/cached_network_image.dart';

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

class ListIklan extends StatelessWidget {
  ListIklan(
      {required this.foto,
      required this.judul,
      required this.harga,
      required this.ad_id});
  final String ad_id;
  final String foto;
  final String judul;
  final String harga;

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => new Detail(ad_id: ad_id)),
        );
      },
      child: new Container(
        //height: MediaQuery.of(context).size.height / 3.5,
        width: MediaQuery.of(context).size.width / 2.6,
        decoration: new BoxDecoration(
          border: Border.all(color: Color.fromARGB(100, 128, 128, 128)),
          borderRadius: new BorderRadius.all(
            new Radius.circular(
              5.0,
            ),
          ),
          color: Colors.white,
        ),
        padding: new EdgeInsets.all(10.0),
        margin: new EdgeInsets.only(top: 10, right: 10, left: 10),
        child: new Column(
          children: <Widget>[
            //--------------------------------------------------------------------
            //foto
            //--------------------------------------------------------------------
            new Container(
              child: CachedNetworkImage(
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                imageUrl: foto,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            //--------------------------------------------------------------------
            //judul
            //--------------------------------------------------------------------

            new Container(
              //height: MediaQuery.of(context).size.height / 4.3,
              //width: MediaQuery.of(context).size.width / 2.5,
              height: 15,
              margin: EdgeInsets.only(top: 5),
              child: new Align(
                alignment: Alignment.topLeft,
                child: new Text(
                  judul,
                  style: new TextStyle(fontSize: 14.0),
                ),
              ),
            ),
            //--------------------------------------------------------------------
            //harga
            //--------------------------------------------------------------------
            new Container(
              height: 15,
              margin: EdgeInsets.only(top: 5, bottom: 5),
              child: new Align(
                alignment: Alignment.topLeft,
                child: new Text(
                  harga,
                  style: new TextStyle(
                      fontSize: 14.0, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
