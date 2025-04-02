
import 'package:flutter/material.dart';
import 'package:yes/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://facts.net/wp-content/uploads/2024/09/50-facts-about-billie-eilish-1726724720.jpg'),
          ),
        ),
        title: Text('Amiga'),
        centerTitle: false,
      ),
      //*CONTINUACION VIDEO 4
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return (index % 2 == 0)
                      ? const HerMessageBubble()
                      : const  MyMessageBubble();
                },
              ),
            ),
            //* CAJA DE TEXTO DE MENSAJES
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}

// Terminé el video 3 continuar en el 4