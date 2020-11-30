// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lastmsg.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LastMsgAdapter extends TypeAdapter<LastMsg> {
  @override
  final int typeId = 2;

  @override
  LastMsg read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LastMsg(
      name: fields[0] as String,
      msg: fields[1] as String,
      time: fields[2] as String,
    )..phone = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, LastMsg obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.msg)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.phone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LastMsgAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
