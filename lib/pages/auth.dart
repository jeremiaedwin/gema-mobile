import 'package:flutter/material.dart';
import 'package:gema_app/pages/register.dart';
import '../controllers/AuthController.dart';
import '../main.dart' as MainPage;

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _loginPressed() {
    String email = _emailController.text;
    String password = _passwordController.text;
    AuthController().signIn(context, email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                  width: 200,
                  height: 150,
                  child: Image.asset('assets/images/logo.jpg'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  hintText: 'Enter valid email id as abc@gmail.com',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter secure password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/main');
                },
                style: TextButton.styleFrom(
                  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Color.fromARGB(1000, 171, 0, 52)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: ElevatedButton(
                  onPressed: _loginPressed,
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(1000, 171, 0, 52),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  child: Text('Sign In', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                  },
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(fontSize: 15),
                  ),
                  child: Text(
                    'New User? Create Account',
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}