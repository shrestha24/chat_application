import 'package:chat_application/Screens/my_profile.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'homepage.dart';



List<CameraDescription> camera;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  camera = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Chats',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(7, 94, 84, 1.0),
        secondaryHeaderColor: Color.fromRGBO(37, 211, 102,1.0),
        highlightColor: Color.fromRGBO(18, 140, 126, 1.0),
        cardColor: Color.fromRGBO(250, 250, 250, 1.0),
        accentColor: Color.fromRGBO(236, 229, 221, 1.0),
      ),
      home: MainHomeScreen(),
    );
  }
}
