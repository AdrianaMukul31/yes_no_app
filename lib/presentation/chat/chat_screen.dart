import 'package:flutter/material.dart';
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://facts.net/wp-content/uploads/2024/09/50-facts-about-billie-eilish-1726724720.jpg'),
          ),
        ),
        
        title: Text('Billie eilish'),
        centerTitle: true,
      ),
    );
  }
}