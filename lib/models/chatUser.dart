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

  

}