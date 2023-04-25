// import 'package:flutter/material.dart';
// import '../models/User.dart' as User;
// import '../controllers/UserController.dart';
// import '../widgets/search.dart';
// import 'detail.dart';
// import '../widgets/ProfilToko-widgets.dart';
// import '../widgets/DetailProduk-widgets.dart';

// class ProfilToko extends StatefulWidget {
//   @override
//   _ProfilTokoState createState() => _ProfilTokoState();
// }

// class _ProfilTokoState extends State<ProfilToko> {
//   UserController _UserController = UserController();
//   List<User.UserProfile> _data = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchData();
//   }

//   Future<void> _fetchData() async {
//     final data = await _UserController.getDataDetail();
//     setState(() {
//       _data = data.cast<User.UserProfile>();
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: new AppBar(
//           backgroundColor: Color.fromARGB(1000, 171, 0, 52),
//           title: new Text(
//             "Profile Toko",
//             style: TextStyle(fontSize: 14.0, color: Colors.white),
//           ),
//         ),
//         body: new Container(
//           padding: EdgeInsets.all(20),
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height / 7,
//           decoration: new BoxDecoration(
//             border: Border.all(color: Color.fromARGB(100, 128, 128, 128)),
//             borderRadius: new BorderRadius.all(
//               new Radius.circular(
//                 5.0,
//               ),
//             ),
//             color: Colors.white,
//           ),
//           child: new Row(
//             children: <Widget>[
//               new Row(
//                 children: [
//                   new Container(
//                     margin: EdgeInsets.only(right: 20),
//                     child: FotoProfile(
//                         foto:
//                             "https://awsimages.detik.net.id/community/media/visual/2022/08/07/resep-nasi-goreng-ayam-dan-ebi_43.jpeg?w=700&q=90"),
//                   ),
//                   new Column(
//                     children: <Widget>[
//                       new Container(
//                         child: new TextBold(teks: "Warung Teh Nur"),
//                       ),
//                       Chat()
//                     ],
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ));
//   }
// }
