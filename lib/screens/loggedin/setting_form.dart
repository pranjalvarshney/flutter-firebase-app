import 'package:flutter/material.dart';
import 'package:ninja_brew_crew/models/user.dart';
import 'package:ninja_brew_crew/services/database.dart';
import 'package:ninja_brew_crew/shared/loading.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4', '5'];

  String _currentName;
  String _currentSugar;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          print(snapshot.hasData);
          if (snapshot.hasData) {
            UserData userData = snapshot.data;

            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text("Update your settings", style: TextStyle(fontSize: 18)),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    initialValue: userData.name,
                    validator: (val) =>
                        val.isEmpty ? "Please enter your name" : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  DropdownButtonFormField(
                    value: _currentSugar ?? userData.sugars,
                    onChanged: (val) {
                      setState(() {
                        _currentSugar = val;
                      });
                    },
                    items: sugars.map((sugar) {
                      return DropdownMenuItem(
                          value: sugar, child: Text("$sugar Sugars"));
                    }).toList(),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Slider(
                      value: (_currentStrength ?? userData.strength).toDouble(),
                      min: 100,
                      activeColor: Colors.brown[_currentStrength ?? 100],
                      inactiveColor: Colors.brown[_currentStrength ?? 100],
                      max: 900,
                      divisions: 8,
                      onChanged: (val) =>
                          setState(() => _currentStrength = val.round())),
                  SizedBox(
                    height: 15,
                  ),
                  RaisedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        await DatabaseService(uid: user.uid).updateUserData(
                            _currentName ?? userData.name,
                            _currentSugar ?? userData.sugars,
                            _currentStrength ?? userData.strength);
                      Navigator.pop(context);
                      }

                      // setState(() async {

                      //   // print(_currentName);
                      //   // print(_currentSugar);
                      //   // print(_currentStrength);
                      // });
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.pinkAccent,
                  )
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
