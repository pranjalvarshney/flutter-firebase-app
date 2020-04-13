import "package:flutter/material.dart";
import 'package:ninja_brew_crew/models/user.dart';
import 'package:ninja_brew_crew/screens/wrapper.dart';
import 'package:ninja_brew_crew/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}