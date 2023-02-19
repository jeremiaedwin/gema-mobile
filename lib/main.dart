import 'package:flutter/material.dart';

import 'pages/addItem.dart' as item;
import 'pages/home.dart' as home;
import 'widgets/search.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
    routes: <String, WidgetBuilder>{
      '/addItem' : (BuildContext context) => new item.AddItem()
    }
    ));
}

class MyApp extends StatefulWidget {
  @override
 _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{
  late TabController controller;

  @override
  void initState(){
    controller = new TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(1000, 171, 0, 52),
          leading:
              IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                }, 
                icon: const Icon(Icons.search)
                ),
          title: new Text("Temukan di Gema"),
          actions: <Widget>[
            IconButton(onPressed: (){}, icon: const Icon (Icons.favorite)),
            IconButton(
              onPressed: (){
                Navigator.pushNamed(context, '/addItem');
              }, 
              icon: const Icon (Icons.add)),
          ],
      ),

      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new home.Home(),
          new home.Home(),
          new home.Home(),
          new home.Home(),
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
            new Tab(icon: new Icon(Icons.home), text: "Home",),
            new Tab(icon: new Icon(Icons.favorite), text:"Wishlist"),
            new Tab(icon: new Icon(Icons.notifications), text:"Notifications"),
            new Tab(icon: new Icon(Icons.account_circle), text:"Profile"),
          ],
        ),
      ),    
    );
  }
}
