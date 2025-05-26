// Identidad atómica la unidad más pequeña de la aplicación
enum FromWho {
  me,
  hers,
}

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  final DateTime sentAt;

  Message({
    required this.text,
    this.imageUrl,
    required this.fromWho,
    required this.sentAt,
  });
}
