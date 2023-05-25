import 'package:flutter/material.dart';
import '../widgets/search.dart';
import 'detail.dart';
import '../controllers/AdController.dart';
import '../controllers/CategoryController.dart';
import '../models/Ad.dart';
import '../models/Category.dart';
import '../widgets/CardIklan.dart';

class AdBySearch extends StatefulWidget {
  const AdBySearch({
    required this.searchKey,
    required this.nim,
    Key? key,
  }) : super(key: key);
  final String searchKey;
  final String nim;

  @override
  State<AdBySearch> createState() => _AdBySearchState();
}

class _AdBySearchState extends State<AdBySearch> {
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

  List<Ad> _getFilteredAds() {
    return _adList
        .where((ad) =>
            ad.title.toLowerCase().contains(widget.searchKey.toLowerCase()))
        .toList();
  }


  @override
  Widget build(BuildContext context) {
    List<Ad> filteredAds = _getFilteredAds();
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromARGB(1000, 171, 0, 52),
        title: new Text(
          "Search",
          style: TextStyle(fontSize: 14.0, color: Colors.white),
        ),
      ),
      body: new ListView(
        children: [
          new Container(
            margin: EdgeInsets.only(top: 10, left: 20, right: 20),
            child: new Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10, top: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Search for : ' + widget.searchKey,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //--------------------------------------------------------------------
                //Iklan
                //--------------------------------------------------------------------
                // new Text(_adList.toString()),
                ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: (filteredAds.length / 2).ceil(), // pembulatan ke atas
                  itemBuilder: (context, index) {
                    final int firstIndex = index * 2;
                    final int secondIndex = firstIndex + 1;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Menampilkan iklan pertama
                        Expanded(
                          child: ListIklan(
                            ad_id: filteredAds[firstIndex].ad_id,
                            foto: filteredAds[firstIndex].image,
                            judul: filteredAds[firstIndex].title,
                            harga: filteredAds[firstIndex].price.toString(),
                            nimUser: widget.nim
                          ),
                        ),

                        // Menampilkan iklan kedua jika ada, atau widget kosong jika tidak
                        if (secondIndex < filteredAds.length)
                          Expanded(
                            child: ListIklan(
                              ad_id: filteredAds[secondIndex].ad_id,
                              foto: filteredAds[secondIndex].image,
                              judul: filteredAds[secondIndex].title,
                              harga: filteredAds[secondIndex].price.toString(),
                              nimUser: widget.nim
                            ),
                          ),
                        if (secondIndex >= filteredAds.length)
                          Expanded(
                              child:
                                  Container()), // Widget kosong atau placeholder
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
