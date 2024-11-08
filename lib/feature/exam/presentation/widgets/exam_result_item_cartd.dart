import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/core/extensions/build_context_extensions.dart';
import 'package:quizz_app/feature/exam/domain/entities/cached_exam_result_entity.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/subject_exams_widget/subject_exam_details.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/subject_result_details.dart';

import '../../domain/entities/exam_entity.dart';
import '../manager/subject_exam_manager/exams_screen_action.dart';

class ExamResultItemCartd extends StatelessWidget {
  final CachedExamResultEntity exam;
  const ExamResultItemCartd({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        height: 103,
        width: context.width,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
            boxShadow:   [
              BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 4,
                  spreadRadius: 1)
            ]
        ),
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child:  SubjectResultDetails(exam: exam),
        ),
      ),
    );
  }
}
