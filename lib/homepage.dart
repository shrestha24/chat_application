import 'package:chat_application/Screens/aboutus.dart';
import 'package:chat_application/Screens/personChatView.dart';
import 'package:chat_application/common/menu.dart';
import 'package:chat_application/contacts.dart';
import 'package:chat_application/models/lastmsg.dart';
import 'package:chat_application/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'models/chatUser.dart';
import 'models/chatUserDummy.dart';

class MainHomeScreen extends StatefulWidget {
  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  List<LastMsg> list1 = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() {
    list1 = [];
    var xz = Hive.box('lastChat').keys;
    List list11 = Set.from(xz).toList();

    for (var item in list11) {
      list1.add(Hive.box('lastChat').get(item));
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white10,
          title: Text(
            "Chat",
            style: TextStyle(fontSize: 32),
          ),
          actions: <Widget>[
            PopUpMenuForHomePage(
              context: context,
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )),
                child: Center(
                    child: Text(
                  "Inbox",
                  style: TextStyle(fontSize: 40),
                ))),
            Expanded(
              child: list1.length == 0
                  ? SizedBox()
                  : ListView.builder(
                      itemCount: list1.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            List listmsgHistory = [];

                            if (Hive.box("chat")
                                .containsKey(list1[index].phone)) {
                              listmsgHistory =
                                  Hive.box("chat").get(list1[index].phone);
                              print(listmsgHistory);
                            }
                            User user = new User(
                              Name: list1[index].name,
                              Phone: list1[index].phone,
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PersonChatView(
                                          user1: user,
                                          msgList: listmsgHistory,
                                        )));
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
                            list1[index].name,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          subtitle: false
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
                                      list1[index].msg,
                                      style: TextStyle(
                                        color: Colors.black26,
                                      ),
                                      overflow: TextOverflow.fade,
                                      softWrap: true,
                                    ),
                                    SizedBox(width: 25),
                                    Text(
                                      list1[index].time,
                                      style: TextStyle(color: Colors.black),
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
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ContactsList()));
          },
          icon: Icon(Icons.add),
          label: Text('New Contact'),
        ));
  }
}
