import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/di/di.dart';
import 'package:quizz_app/feature/exam/domain/entities/exam_question_entity.dart';
import 'package:quizz_app/feature/exam/presentation/manager/questions_screen_manager/questions_view_model.dart';
import '../widgets/questions_screen__widgets/quesions_screen_app_bar.dart';
import '../widgets/questions_screen__widgets/question_answers_view_bloc.dart';

class QuestionsScreen extends StatelessWidget {
  List<ExamQuestionsEntity> questions;
  final int examDuration;
  QuestionsScreen({super.key, required this.questions, required this.examDuration});

  final viewModel = getIt.get<QuestionsScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context){
        viewModel.chooseAnswer.clear();
        viewModel.setCurrentExamId(questions[0].exam!.examId!);
        log("in question screen ui ${questions[0].exam!.examId}");
        return viewModel;
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              children: <Widget>[
                 QuesionsScreenAppBar(viewModel: viewModel,list: questions,examDuration: examDuration,),
                const SizedBox(
                  height: 20,
                ),
                QuestionAnswersViewBloc(questions: questions),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
