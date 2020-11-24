import 'package:chat_application/models/connect_card.dart';
import 'package:flutter/material.dart';

class ConnectDetailPage extends StatelessWidget {
  const ConnectDetailPage({Key key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: 10,
          itemBuilder: (context, index) {
                return ConnectCard();
          },),

      ),
    );
  }
}

