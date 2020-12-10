import 'package:chat_application/models/aboutusUser.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        itemCount: mlist.length,
        itemBuilder: (context,index){
          return Card(
            elevation: 8,
            child: ListTile(
              leading: CircleAvatar(
                radius:28  ,backgroundImage: AssetImage(mlist[index].image),),
              title: Text(mlist[index].name,style: TextStyle(fontSize: 25),),
              subtitle: Text(mlist[index].speciality,style: TextStyle(fontSize: 20),),

            ),
          );
        },

      ),
    );
  }
}
