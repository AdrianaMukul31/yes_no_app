import 'package:chat_app_yes_no/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: "Hola", fromWho: FromWho.me),
    Message(text: "Mundo", fromWho: FromWho.me),
  ];
}