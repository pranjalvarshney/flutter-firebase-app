import 'package:flutter/material.dart';
import 'package:ninja_brew_crew/services/auth.dart';

class Home extends StatelessWidget{

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Brew Crew"),
        backgroundColor: Colors.brown,
        actions: <Widget>[
          FlatButton.icon(
            label: Text("Logout"),
            icon: Icon(Icons.person),
            onPressed: ()async{
              await _authService.signout(); 
            },
          ),
        ],
      ),
      body: Center(child: Text("WElcome to home"),),
    );
  }
}