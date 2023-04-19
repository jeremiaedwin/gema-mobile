import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(1000, 171, 0, 52),
          title: new Text(
            "Kelola Akun",
            style: TextStyle(fontSize: 14.0, color: Colors.white),
          ),
        ),
        body: Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: new BoxDecoration(
                border: Border.all(color: Color.fromARGB(100, 128, 128, 128)),
                borderRadius: new BorderRadius.all(
                  new Radius.circular(
                    5.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Name cannot be empty';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                        validator: (value) {
                          if (!(value?.contains('@') ?? false)) {
                            return 'Email cannot be empty';
                          }
                          if (!(value?.contains('@') ?? false)) {
                            return 'Invalid email format';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            // Do something with the form data
                            String name = _nameController.text;
                            String email = _emailController.text;

                            print('Name: $name');
                            print('Email: $email');
                          }
                        },
                        child: Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

//ganti foto
class EditFoto extends StatelessWidget {
  EditFoto({required this.foto});

  final String foto;

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: ClipOval(
      child: Image(
        image: new NetworkImage(foto),
        height: 75.0,
        width: 75.0,
        fit: BoxFit.cover,
      ),
    ));
  }
}
