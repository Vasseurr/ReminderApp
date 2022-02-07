import 'dart:ui';

import 'package:hive/hive.dart';
import 'package:reminder_app/core/objects/reminder_card.dart';

class ReminderCardAdapter extends TypeAdapter<ReminderCard> {
  @override
  final typeId = 0;

  @override
  ReminderCard read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReminderCard()
      ..title = fields[0] as String
      ..description = fields[1] as String
      ..date = fields[2] as String
      ..backgroundColor = fields[3] as String
      ..circleColor = fields[4] as String
      ..textColor = fields[5] as String;
  }

  @override
  void write(BinaryWriter writer, ReminderCard obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.backgroundColor)
      ..writeByte(4)
      ..write(obj.circleColor)
      ..writeByte(5)
      ..write(obj.textColor);
  }
}
