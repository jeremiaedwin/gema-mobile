import 'package:flutter/material.dart';
import 'package:gema_app/controllers/AdController.dart';
import 'package:gema_app/models/Ad.dart';
import 'package:gema_app/models/Profile.dart';
import 'package:gema_app/widgets/CardIklan.dart';
import '../controllers/UserController.dart';
import '../widgets/Produk-widgets.dart';
import '../widgets/search.dart';
import 'detail.dart';
import '../widgets/ProfilToko-widgets.dart';
import '../widgets/DetailProduk-widgets.dart';

class ProfilToko extends StatefulWidget {
  final String nim;

  const ProfilToko({required this.nim});

  @override
  _ProfilTokoState createState() => _ProfilTokoState();
}

class _ProfilTokoState extends State<ProfilToko> {
  UserController _UserController = UserController();
  AdController _adController = AdController();
  List<Ad> _adList = [];
  List<Profile> _data = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
    _getData();
  }

  Future<void> _fetchData() async {
    final data = await _UserController.getDataDetail(widget.nim);
    setState(() {
      _data = data.cast<Profile>();
    });
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
    List<Ad> filteredAds = _adList.where((ad) => ad.nim == widget.nim).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(1000, 171, 0, 52),
        title: Text(
          "Profile Toko",
          style: TextStyle(fontSize: 14.0, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 7,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(100, 128, 128, 128)),
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    if (_data.isNotEmpty)
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: FotoProfile(foto: _data[0].avatar),
                      ),
                    if (_data.isNotEmpty)
                      Column(
                        children: <Widget>[
                          Container(
                            child: TextBold(teks: _data[0].full_name),
                          ),
                          Chat(avatar: _data[0].avatar, full_name: _data[0].full_name, nim: _data[0].nim, nim_sender: widget.nim),
                        ],
                      ),
                  ],
                ),
                
              ],
            ),
          ),
          new Container(
          margin: EdgeInsets.only(top: 30, left: 20, right: 20),
          child:
           new ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount:
                (filteredAds.length / 2).ceil(),// jumlah baris = jumlah iklan dibagi 2
                itemBuilder: (context, index) {
                  final int firstIndex = index * 2;
                  final int secondIndex = firstIndex + 1;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Menampilkan iklan pertama
                      Flexible(
                        child: ListIklan(
                          ad_id: filteredAds[firstIndex].ad_id,
                          foto: filteredAds[firstIndex].image,
                          judul: filteredAds[firstIndex].title,
                          harga: filteredAds[firstIndex].price.toString(),
                          nimUser: widget.nim
                        ),
                      ),

                      // Jika ada iklan kedua, menampilkannya di kolom kedua
                      if (secondIndex < filteredAds.length)
                        Flexible(
                          child: ListIklan(
                            ad_id: filteredAds[secondIndex].ad_id,
                            foto: filteredAds[secondIndex].image,
                            judul: filteredAds[secondIndex].title,
                            harga: filteredAds[secondIndex].price.toString(),
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
          ),

        ],
      ),
    );
  }
}