import 'package:chat_app_yes_no/config/helpers/get_yes_no_answer.dart';
import 'package:chat_app_yes_no/domain/entities/message.dart';
import 'package:flutter/material.dart';
//PImagina que tienes una app con varias pantallas:

    //En una pantalla eliges un café 🍵

    //En otra quieres ver el total del carrito 🛒

//Con Provider, puedes guardar ese café en un lugar central (como una "mochila" de datos) y que cualquier parte de la app lo pueda usar o actualizar.

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer ();
  //maneja la poscion del scroll
  List<Message> messageList = [
  ];
  //asincrono async, void vacio, future es algo que puede pasar o no, sirve para los mensajes
  Future<void> sendMessage(String text) async {
        //hace que los msj vacios no se envien metodo trim recorte
     if (text.trim().isEmpty) return;   
     final  newMessage = Message(text: text.trim(), fromWho: FromWho.me, sentAt: DateTime.now(),); // si empezamos con espacios los borra o espacios extra por eso se una el trim
     //agregar un nuevo mensaje a la lista
     messageList.add(newMessage);

     //detectar si el usuario hizo una pregunta
     if(text.endsWith('?')){
      herReply();
     }
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
// crear la respuesta de ella
Future<void> herReply () async {
  //obtener el mensaje de la peticion HTTP
  final herMessage = await getYesNoAnswer.getAnswer();
  //Anadimos el mensaje de ella a la lista de mensajes
  messageList.add(herMessage);
  //notificar a provider los cambios
  notifyListeners();
  //mover el scroll hasta el ultimo mensaje
  moveScrollToBotton();
}
}