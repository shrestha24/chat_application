import 'package:chat_application/Screens/my_profile.dart';
import 'package:chat_application/models/lastmsg.dart';
import 'package:chat_application/models/msg.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'homepage.dart';
import 'package:hive/hive.dart';

List<CameraDescription> camera;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(ChatMessageAdapter());
  Hive.registerAdapter(LastMsgAdapter());
  await Hive.openBox("chat");
  await Hive.openBox("lastChat");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chats',
      theme: ThemeData(
        primaryColor: Colors.blue,
        secondaryHeaderColor: Colors.black,
        highlightColor: Color.fromRGBO(18, 140, 126, 1.0),
        cardColor: Color.fromRGBO(250, 250, 250, 1.0),
        accentColor: Color.fromRGBO(236, 229, 221, 1.0),
      ),
      home: MainHomeScreen(),
    );
  }
}
