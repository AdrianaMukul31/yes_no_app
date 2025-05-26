import 'package:chat_app_yes_no/domain/entities/message.dart';
import 'package:chat_app_yes_no/infrastructure/models/yes_no_model.dart';
import 'package:dio/dio.dart';

class GetYesNoAnswer { // get=obtener    enviar=pust
//instancia de la clase Dio para manejar peticiones HTTP (que sig las siglas) Hypertext Transfer Protocol (Protocolo de Transferencia de Hipertexto)
final _dio= Dio();
Future<Message> getAnswer () async{  //no se ejecuta de manera inmediata si no que puede tardar eso sig asyncrono
 //almacenar el resultado de la peticion
   final response =  await _dio.get('https://yesno.wtf/api');  
    //ssl:s del http-s
    //almacenar la data de la respuesta
  final yesNoModel = YesNoModel.fromJson (response.data);

  //retornar
  return yesNoModel.toMessageEntity();

 }
}
//*Dio en Flutter?

//En Flutter, Dio es una librería para hacer peticiones HTTP (como obtener datos de una API).

//Es más completa y flexible que la librería http de Flutter, y permite cosas como:

  //  Enviar y recibir datos de APIs REST

    //Manejar errores fácilmente

   // Usar interceptores (por ejemplo, para agregar headers como tokens)

   // Mostrar el progreso de una descarga o subida

    // Cancelar peticiones
//*
//La librería http es una forma simple de hacer peticiones a APIs o servidores web.
//La s al final de https significa “Secure” (seguro).
//Una API (Application Programming Interface) es como un mesero entre dos programas o sistemas, es una interfaz o un por medio para solicitar algo 
//En Flutter usamos librerías como http o dio para conectarnos a APIs y traer datos que nuestra app mostrará.