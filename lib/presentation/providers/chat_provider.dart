import 'package:chat_app_yes_no/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: "Hola", fromWho: FromWho.me),
    Message(text: "Mundo", fromWho: FromWho.hers),
  ];
  //asincrono async, void vacio, future es algoque puede pasar o no sirve para los mensajes
  Future<void> sendMessage(String text) async {
     
     final  newMessage = Message(text: text, fromWho: FromWho.me);
     //agregar un nuevo mensaje a la lista
     messageList.add(newMessage);
     // notifica a provider que algo cambio
     notifyListeners();
  }

}