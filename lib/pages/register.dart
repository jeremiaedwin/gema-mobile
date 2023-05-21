import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gema_app/controllers/UserController.dart';
import 'package:image_picker/image_picker.dart';

File? _image;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  UserController _userController = UserController();

  TextEditingController nimController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();
  TextEditingController fullNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: <Widget>[
        Center(
            child: Container(
          padding: EdgeInsets.only(top: 35, bottom: 20),
          child: Text(
            "Daftar",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(1000, 171, 0, 52)),
          ),
        )),

        new Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              MaterialButton(
                color: Color.fromARGB(1000, 171, 0, 52),
                child: const Text("Pick Image from Gallery",
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold)),
                onPressed: () async {
                  final pickedImage = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (pickedImage != null) {
                    setState(() {
                      _image = File(pickedImage.path);
                    });
                  }
                },
              ),
              MaterialButton(
                color: Color.fromARGB(1000, 171, 0, 52),
                child: const Text("Pick Image from Camera",
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold)),
                onPressed: () async {
                  final pickedImage = await ImagePicker()
                      .pickImage(source: ImageSource.camera);
                  if (pickedImage != null) {
                    setState(() {
                      _image = File(pickedImage.path);
                    });
                  }
                },
              ),
              if (_image != null)
                Container(
                  width: 200,
                  height: 300,
                  child: Image.file(_image!),
                ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 15, bottom: 0),
          child: TextField(
            controller: nimController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              labelText: 'NIM',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 15, bottom: 0),
          child: TextField(
            controller: usernameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              labelText: 'Username',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 15, bottom: 0),
          child: TextField(
            controller: fullNameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              labelText: 'Nama',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 15, bottom: 0),
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              labelText: 'Email',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 15, bottom: 0),
          child: TextField(
            controller: phoneNumberController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              labelText: 'Nomor HP',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 15, bottom: 0),
          child: TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              labelText: 'Password',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 35, bottom: 0),
          child: Container(
            height: 40,
            width: 150,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: ElevatedButton(
              onPressed: () {
                _userController.createNewUser(context,nimController.text, usernameController.text, fullNameController.text, emailController.text, phoneNumberController.text, passwordController.text, _image);
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(1000, 171, 0, 52),
                textStyle: TextStyle(fontSize: 14),
              ),
              child: Text('Buat Akun', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ],
    )));
  }
}
