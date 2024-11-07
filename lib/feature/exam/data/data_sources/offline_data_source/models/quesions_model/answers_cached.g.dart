// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answers_cached.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnswersCachedAdapter extends TypeAdapter<AnswersCached> {
  @override
  final int typeId = 4;

  @override
  AnswersCached read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnswersCached(
      fields[0] as String?,
      fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AnswersCached obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.answer)
      ..writeByte(1)
      ..write(obj.key);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnswersCachedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
