
import 'package:chat_app_yes_no/domain/entities/message.dart';
import 'package:flutter/widgets.dart';

class YesNoModel {
    String answer;
    bool forced;
    String image;

    YesNoModel({
        required this.answer,
        required this.forced,
        required this.image,
    });

    factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );
   Message toMessageEntity() => Message(
  text: answer == 'yes' 
      ? 'Tal vez'
      : answer == 'no'
        ? 'Definitivamente no'
        : 'Puede ser',
  fromWho: FromWho.hers,
  imageUrl: image,
  sentAt: DateTime.now(),
);
}
