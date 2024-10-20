// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Subject_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectResponse _$SubjectResponseFromJson(Map<String, dynamic> json) =>
    SubjectResponse(
      subjects:
          (json['subjects'] as List<dynamic>?)?.map(Subjects.fromJson).toList(),
    );

Map<String, dynamic> _$SubjectResponseToJson(SubjectResponse instance) =>
    <String, dynamic>{
      'subjects': instance.subjects,
    };
