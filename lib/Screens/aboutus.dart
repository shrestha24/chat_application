import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context,index){
          return Card(
            elevation: 8,
            child: ListTile(
              leading: Text("Leading"),
              title: Text("title"),
              subtitle: Text("SubTitle"),

            ),
          );
        },

      ),
    );
  }
}
