import 'dart:async';
import 'dart:convert';
import 'package:gema_app/controllers/ChatController.dart';
import 'package:gema_app/controllers/ChatController.dart';
import 'package:gema_app/models/Chat.dart';
import 'package:gema_app/models/Contact.dart';
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
  List<Contact> _contactList = [];


  late IO.Socket socket;
  List<dynamic> _connectedUsers = [];

  TextEditingController messageController = new TextEditingController();
  ChatController chatController = ChatController();

  @override
  void initState(){
    socket = IO.io('http://10.0.2.2:8080', IO.OptionBuilder()
      .setTransports(['websocket'])
      .disableAutoConnect()
      .build());
    socket.connect();
    getActiveUser();
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    final data = await chatController.getContact();
    setState(() {
      _contactList = data.cast<Contact>();
    });
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
      body:
      //  new ListView.builder(
      //   itemCount: _connectedUsers.length,
      //   itemBuilder: (context, index) {
      //     if (_connectedUsers[index]['socketId'] != socket.id) {
      //       return Card( 
      //       child: ListTile(
      //         title: Text(_connectedUsers[index]['socketId']),
      //         leading: CircleAvatar(backgroundImage: AssetImage("assets/images/pp.jpg")),
      //         onTap : (){
      //           Navigator.push(context,
      //           new MaterialPageRoute(
      //             builder: (context) => new ChatRoom(connectedUser:_connectedUsers[index]['socketId'],),
      //           ),);
      //         }
      //       ),
      //     );
      //     } else {
      //     return SizedBox.shrink();
      //   }
      //   },
      new ListView.builder(
        itemCount: _contactList.length,
        itemBuilder: (context, index){
          final contact = _contactList[index];
            return new Card(
              child:ListTile(
              title: Text(contact.full_name),
              // subtitle: Text("Item masih ada?"),
              leading: CircleAvatar(backgroundImage: NetworkImage(contact.avatar)),
              trailing: Text("20.00"),
              onTap : (){
                      Navigator.push(context,
                        new MaterialPageRoute(
                          builder: (context) => new ChatRoom2(nim: contact.nim, full_name:contact.full_name, avatar:contact.avatar),
                        ),);
                      }),
            );
        }
        
      ),
    );
  }
}

class ChatRoom2 extends StatefulWidget {
  ChatRoom2({super.key, required this.full_name, required this.nim, required this.avatar});
  String full_name;
  String nim;
  String avatar;
  

  @override
  State<ChatRoom2> createState() => _ChatRoom2State();
}

class _ChatRoom2State extends State<ChatRoom2> {
  ChatController chatController = ChatController();
  TextEditingController messageController= new TextEditingController();
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
                  backgroundImage: NetworkImage(widget.avatar),
                  maxRadius: 20,
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(widget.full_name, style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
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
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: () {
                        setState(() {
                          chatController.sendMessage(null, messageController.text, widget.nim, '211511097');
                        });
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

// class ChatRoom extends StatefulWidget {
//   final connectedUser;

//   const ChatRoom({Key? key, required this.connectedUser}) : super(key: key);

//   @override
//   State<ChatRoom> createState() => _ChatRoomState();
// }

// class _ChatRoomState extends State<ChatRoom> {
//   late IO.Socket socket;

//   TextEditingController messageController = new TextEditingController();
//   ChatController chatController = ChatController();
  
//   String? get connectedUser => null;

//   @override
//   void initState(){
//     socket = IO.io('http://10.0.2.2:7000', IO.OptionBuilder()
//       .setTransports(['websocket'])
//       .disableAutoConnect()
//       .build());
//     socket.connect(); 
//     setUpSocketListener();
//     super.initState();
//   }

//   void sendMessage(String text){
//     print(text);
//    var messageJson = {
//     "message": text,
//     "sentByMe": socket.id
//    } ;
//    socket.emit('message', messageJson);
//    chatController.chatMessages.add(Message.fromJson(messageJson));
//   }

//   void setUpSocketListener(){
//     socket.on('message-receive', (data) {
//       print(data);
//       chatController.chatMessages.add(Message.fromJson(data));
//     });
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(
//         elevation: 0,
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.white,
//         flexibleSpace: SafeArea(
//           child: Container(
//             padding: EdgeInsets.only(right: 16),
//             child: Row(
//               children: <Widget>[
//                 IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black,)),
//                 SizedBox(width: 2,),
//                 CircleAvatar(
//                   backgroundImage: AssetImage('assets/images/pp.jpg'),
//                   maxRadius: 20,
//                 ),
//                 SizedBox(width: 12,),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Text(widget.connectedUser, style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
//                       SizedBox(height: 6,),
//                       Text("Online", style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
//                     ],
//                 ),
//                 ),
//                 Icon(Icons.settings,color: Colors.black54,),
//               ],
//             ),
//           ) 
//           ),
//       ),
//       body: Stack(
//         children: <Widget>[
//           Obx(
//             () => ListView.builder(
//             itemCount: chatController.chatMessages.length,
//             shrinkWrap: true,
//             padding: EdgeInsets.only(top: 10, bottom: 10),
//             physics: NeverScrollableScrollPhysics(),
//             itemBuilder: (context, index){
//               var currentItem = chatController.chatMessages[index];
//               final String sentByMe = currentItem.sentByMe;
//               final String message = currentItem.message;
//               return Container(
//                 padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
//                 child: Align(
//                   alignment: sentByMe == socket.id ? Alignment.topRight : Alignment.topLeft,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: sentByMe == socket.id ? Colors.grey.shade200 : Colors.red.shade200,
//                     ),
//                     padding: EdgeInsets.all(16),
//                     child: Text(message),
//                   ),
//                 ),
//               );
//             },
//           ),
//           ),
//           Align(
//             alignment: Alignment.bottomLeft,
//             child: Container(
//               padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
//               height: 60,
//               width: double.infinity,
//               color: Colors.white,
//               child: Row(
//                 children: <Widget>[
//                   GestureDetector(
//                     onTap: () {},
//                     child: Container(
//                       height: 30,
//                       width: 30,
//                       decoration: BoxDecoration(
//                         color: Color.fromARGB(1000, 171, 0, 52),
//                         borderRadius: BorderRadius.circular(30)
//                       ),
//                       child: Icon(Icons.add, color: Colors.white, size: 20,),
//                     ),
//                   ),
//                   SizedBox(width: 15,),
//                   Expanded(
//                     child: TextField(
//                       controller: messageController  ,
//                       decoration: InputDecoration(
//                         hintText: "Write message...",
//                         hintStyle: TextStyle(color: Colors.black54),
//                         border: InputBorder.none
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 15,),
//                   FloatingActionButton(
//                     onPressed: (){
//                       sendMessage(messageController.text);
//                       messageController.text = '';
//                     },
//                     child: Icon(Icons.send,color: Colors.white,size: 18,),
//                     backgroundColor: Color.fromARGB(1000, 171, 0, 52),
//                     elevation: 0,
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       )
//     );
//   }
// }