import 'package:chat_application/homepage.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
   /*Timer(Duration(seconds: 3),()async{
     Navigator.push(context, new MaterialPageRoute(builder: (context)=>MainHomeScreen()));
   });*/
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Expanded(
            flex: 10,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage("assets/images/logo.png"),height: 220.0,),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage:AssetImage("assets/images/mayank.jpeg"),),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar( radius: 30,backgroundImage: AssetImage("assets/images/3.jpeg"),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar( radius: 30,backgroundImage: AssetImage("assets/images/4.jpeg"),),
                    ),
                  ],),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar( radius: 30,backgroundImage: AssetImage("assets/images/shrestha.jpeg"),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar( radius: 30,backgroundImage: AssetImage("assets/images/2.jpeg"),),
                    ),
                  ],),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}