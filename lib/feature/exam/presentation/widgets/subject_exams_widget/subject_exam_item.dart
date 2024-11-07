import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/resources/colors.dart';
import 'package:quizz_app/feature/exam/presentation/manager/subject_exam_manager/exams_screen_action.dart';
import 'package:quizz_app/feature/exam/presentation/manager/subject_exam_manager/exams_view_model.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/subject_exams_widget/exams_bloc.dart';


class SubjectExamItem extends StatelessWidget {
  final String subjectId;
  final String subjectName;
  const SubjectExamItem({super.key, required this.subjectId, required this.subjectName});

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
           subjectName,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.black, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 24,),
          const ExamsBloc()
        ],
      ),
    );
  }
}
