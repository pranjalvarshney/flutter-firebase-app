import 'package:flutter/material.dart';
import 'package:ninja_brew_crew/services/auth.dart';

class Register extends StatefulWidget {
  Function toggle;

  Register({this.toggle});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String passwd = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Register"),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () {
                widget.toggle();
              },
              label: Text("SignIn"),
              icon: Icon(Icons.person),
            )
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Center(
                    child: Container(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (val) => val != '' ? null : "Enter you e-mail",
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (val) =>
                        val.length >= 5 ? null : "Password > 6 character",
                    obscureText: true,
                    onChanged: (val) {
                      setState(() {
                        passwd = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        dynamic result =
                            await _auth.registerWithEmailAndPass(email, passwd);
                        if(result == null){
                          setState(() {
                            error = "Please enter a valid e-mail";
                          });
                        }else{

                        }
                      }
                      // print(email);
                      // print(passwd);
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.brown,
                  ),
                  SizedBox(height: 12,),
                  Text(error, style: TextStyle(color: Colors.red),)
                ],
              )),
        )))));
  }
}
