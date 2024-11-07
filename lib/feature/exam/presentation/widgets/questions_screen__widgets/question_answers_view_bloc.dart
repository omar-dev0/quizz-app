import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/feature/exam/domain/entities/exam_question_entity.dart';
import 'package:quizz_app/feature/exam/presentation/manager/questions_screen_manager/questions_screen_states.dart';
import 'package:quizz_app/feature/exam/presentation/manager/questions_screen_manager/questions_view_model.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/questions_screen__widgets/questions_answer_view.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/questions_screen__widgets/result_screen.dart';

class QuestionAnswersViewBloc extends StatelessWidget {
  List<ExamQuestionsEntity> questions;

  QuestionAnswersViewBloc({
    super.key,
    required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<QuestionsScreenViewModel>();
    return BlocBuilder<QuestionsScreenViewModel, QuestionsScreenStates>(
      builder: (context, state) {
        if (state is FinishedExamState) {
          return  ResultScreen(correctAnswers: state.correct, wrongAnswers:  state.notCorrect,);
        }
        return QuestionsAnswerView(questions: questions);
      },
    );
  }
}
