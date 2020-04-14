import 'package:flutter/material.dart';
import 'package:ninja_brew_crew/services/auth.dart';
import 'package:ninja_brew_crew/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggle;

  SignIn({this.toggle});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String passwd = "";
  String error = "";
  bool loadingStatus = false;

  @override
  Widget build(BuildContext context) {
    return loadingStatus ? Loading() : Scaffold(
        appBar: AppBar(
          title: Text("SignIn"),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () {
                widget.toggle();
              },
              label: Text("Register"),
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
                        decoration: InputDecoration(
                          labelText: "Enter e-mail",
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        validator: (val) =>
                            val != '' ? null : "Enter you e-mail",
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
                        decoration: InputDecoration(
                          labelText: "Enter password",
                          fillColor: Colors.white,
                          filled: true,
                        ),
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
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: FlatButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                loadingStatus = true;
                              });
                              dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, passwd);
                                                                  print(result);

                              if(result == null) {
                                print("hi there it s me 2 adasd");
                                setState(() {
                                  loadingStatus = false;
                                  error = "Enter valid details";
                                });
                              }
                            }
                          },
                          child: Text(
                            "SignIn",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.brown,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  )),
            ),
          )),
        ));
  }
}
