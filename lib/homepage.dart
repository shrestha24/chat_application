import 'package:chat_application/Screens/personChatView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'models/chatUser.dart';

class MainHomeScreen extends StatefulWidget {
  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  List<ChatModel> list = ChatModel.list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black87,
          title: Text(
            "Chat",
            style: TextStyle(fontSize: 32),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  FontAwesomeIcons.filter,
                  color: Colors.blue,
                ),
                onPressed: null),
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  )),
              child: TextField(
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    FontAwesomeIcons.search,
                    color: Colors.blue,
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        /*Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ChatItemPage(),
                  ),
                );*/
                      },
                      leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          child: Icon(
                            FontAwesomeIcons.user,
                            color: Colors.blue,
                            size: 30.0,
                          )),
                      title: Text(
                        list[index].contact.name,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      subtitle: list[index].isTyping
                          ? Row(
                        children: <Widget>[
                          SpinKitThreeBounce(
                            color: Colors.blue,
                            size: 20.0,
                          ),
                        ],
                      )
                          : Row(
                        children: <Widget>[
                          Text(
                            list[index].lastMessage,
                            style: TextStyle(
                              color: Colors.white54,
                            ),
                          ),
                          SizedBox(width: 25),
                          Text(
                            list[index].lastMessageTime + " days ago",
                            style: TextStyle(color: Colors.white54),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: const Color(0xff03dac6),
          foregroundColor: Colors.black,
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => PersonChatView()));
          },
          icon: Icon(Icons.add),
          label: Text('New Contact'),
        ));
  }
}