import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Screens/calls.dart';
import 'Screens/camera.dart';
import 'Screens/chatScreen.dart';
import 'Screens/status.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = new TabController(length: 4, vsync: this, initialIndex: 1);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, allowFontScaling: true);
    double tabWidth = MediaQuery.of(context).size.width / 5;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("WhatsApp"),
        actions: <Widget>[Icon(Icons.search), Icon(Icons.more_vert)],
        bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorColor: Colors.white,
            tabs: [
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
                  height: ScreenUtil().setHeight(50.0),
                  alignment: Alignment.center,
                  width: tabWidth,
                  child: new Text("CHATS")),
              Container(
                height: ScreenUtil().setHeight(50.0),
                alignment: Alignment.center,
                width: tabWidth,
                child: new Text("STATUS"),
              ),
              Container(
                height: ScreenUtil().setHeight(50.0),
                alignment: Alignment.center,
                width: tabWidth,
                child: new Text("CALLS"),
              )
            ]),
      ),
      body: TabBarView(controller: _tabController, children: [
        CameraScreen(),
        ChatScreen(),
        StatusScreen(),
        CallsScreen(),
      ]),
      floatingActionButton: _buildFAB(_tabController.index),
    );
  }

  Widget _buildFAB(int index) {
    if (index == 1) {
      return new FloatingActionButton(
        onPressed: () {},
        child: new Icon(
          Icons.message,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      );
    } else if (index == 2) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new FloatingActionButton(
            onPressed: () {},
            mini: true,
            child: new Icon(
              Icons.create,
              color: Theme.of(context).primaryColor,
            ),
            backgroundColor: Theme.of(context).accentColor,
          ),
          new SizedBox(
            height: ScreenUtil().setHeight(12.0),
          ),
          new FloatingActionButton(
            onPressed: () {},
            child: new Icon(
              Icons.add_a_photo,
              color: Colors.white,
            ),
            backgroundColor: Theme.of(context).secondaryHeaderColor,
          ),
        ],
      );
    } else if (index == 3) {
      return new FloatingActionButton(
        onPressed: () {},
        child: new Icon(
          Icons.add_call,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      );
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
