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
    Key? key,
  }) : super(key: key);
  final String category_id;

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
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(1000, 171, 0, 52),
        leading: IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            icon: const Icon(Icons.search)),
        title: new Text(
          "Temukan di Gema",
          style: TextStyle(fontSize: 14.0, color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/addItem');
              },
              icon: const Icon(Icons.add)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/chat');
              },
              icon: const Icon(Icons.chat_bubble_rounded)),
        ],
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
                                'Search for category : ' +
                                    category.category_name,
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
                new ListView.builder(
                  shrinkWrap: true,
                  itemCount: _adList.length,
                  itemBuilder: (context, index) {
                    final ad = _adList[index];
                    return new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ListIklan(
                          ad_id: ad.ad_id,
                          foto: ad.image,
                          judul: ad.title,
                          harga: ad.price.toString(),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
