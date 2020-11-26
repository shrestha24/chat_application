import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double tabWidth = MediaQuery.of(context).size.width / 5;
    return Scaffold(
      appBar: AppBar(title: Text("My Profile"),
        backgroundColor: Colors.blue,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/person1.jpeg"),
                    height: 90.0,
                    width: 90.0,
                  ),
                ),
                RaisedButton(
                    onPressed: () {

                },
                  padding: EdgeInsets.all(8.0),
                  color: Colors.blue,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.0)
                  ),
                  child: Text("Child Details"),

                ),
                Container(
                  height: ScreenUtil().setHeight(60.0),
                  padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(15.0)),
                  alignment: Alignment.bottomCenter,
                  width: ScreenUtil().setWidth(50.0),
                  child: Center(
                    child: Icon(
                      Icons.camera_alt,
                      size: ScreenUtil().setSp(40.0),
                    ),
                  ),
                ),
                Container(
                    height:(50.0),
                    alignment: Alignment.center,
                    width: tabWidth,
                    child: new Text("CHATS")),
                Container(
                  height:(50.0),
                  alignment: Alignment.center,
                  width: tabWidth,
                  child: new Text("STATUS"),
                ),
                Container(
                  height:(50.0),
                  alignment: Alignment.center,
                  width: tabWidth,
                  child: new Text("CALLS"),
                )
              ]),
          ),

              ],
            ),
          );
  }
}
