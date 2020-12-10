
import 'package:chat_application/Screens/aboutus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'constant.dart';



class PopUpMenuForHomePage extends StatelessWidget {

  final BuildContext context;
  const PopUpMenuForHomePage(
      {Key key,

      this.context,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return PopupMenuButton<String>(
        onSelected: choiceAction,
        itemBuilder: (BuildContext context) {
          return Constants.postChoices.map((String choice) {
            return PopupMenuItem<String>(value: choice, child: Text(choice));
          }).toList();
        });


  }

  void choiceAction(
    String choice,
  ) async {
    Navigator.push(context, new MaterialPageRoute(builder: (context)=>AboutUs()));
  }
}

