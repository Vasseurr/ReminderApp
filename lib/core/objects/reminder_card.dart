import 'dart:ui';

import 'package:hive/hive.dart';

part 'reminder_card.g.dart';

@HiveType(typeId: 1)
class ReminderCard extends HiveObject {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? description;
  @HiveField(2)
  String? date;
  @HiveField(3)
  String? backgroundColor;
  @HiveField(4)
  String? circleColor;
  @HiveField(5)
  String? textColor;
  @HiveField(6)
  bool? isActive;

  ReminderCard(
      {this.title,
      this.description,
      this.date,
      this.backgroundColor,
      this.circleColor,
      this.textColor,
      this.isActive = true});

  ReminderCard.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    date = json['date'];
    backgroundColor = json['backgroundColor'];
    circleColor = json['circleColor'];
    textColor = json['textColor'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['date'] = date;
    data['backgroundColor'] = backgroundColor;
    data['circleColor'] = circleColor;
    data['textColor'] = textColor;
    data['isActive'] = isActive;
    return data;
  }
}
