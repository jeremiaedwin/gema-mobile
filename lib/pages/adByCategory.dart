import 'package:flutter/material.dart';
import '../widgets/search.dart';
import 'detail.dart';
import '../controllers/AdController.dart';
import '../controllers/CategoryController.dart';
import '../models/Ad.dart';
import '../models/Category.dart';
import '../widgets/CardIklan.dart';

class AdByCategory extends StatefulWidget {
  const AdByCategory({
    required this.category_id,
    required this.nim,
    Key? key,
  }) : super(key: key);
  final String category_id;
  final String nim;

  @override
  State<AdByCategory> createState() => _AdByCategoryState();
}

class _AdByCategoryState extends State<AdByCategory> {
  AdController _adController = AdController();
  CategoryController _categoryController = CategoryController();
  List<Ad> _adList = [];
  List<Category> _categoryList = [];

  @override
  void initState() {
    super.initState();
    _getData();
    _getCategory();
    debugPrint(widget.category_id);
  }

  Future<void> _getData() async {
    final data = await _adController.getDatabyCategory(widget.category_id);
    setState(() {
      _adList = data.cast<Ad>();
    });
  }

  Future<void> _getCategory() async {
    final data = await _categoryController.getDataDetail(widget.category_id);
    setState(() {
      _categoryList = data.cast<Category>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromARGB(1000, 171, 0, 52),
        title: new Text(
          "Kategori",
          style: TextStyle(fontSize: 14.0, color: Colors.white),
        ),
      ),
      body: new ListView(
        children: [
          new Container(
            margin: EdgeInsets.only(top: 10, left: 20, right: 20),
            child: new Column(
              children: <Widget>[
                //--------------------------------------------------------------------
                //rekomendasi
                //--------------------------------------------------------------------
                Container(
                  margin: EdgeInsets.only(left: 10, top: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _categoryList
                          .map((category) => Text(
                                'Kategori : ' + category.category_name,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))
                          .toList(),
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
                  itemCount: (_adList.length / 2).ceil(), // pembulatan ke atas
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

                        // Menampilkan iklan kedua jika ada, atau widget kosong jika tidak
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
