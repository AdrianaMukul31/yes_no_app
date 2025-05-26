import 'package:chat_app_yes_no/domain/entities/message.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // <-- Asegúrate de tenerlo en pubspec.yaml

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final String hora = DateFormat('hh:mm a').format(message.sentAt); //inicializo

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Mensaje de texto con hora
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              decoration: BoxDecoration(
                color: colors.secondary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                message.text,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            // Hora en la esquina inferior derecha
            Positioned(
              bottom: 4,
              right: 8,
              child: Text(
                hora,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 5),

        // Imagen si existe
        _ImageBubble(imageUrl: message.imageUrl!),
      ],
    );
  }
}

// Widget que muestra la imagen enviada
class _ImageBubble extends StatelessWidget {
  final String imageUrl;
  const _ImageBubble({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final DateTime now = DateTime.now();
    final String hora = DateFormat('hh:mm a').format(now); //tambien la hora l puede obtener desde el mensaje anterior

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            imageUrl,
            width: size.width * 0.7,
            height: 150,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;

              return Container(
                width: size.width * 0.7,
                height: 150,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: const Text('Amiga está enviando una imagen'),
              );
            },
          ),
        ),

        //hora del gif
        Positioned(
          bottom: 6,
          right: 10,
          child: Container(
            color: Colors.black45,
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            child: Text(
              hora,
              style: const TextStyle(fontSize: 10, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
