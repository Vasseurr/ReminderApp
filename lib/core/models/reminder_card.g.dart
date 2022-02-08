// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_card.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReminderCardAdapter extends TypeAdapter<ReminderCard> {
  @override
  final int typeId = 1;

  @override
  ReminderCard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReminderCard(
      title: fields[0] as String?,
      description: fields[1] as String?,
      date: fields[2] as String?,
      backgroundColor: fields[3] as String?,
      circleColor: fields[4] as String?,
      textColor: fields[5] as String?,
      isActive: fields[6] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ReminderCard obj) {
    writer
      ..writeByte(7)
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
      ..write(obj.textColor)
      ..writeByte(6)
      ..write(obj.isActive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReminderCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
