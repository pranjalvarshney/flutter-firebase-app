import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ninja_brew_crew/models/brew.dart';
import 'package:ninja_brew_crew/screens/loggedin/brewlist.dart';
import 'package:ninja_brew_crew/screens/loggedin/setting_form.dart';
import 'package:ninja_brew_crew/services/auth.dart';
import 'package:ninja_brew_crew/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget{

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 30,horizontal:30),
          child: SettingsForm(),
        );
      });
    }

    return StreamProvider<List<Brew>>.value(
          value: DatabaseService().brews,
          child: Scaffold(
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
            FlatButton.icon(
              icon: Icon(Icons.settings),
              onPressed: _showSettingsPanel,
              label: Text("Settings"),
            ),
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}