import 'package:chat_app_yes_no/domain/entities/message.dart';
import 'package:chat_app_yes_no/infrastructure/models/yes_no_model.dart';
import 'package:dio/dio.dart';

class GetYesNoAnswer { // get=obtener    enviar=pust
//instancia de la clase Dio para manejar peticiones HTTP (que sig las siglas)
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