import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/resources/colors.dart';
import 'package:quizz_app/feature/exam/presentation/manager/subject_exam_manager/exams_screen_action.dart';
import 'package:quizz_app/feature/exam/presentation/manager/subject_exam_manager/exams_view_model.dart';

import 'exam_item_container.dart';

class SubjectExamItem extends StatelessWidget {
  final String subjectId;
  const SubjectExamItem({super.key, required this.subjectId});

  @override
  Widget build(BuildContext context) {
    final examsViewModel = context.read<ExamsViewModel>();
    examsViewModel.doAction(GetExamsBySubjectIdAction(subjectId));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          Text(
            "English",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.black, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 24,),
          const ExamItemContainer(),
          const ExamItemContainer(),
          const ExamItemContainer(),
        ],
      ),
    );
  }
}
