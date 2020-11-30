import 'dart:convert';
import 'package:hive/hive.dart';

part 'lastmsg.g.dart';

@HiveType(typeId: 2)
class LastMsg {
  @HiveField(0)
  String name;
  @HiveField(1)
  String msg;
  @HiveField(2)
  String time;
  @HiveField(3)
  String phone;
  LastMsg({this.name, this.msg, this.time, this.phone});
}
