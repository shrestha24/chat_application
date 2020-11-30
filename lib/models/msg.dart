import 'dart:convert';
import 'package:hive/hive.dart';

part 'msg.g.dart';

@HiveType(typeId: 1)
class ChatMessage {
  @HiveField(0)
  String name;
  @HiveField(1)
  String phone;
  @HiveField(2)
  String msg;
  @HiveField(3)
  String time;
  @HiveField(4)
  bool isMe;

  ChatMessage({
    this.name,
    this.phone,
    this.msg,
    this.time,
    this.isMe,
  });
}
