import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/di/di.dart';
import 'package:quizz_app/core/resources/colors.dart';
import 'package:quizz_app/feature/exam/domain/entities/exam_question_entity.dart';
import 'package:quizz_app/feature/exam/presentation/manager/questions_screen_manager/questions_screen_actions.dart';
import 'package:quizz_app/feature/exam/presentation/manager/questions_screen_manager/questions_view_model.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/questions_screen__widgets/custom_button.dart';
import '../widgets/questions_screen__widgets/quesions_screen_app_bar.dart';
import '../widgets/questions_screen__widgets/question_answers_view.dart';

class QuestionsScreen extends StatelessWidget {
  List<ExamQuestionsEntity> questions;

  QuestionsScreen({super.key, required this.questions});

  final viewModel = getIt.get<QuestionsScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              children: <Widget>[
                const QuesionsScreenAppBar(),
                const SizedBox(
                  height: 20,
                ),
                QuestionAnswersView(questions: questions,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      text: "Back",
                      buttonColor: AppColors.white,
                      textColor: AppColors.primary,
                      onPress: (){
                        viewModel.doAction(GoToPreviousQuestionAction());
                      },
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    CustomButton(
                      text: "Next",
                      buttonColor: AppColors.primary,
                      textColor: AppColors.white,
                      onPress: (){
                        viewModel.doAction(GoToNextQuestionAction(questions.length.toString()));
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
