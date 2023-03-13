import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromARGB(1000, 171, 0, 52),
        title: const Text('Chat'),
      ),
      body: new ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Card(child:ListTile(
            title: Text("Mang Ohan"),
            subtitle: Text("Item masih ada?"),
            leading: CircleAvatar(backgroundImage: AssetImage("assets/images/pp.jpg")),
            trailing: Text("20.00"),
            onTap : (){
                     Navigator.push(context,
                      new MaterialPageRoute(
                        builder: (context) => new ChatRoom(),
                      ),);
                    }),
          ),
          Card(child:ListTile(
            title: Text("Mang Oman"),
            subtitle: Text("COD pujas"),
            leading: CircleAvatar(backgroundImage: AssetImage("assets/images/pp2.jpg")),
            trailing: Text("19.00"),),
          ),
          Card(child:ListTile(
            title: Text("Herp Menolak Bangkit"),
            subtitle: Text("Cek Minus"),
            leading: CircleAvatar(backgroundImage: AssetImage("assets/images/pp3.png")),
            trailing: Text("17.00"),),
          ),
        ],
      ),
    );
  }
}

class ChatRoom extends StatefulWidget {
  const ChatRoom({super.key});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black,)),
                SizedBox(width: 2,),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/pp.jpg'),
                  maxRadius: 20,
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Mang Ohan", style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                      SizedBox(height: 6,),
                      Text("Online", style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                    ],
                ),
                ),
                Icon(Icons.settings,color: Colors.black54,),
              ],
            ),
          ) 
          ),
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(1000, 171, 0, 52),
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 20,),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: (){},
                    child: Icon(Icons.send,color: Colors.white,size: 18,),
                    backgroundColor: Color.fromARGB(1000, 171, 0, 52),
                    elevation: 0,
                  ),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}