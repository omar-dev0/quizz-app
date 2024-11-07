// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_cached_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionsCachedModelAdapter extends TypeAdapter<QuestionsCachedModel> {
  @override
  final int typeId = 2;

  @override
  QuestionsCachedModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuestionsCachedModel(
      (fields[0] as List?)?.cast<AnswersCached>(),
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as SubjectExamsCachedModel?,
    );
  }

  @override
  void write(BinaryWriter writer, QuestionsCachedModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.answers)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.question)
      ..writeByte(4)
      ..write(obj.correct)
      ..writeByte(5)
      ..write(obj.exam);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionsCachedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
