import 'dart:developer';

import 'package:animate_do/animate_do.dart';
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
      appBar: AppBar(
        title: const Text("Result"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: FadeInUpBig(
        child: ListView.builder(
            itemCount: widget.examResultEntity.answers!.length,
            itemBuilder: (context, index) {
              return AnswersResultList(
                questionsLength: widget.examResultEntity.question!.length + 1,
                questionIndex: index,
                answerCachedEntity: widget.examResultEntity.answers![index],
                question: widget.examResultEntity.question,
              );
            }),
      ),
    );
  }
}
