import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                validator: (val) => !val.contains('@') ? 'invalid email' : null,
                onSaved: (val) => _email = val,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Password"),
                validator: (val) =>
                    val.length < 6 ? 'password too short' : null,
                obscureText: true,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
              ),
              RaisedButton(
                child: Text("Login"),
                onPressed: _submit,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      performLogin();
    }
  }

  void performLogin() {
    final snackbar = SnackBar(
      content: Text("Your Email is $_email ,password is $_password "),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }
}
