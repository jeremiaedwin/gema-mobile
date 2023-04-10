import 'dart:async';
import 'dart:convert';
import 'package:gema_app/controllers/ChatController.dart';
import 'package:gema_app/controllers/ChatController.dart';
import 'package:gema_app/models/Chat.dart';
import 'package:gema_app/models/User.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../controllers/ChatController.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  late IO.Socket socket;
  List<dynamic> _connectedUsers = [];

  TextEditingController messageController = new TextEditingController();
  ChatController chatController = ChatController();

  @override
  void initState(){
    socket = IO.io('http://localhost:7000', IO.OptionBuilder()
      .setTransports(['websocket'])
      .disableAutoConnect()
      .build());
    socket.connect();
    getActiveUser();
    super.initState();
  }

  void getActiveUser(){
     socket.on('connectedUsers', (data) {
      setState(() {
        _connectedUsers = data;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromARGB(1000, 171, 0, 52),
        title: const Text('Chat'),
      ),
      body: new ListView.builder(
        itemCount: _connectedUsers.length,
        itemBuilder: (context, index) {
          if (_connectedUsers[index]['socketId'] != socket.id) {
            return Card( 
            child: ListTile(
              title: Text(_connectedUsers[index]['socketId']),
              leading: CircleAvatar(backgroundImage: AssetImage("assets/images/pp.jpg")),
              onTap : (){
                Navigator.push(context,
                new MaterialPageRoute(
                  builder: (context) => new ChatRoom(connectedUser:_connectedUsers[index]['socketId'],),
                ),);
              }
            ),
          );
          } else {
          return SizedBox.shrink();
        }
        },
        // padding: const EdgeInsets.all(8),
        // children: <Widget>[
        //   Card(
        //     child:ListTile(
        //     title: Text("Kaizaki Satoru"),
        //     subtitle: Text("Item masih ada?"),
        //     leading: CircleAvatar(backgroundImage: AssetImage("assets/images/pp.jpg")),
        //     trailing: Text("20.00"),
        //     onTap : (){
        //              Navigator.push(context,
        //               new MaterialPageRoute(
        //                 builder: (context) => new ChatRoom(),
        //               ),);
        //             }),
        //   ),
          // Card(child:ListTile(
          //   title: Text("Shintaro Izayak"),
          //   subtitle: Text("COD pujas"),
          //   leading: CircleAvatar(backgroundImage: AssetImage("assets/images/pp2.jpg")),
          //   trailing: Text("19.00"),),
          // ),
          // Card(child:ListTile(
          //   title: Text("Kenshin Yonezu"),
          //   subtitle: Text("Cek Minus"),
          //   leading: CircleAvatar(backgroundImage: AssetImage("assets/images/pp3.png")),
          //   trailing: Text("17.00"),),
          // ),
        // ],
      ),
    );
  }
}

class ChatRoom extends StatefulWidget {
  final connectedUser;

  const ChatRoom({Key? key, required this.connectedUser}) : super(key: key);

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  late IO.Socket socket;

  TextEditingController messageController = new TextEditingController();
  ChatController chatController = ChatController();
  
  String? get connectedUser => null;

  @override
  void initState(){
    socket = IO.io('http://localhost:7000', IO.OptionBuilder()
      .setTransports(['websocket'])
      .disableAutoConnect()
      .build());
    socket.connect();
    setUpSocketListener();
    super.initState();
  }

  void sendMessage(String text){
    print(text);
   var messageJson = {
    "message": text,
    "sentByMe": socket.id
   } ;
   socket.emit('message', messageJson);
   chatController.chatMessages.add(Message.fromJson(messageJson));
  }

  void setUpSocketListener(){
    socket.on('message-receive', (data) {
      print(data);
      chatController.chatMessages.add(Message.fromJson(data));
    });
  }


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
                      Text(widget.connectedUser, style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
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
          Obx(
            () => ListView.builder(
            itemCount: chatController.chatMessages.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              var currentItem = chatController.chatMessages[index];
              final String sentByMe = currentItem.sentByMe;
              final String message = currentItem.message;
              return Container(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
                child: Align(
                  alignment: sentByMe == socket.id ? Alignment.topRight : Alignment.topLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: sentByMe == socket.id ? Colors.grey.shade200 : Colors.red.shade200,
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(message),
                  ),
                ),
              );
            },
          ),
          ),
          // ListView.builder(
          //   itemCount: 4,
          //   shrinkWrap: true,
          //   padding: EdgeInsets.only(top: 10, bottom: 10),
          //   physics: NeverScrollableScrollPhysics(),
          //   itemBuilder: (context, index){
          //     return Container(
          //       padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
          //       child: Align(
          //         alignment: Alignment.topRight,
          //         child: Container(
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(20),
          //             color: Colors.grey.shade200
          //           ),
          //           padding: EdgeInsets.all(16),
          //           child: Text("test"),
          //         ),
          //       ),
          //     );
          //   },
          // ),
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
                      controller: messageController  ,
                      decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: (){
                      sendMessage(messageController.text);
                      messageController.text = '';
                    },
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