import 'package:flutter/material.dart';

class ConnectCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(6.0),
        child: Card(
          elevation: 22.0,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/images/person1.jpeg"),
              ),
              SizedBox(
                width: 20,
              ),
              Text("User1",
              style: TextStyle(fontSize: 20),
              ),

              RaisedButton(
                onPressed: () {

                },
                padding: EdgeInsets.all(0),
                textColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)
                ),
                child:
                Text("+Connect"),
              )
            ],
          ),
        ),
    );
  }
}
