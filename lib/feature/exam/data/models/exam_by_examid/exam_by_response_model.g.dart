// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_by_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamByIdResponseModel _$ExamByIdResponseModelFromJson(
        Map<String, dynamic> json) =>
    ExamByIdResponseModel(
      message: json['message'] as String?,
      exam: json['exam'] == null
          ? null
          : Exam.fromJson(json['exam'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExamByIdResponseModelToJson(
        ExamByIdResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'exam': instance.exam,
    };

Exam _$ExamFromJson(Map<String, dynamic> json) => Exam(
      Id: json['_id'] as String?,
      title: json['title'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      subject: json['subject'] as String?,
      numberOfQuestions: (json['numberOfQuestions'] as num?)?.toInt(),
      active: json['active'] as bool?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$ExamToJson(Exam instance) => <String, dynamic>{
      '_id': instance.Id,
      'title': instance.title,
      'duration': instance.duration,
      'subject': instance.subject,
      'numberOfQuestions': instance.numberOfQuestions,
      'active': instance.active,
      'createdAt': instance.createdAt,
    };
