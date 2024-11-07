// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answers_cached_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnswerCachedEntityAdapter extends TypeAdapter<AnswerCachedEntity> {
  @override
  final int typeId = 5;

  @override
  AnswerCachedEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnswerCachedEntity(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AnswerCachedEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.answer)
      ..writeByte(1)
      ..write(obj.correctKey)
      ..writeByte(2)
      ..write(obj.userChoiceKey);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnswerCachedEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
