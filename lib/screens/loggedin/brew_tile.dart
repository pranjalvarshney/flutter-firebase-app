import 'package:flutter/material.dart';
import 'package:ninja_brew_crew/models/brew.dart';

class BrewTile extends StatelessWidget {

  final Brew brew;
  
  BrewTile({this.brew});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top:10, bottom:0),
      child: Card(
        margin: EdgeInsets.only(left: 10, right: 10, top:10, bottom:0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.brown[brew.strength],
            child: Text(brew.strength.toString()),),
          title: Text(brew.name),
          subtitle: Text("Takes " + brew.sugars + " sugar"),
        ),
      ),
    );
  }
}