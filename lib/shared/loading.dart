import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SpinKitSquareCircle(
              color: Colors.brown,
              size: 80,
            ),
            SizedBox(height: 20,),
            Text("Please wait", style: TextStyle(color: Colors.brown, fontSize: 22),)
          ],
        ),
      ),
    );
  }
}
