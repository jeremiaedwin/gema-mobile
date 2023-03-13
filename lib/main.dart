import 'package:flutter/material.dart';
import 'pages/addItem.dart' as item;
import 'pages/home.dart' as home; 
import 'pages/chat.dart' as chat; 
import 'widgets/search.dart';
import 'pages/wishlist.dart' as wistlist;
import 'pages/notifikasi.dart' as notifikasi;
import 'pages/akun.dart' as akun;

void main() {
  runApp(new MaterialApp(home: new MyApp(), routes: <String, WidgetBuilder>{
    '/addItem': (BuildContext context) => new item.AdTypeView(),
    '/chat': (BuildContext context) => new chat.Chat()
  }));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
            icon: const Icon(Icons.add)
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/chat');
            },
            icon: const Icon(Icons.chat_bubble_rounded)
          ),
        ],
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new home.Home(),
          new wistlist.Wishlist(),
          new notifikasi.Notifikasi(),
          new akun.Akun(),
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.white,
        child: new TabBar(
          indicatorColor: Colors.transparent,
          labelColor: Color.fromARGB(1000, 171, 0, 52),
          unselectedLabelColor: Colors.grey[600],
          controller: controller,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.home),
              text: "Beranda",
            ),
            new Tab(icon: new Icon(Icons.favorite), text: "Wishlist"),
            new Tab(icon: new Icon(Icons.notifications), text: "Notifikasi"),
            new Tab(icon: new Icon(Icons.account_circle), text: "Akun Saya"),
          ],
        ),
      ),
    );
  }
}
