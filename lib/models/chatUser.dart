import 'contact_model.dart';

class ChatModel {
  final bool isTyping;
  final String lastMessage;
  final String lastMessageTime;
  final ContactModel contact;

  ChatModel({
    this.isTyping,
    this.lastMessage,
    this.lastMessageTime,
    this.contact
  }
      );

  static List<ChatModel> list = [

    ChatModel(
      isTyping: false,
      lastMessage: "hello!",
      lastMessageTime: "4 ",
      contact: ContactModel(name: "Shrestha"),
    ),

    ChatModel(
      isTyping: false,
      lastMessage: "Sure!, no problm",
      lastMessageTime: "2 ",
      contact: ContactModel(name: "Sonali"),
    ),

    ChatModel(
      isTyping: false,
      lastMessage: "Thank you",
      lastMessageTime: "2 ",
      contact: ContactModel(name: "Mummy"),
    ),
  ];


}