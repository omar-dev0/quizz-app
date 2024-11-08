import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/extensions/build_context_extensions.dart';
import 'package:quizz_app/feature/exam/domain/entities/cached_exam_result_entity.dart';
import 'package:quizz_app/feature/exam/presentation/manager/result_manager/result_scree_view_model.dart';
import 'package:quizz_app/feature/exam/presentation/manager/result_manager/result_screen_actions.dart';
import 'package:quizz_app/feature/exam/presentation/manager/result_manager/result_screen_states.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/subject_result_details.dart';

import 'exam_result_details.dart';

class ExamResultItemCartd extends StatelessWidget {
  final CachedExamResultEntity exam;

  const ExamResultItemCartd({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ResultScreenViewModel>();
    return Column(
      children: [
        InkWell(
          onTap: () {
            viewModel.doActions(NavigateToExamResultAction());
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            height: 103,
            width: context.width,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 4,
                      spreadRadius: 1)
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: SubjectResultDetails(exam: exam),
            ),
          ),
        ),
        BlocListener<ResultScreenViewModel, ResultScreenStates>(
          listener: (context, state) {
            // viewModel.doActions(GetExamQuestionsAction(exam.id!));
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=> ExamResultDetails(examResultEntity: exam)));
          },
          child: const SizedBox.shrink(),
        ),
      ],
    );
  }
}
