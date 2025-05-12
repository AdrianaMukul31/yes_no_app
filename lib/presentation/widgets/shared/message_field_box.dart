import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    // TEXTEDITING ....controlar lo que el usuario pone en donde se escribe el msj, notifica pero todavia no se ve
    final FocusNode focusNode = FocusNode();
    

    //final colors = Theme.of(context).colorScheme;
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          textController.clear();
          onValue(textValue);
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController, //manejar los datos que se lleve l ususario
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        //print('submit value: $value');
        textController.clear(); //limpiar el campo
        focusNode.requestFocus(); // la flecha que esta como parpadeando en el campo para escribir el msj o 
        //
        onValue(value);
      },
    );
  }
}