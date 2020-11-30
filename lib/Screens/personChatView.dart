import 'dart:async';

import 'package:chat_application/encrypt_service.dart';
import 'package:chat_application/models/lastmsg.dart';
import 'package:chat_application/models/msg.dart';
import 'package:chat_application/models/my_flutter_app_icons.dart';
import 'package:chat_application/models/userModel.dart';
import 'package:chat_application/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bubble/bubble.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:async/async.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonChatView extends StatefulWidget {
  User user1;

  List msgList;
  PersonChatView({@required this.user1, this.msgList});

  @override
  _PersonChatViewState createState() => _PersonChatViewState();
}

class _PersonChatViewState extends State<PersonChatView> {
  TextEditingController _messageController;

  @override
  void initState() {
    super.initState();

    _messageController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, allowFontScaling: true);
    return new Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: new AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 1.0,
          title: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new Container(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(80.0)),
                width: ScreenUtil().setWidth(280.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Container(
                      child: new IconButton(
                          icon: new Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                    new ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image.asset(
                        'assets/images/person1.jpeg',
                        fit: BoxFit.cover,
                        height: ScreenUtil().setHeight(100.0),
                        width: ScreenUtil().setWidth(100.0),
                      ),
                    ),
                    new SizedBox(width: ScreenUtil().setWidth(2.0))
                  ],
                ),
              ),
              new Expanded(
                child: new Container(
                  padding: EdgeInsets.fromLTRB(
                      ScreenUtil().setWidth(10.0), 0.0, 0.0, 0.0),
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: new Text(
                    widget.user1.Name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: new TextStyle(fontSize: ScreenUtil().setSp(40.0)),
                  ),
                ),
              )
            ],
          ),
        ),
        body: new Column(
          children: <Widget>[
            new Expanded(
                flex: 12,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(20.0),
                    right: ScreenUtil().setWidth(20.0),
                  ),
                  child: new ListView.builder(
                    itemCount: widget.msgList.length,
                    reverse: false,
                    itemBuilder: (context, index) {
                      return widget.msgList[index].isMe
                          ? new Bubble(
                              margin: BubbleEdges.only(
                                  top: (index < widget.msgList.length - 1 &&
                                          widget.msgList[index + 1].isMe)
                                      ? ScreenUtil().setHeight(5.0)
                                      : ScreenUtil().setHeight(20.0),
                                  left: ScreenUtil().setWidth(100.0),
                                  bottom: index == 0
                                      ? ScreenUtil().setHeight(10.0)
                                      : ScreenUtil().setHeight(0.0)),
                              nip: (index < widget.msgList.length - 2 &&
                                      widget.msgList[index + 1].isMe)
                                  ? BubbleNip.no
                                  : BubbleNip.rightTop,
                              color: Color.fromRGBO(225, 255, 199, 1.0),
                              nipHeight: ScreenUtil().setHeight(12.0),
                              alignment: Alignment.centerRight,
                              elevation: 0.4,
                              child: new Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  new Text(
                                    widget.msgList[index].msg,
                                  ),
                                  new SizedBox(
                                    height: ScreenUtil().setHeight(10.0),
                                  ),
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new SizedBox(
                                        width: ScreenUtil().setWidth(10.0),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : new Bubble(
                              margin: BubbleEdges.only(
                                  top: (index < widget.msgList.length - 2 &&
                                          widget.msgList[index + 1].isMe)
                                      ? ScreenUtil().setHeight(20.0)
                                      : ScreenUtil().setHeight(5.0),
                                  right: ScreenUtil().setWidth(100.0)),
                              nip: (index < widget.msgList.length - 1 &&
                                      widget.msgList[index + 1].isMe)
                                  ? BubbleNip.leftTop
                                  : BubbleNip.no,
                              nipHeight: ScreenUtil().setHeight(12.0),
                              alignment: Alignment.centerLeft,
                              elevation: 0.4,
                              child: new Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  new Text(
                                    widget.msgList[index].msg,
                                  ),
                                  new SizedBox(
                                    height: ScreenUtil().setHeight(10.0),
                                  ),
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        widget.msgList[index].time,
                                        style: new TextStyle(
                                            fontSize: ScreenUtil().setSp(20.0),
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                    },
                  ),
                )),
            new Container(
              padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(5.0)),
              height: ScreenUtil().setHeight(120.0),
              decoration: new BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: new BorderRadius.circular(30.0)),
              child: new Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(10.0),
                    vertical: ScreenUtil().setHeight(0.0)),
                child: Row(
                  children: <Widget>[
                    new Expanded(
                      flex: 15,
                      child: new Container(
                        height: double.infinity,
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.circular(50.0)),
                        child: new Align(
                          alignment: Alignment.center,
                          child: new TextField(
                            controller: _messageController,
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: new InputDecoration(
                                hintText: "Type a message",
                                border: InputBorder.none,
                                suffixIcon: Padding(
                                  padding: EdgeInsets.only(
                                      right: ScreenUtil().setWidth(20.0)),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          final GlobalKey<FormState> _formKey =
                                              GlobalKey();
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  content: SizedBox(
                                                    height: 300,
                                                    child: Stack(
                                                      children: <Widget>[
                                                        Center(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Form(
                                                                key: _formKey,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: <
                                                                      Widget>[
                                                                    TextFormField(
                                                                      maxLength:
                                                                          40,
                                                                      validator:
                                                                          (value) {
                                                                        if (value
                                                                            .isEmpty) {
                                                                          return "Msg Required";
                                                                        }
                                                                        return null;
                                                                      },
                                                                      decoration: InputDecoration(
                                                                          labelText:
                                                                              "Enter Msg",
                                                                          border:
                                                                              OutlineInputBorder(),
                                                                          labelStyle: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 24)),
                                                                    ),
                                                                    MaterialButton(
                                                                      color: Colors
                                                                          .blue,
                                                                      onPressed:
                                                                          () async {
                                                                        String key = "6371849902" +
                                                                            widget.user1.Phone +
                                                                            "abcdefghi";
                                                                        ShowToast().showToast(key
                                                                            .length
                                                                            .toString());
                                                                        print(key
                                                                            .length
                                                                            .toString());
                                                                        var result = await EncrytService().getEncryptedText(
                                                                            _messageController.text,
                                                                            key);

                                                                        Timer(
                                                                            Duration(seconds: 2),
                                                                            () {
                                                                          _messageController.text =
                                                                              result;

                                                                          Navigator.pop(
                                                                              context);
                                                                        });
                                                                      },
                                                                      child: Text(
                                                                          "Encrypt"),
                                                                    )
                                                                  ],
                                                                )),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                        child: new Icon(
                                          Icons.enhanced_encryption,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                prefixIcon: GestureDetector(
                                  onTap: () async {
                                    final GlobalKey<FormState> _formKey =
                                        GlobalKey();
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: SizedBox(
                                              height: 300,
                                              child: Stack(
                                                children: <Widget>[
                                                  Center(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Form(
                                                          key: _formKey,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: <Widget>[
                                                              TextFormField(
                                                                maxLength: 40,
                                                                validator:
                                                                    (value) {
                                                                  if (value
                                                                      .isEmpty) {
                                                                    return "Msg Required";
                                                                  }
                                                                  return null;
                                                                },
                                                                decoration: InputDecoration(
                                                                    labelText:
                                                                        "Enter Msg",
                                                                    border:
                                                                        OutlineInputBorder(),
                                                                    labelStyle: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            24)),
                                                              ),
                                                              MaterialButton(
                                                                color:
                                                                    Colors.blue,
                                                                onPressed:
                                                                    () async {
                                                                  String key = "6371849902" +
                                                                      widget
                                                                          .user1
                                                                          .Phone +
                                                                      "abcdefghi";
                                                                  ShowToast()
                                                                      .showToast(key
                                                                          .length
                                                                          .toString());
                                                                  print(key
                                                                      .length
                                                                      .toString());
                                                                  var result = await EncrytService()
                                                                      .getDecryptedText(
                                                                          _messageController
                                                                              .text,
                                                                          key);

                                                                  Timer(
                                                                      Duration(
                                                                          seconds:
                                                                              2),
                                                                      () {
                                                                    _messageController
                                                                            .text =
                                                                        result;

                                                                    Navigator.pop(
                                                                        context);
                                                                  });
                                                                },
                                                                child: Text(
                                                                    "Decrypt"),
                                                              )
                                                            ],
                                                          )),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  child: Icon(
                                    Icons.sms,
                                    size: ScreenUtil().setSp(65.0),
                                    color: Colors.blue,
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ),
                    new SizedBox(
                      width: ScreenUtil().setWidth(10.0),
                    ),
                    new Expanded(
                        flex: 2,
                        child: new Container(
                            height: double.infinity,
                            decoration: new BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: new BorderRadius.circular(50.0)),
                            child: Center(
                              child: GestureDetector(
                                onTap: () async {
                                  if (_messageController.text.trim() != "") {
                                    ShowToast().showToast(
                                        _messageController.text.trim());
                                    DateTime now = DateTime.now();
                                    String formattedTime =
                                        DateFormat.Hm().format(now);
                                    ChatMessage object = new ChatMessage(
                                        msg: _messageController.text,
                                        name: widget.user1.Name,
                                        phone: widget.user1.Phone,
                                        isMe: true);
                                    LastMsg lastMsg = new LastMsg(
                                        name: widget.user1.Name,
                                        time: formattedTime,
                                        phone: widget.user1.Phone,
                                        msg: _messageController.text);

                                    widget.msgList.add(object);
                                    Hive.box('lastChat')
                                        .put(widget.user1.Phone, lastMsg);
                                    Hive.box("chat").put(
                                        widget.user1.Phone, widget.msgList);
                                    var uri = 'sms:' +
                                        widget.user1.Phone +
                                        '?body=' +
                                        _messageController.text;
                                    launch(uri);
                                    _messageController.text = "";
                                    setState(() {});

                                    //TODO ADD BACKEND CODE HERE
                                  } else {
                                    ShowToast()
                                        .showToast("Can't Send Empty Message");
                                  }
                                },
                                child: Icon(
                                  Icons.send,
                                  size: ScreenUtil().setSp(40.0),
                                  color: Colors.white,
                                ),
                              ),
                            )))
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
