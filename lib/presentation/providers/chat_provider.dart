import 'package:chat_app_yes_no/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  //maneja la poscion del scroll
  List<Message> messageList = [
    Message(text: "Hola", fromWho: FromWho.me),
    Message(text: "Mundo", fromWho: FromWho.hers),
  ];
  //asincrono async, void vacio, future es algo que puede pasar o no, sirve para los mensajes
  Future<void> sendMessage(String text) async {
        //hace que los msj vacios no se envien metodo trim recorte
     if (text.trim().isEmpty) return;   
     final  newMessage = Message(text: text.trim(), fromWho: FromWho.me); // si empezamos con espacios los borra o espacios extra por eso se una el trim
     //agregar un nuevo mensaje a la lista
     messageList.add(newMessage);
     // Imprime la cantidad de mensajes en consola
    print('Mensajes enviados: ${messageList.length}'); // se imprime en la consola la cantidad de msj enviados

     // notifica a provider que algo cambio especial mente a los de .watch
     notifyListeners();
     moveScrollToBotton();
  }
  //mover el scroll hasta abajo 
  Future <void> moveScrollToBotton() async{
    //animacion
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      //offset,
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration(microseconds: 300),
      //rebote al final de la animacion
      curve: Curves.easeOut);

  }

}