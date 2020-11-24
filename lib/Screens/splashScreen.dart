import 'package:flutter/material.dart';
import 'dart:async';

import '../homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    Timer(Duration(microseconds: 600), () {
      Navigator.pop(context);
      Navigator.push(
          context, new MaterialPageRoute(builder: (_) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child:
                  Image(image: AssetImage('assets/images/WhatsApp_Logo_4.png')),
            )
          ],
        ));
  }
}
