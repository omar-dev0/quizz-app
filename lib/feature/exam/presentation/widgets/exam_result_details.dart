import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/feature/exam/domain/entities/cached_exam_result_entity.dart';

import 'answers_result_list.dart';

class ExamResultDetails extends StatefulWidget {
  final CachedExamResultEntity examResultEntity;

  const ExamResultDetails({super.key, required this.examResultEntity});

  @override
  State<ExamResultDetails> createState() => _ExamResultDetailsState();
}

class _ExamResultDetailsState extends State<ExamResultDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
            itemCount: widget.examResultEntity.answers!.length,
            itemBuilder: (context, index) {
              return AnswersResultList(
                answerCachedEntity: widget.examResultEntity.answers![index],
              );
            }),
    );
  }
}
