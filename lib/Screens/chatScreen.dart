import 'package:chat_application/Screens/personChatView.dart';
import 'package:chat_application/models/chatUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
              margin: index == 0
                  ? EdgeInsets.fromLTRB(
                      ScreenUtil().setWidth(20.0),
                      ScreenUtil().setHeight(25.0),
                      ScreenUtil().setWidth(20.0),
                      ScreenUtil().setHeight(0.0))
                  : EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(20.0)),
              height: ScreenUtil().setHeight(150.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/person1.jpeg"),
                      width: ScreenUtil().setWidth(104.0),
                      height: ScreenUtil().setHeight(90.0),
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(30.0),
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  PersonChatView(user: ChatModel.list[index])));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: ScreenUtil().setWidth(400.0),
                              child: Text(
                                "user1",
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(32.0),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Text(
                              '10:15am',
                              style: new TextStyle(
                                  color: Colors.grey,
                                  fontSize: ScreenUtil().setSp(21.0),
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        new SizedBox(height: ScreenUtil().setHeight(8.0)),
                        new Container(
                          width: ScreenUtil().setWidth(500.0),
                          child: new Text(
                           "hello",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: new TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: ScreenUtil().setSp(25.0)),
                          ),
                        ),
                        new SizedBox(height: ScreenUtil().setHeight(15.0)),
                        new Container(
                            width: ScreenUtil().setWidth(550.0),
                            child: new Divider())
                      ],
                    ),
                  ))
                ],
              ));
        });
  }
}
