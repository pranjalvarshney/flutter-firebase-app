import 'package:flutter/material.dart';
import 'package:ninja_brew_crew/models/user.dart';
import 'package:ninja_brew_crew/screens/loggedin/home.dart';
import 'package:ninja_brew_crew/screens/notloggedin/authenticate.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);

    print(user);
    return user != null? Home() :Authenticate();
  }
}