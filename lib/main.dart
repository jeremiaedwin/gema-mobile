import 'package:flutter/material.dart';
import 'package:gema_app/pages/auth.dart';
import 'pages/addIklan.dart' as item;
import 'pages/home.dart' as home;
import 'pages/chat.dart' as chat;
import 'widgets/search.dart';
import 'pages/wishlist.dart' as wishlist;
import 'pages/notifikasi.dart' as notifikasi;
import 'pages/akun.dart' as akun;
import 'pages/auth.dart' as auth;
import 'pages/register.dart' as register;
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        // '/addItem': (BuildContext context) => item.AdTypeView(),
        // '/chat': (BuildContext context) => chat.Chat(,),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String nim;

  const MyHomePage({required this.nim});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(1000, 171, 0, 52),
        leading: IconButton(
          onPressed: () {
            showSearch(
              context: context,
              delegate: CustomSearchDelegate(nim: widget.nim),
            );
          },
          icon: Icon(Icons.search),
        ),
        title: Text(
          "Temukan di Gema",
          style: TextStyle(fontSize: 14.0, color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => item.AdTypeView(nim: widget.nim)));
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => chat.ChatPage(nim_sender: widget.nim)));
            },
            icon: Icon(Icons.chat_bubble_rounded),
          ),
        ],
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          home.Home(nim: widget.nim),
          wishlist.Wishlist(nim: widget.nim),
          akun.Akun(nim: widget.nim),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          indicatorColor: Colors.transparent,
          labelColor: Color.fromARGB(1000, 171, 0, 52),
          unselectedLabelColor: Colors.grey[600],
          controller: controller,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home),
              text: "Beranda",
            ),
            Tab(icon: Icon(Icons.favorite), text: "Wishlist"),
            Tab(icon: Icon(Icons.account_circle), text: "Akun Saya"),
          ],
        ),
      ),
    );
  }
}