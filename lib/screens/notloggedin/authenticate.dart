import 'package:flutter/material.dart';
import 'package:ninja_brew_crew/screens/notloggedin/register.dart';
import 'package:ninja_brew_crew/screens/notloggedin/signin.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  
  bool _isSignedIn = true;

  void toggleAuthBtn(){
    setState(() {
      _isSignedIn = !_isSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _isSignedIn != true ? Register(toggle: toggleAuthBtn) : SignIn(toggle: toggleAuthBtn),
    );
  }
}