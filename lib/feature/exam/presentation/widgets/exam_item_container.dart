import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/core/extensions/build_context_extensions.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/subject_exam_details.dart';



class ExamItemContainer extends StatelessWidget {
  const ExamItemContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child:  const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
         child:  SubjectExamDetails(),
      ),
    );
  }
}
