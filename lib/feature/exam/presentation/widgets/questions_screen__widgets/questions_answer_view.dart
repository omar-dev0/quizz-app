import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/feature/exam/domain/entities/exam_question_entity.dart';
import 'package:quizz_app/feature/exam/presentation/manager/questions_screen_manager/questions_view_model.dart';
import '../../../../../core/resources/colors.dart';
import '../../manager/questions_screen_manager/questions_screen_actions.dart';
import '../../manager/questions_screen_manager/questions_screen_states.dart';
import 'answers.dart';
import 'custom_button.dart';
import 'linear_progress_bar.dart';

class QuestionsAnswerView extends StatelessWidget {
  List<ExamQuestionsEntity> questions;
   QuestionsAnswerView({super.key, required this.questions});
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<QuestionsScreenViewModel>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Question ${viewModel.getCurrentQuestion() + 1} of ${questions.length}",
              style: Theme
                  .of(context)
                  .textTheme
                  .labelMedium,
            ),
          ],
        ),
        const SizedBox(
          height: 3,
        ),
        const LinearProgressBar(),
        const SizedBox(
          height: 24,
        ),
        Text(
         questions[viewModel.getCurrentQuestion()].question ?? "",
          style: Theme
              .of(context)
              .textTheme
              .bodyLarge!
              .copyWith(
            color: AppColors.black,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Answers(questions: questions),
        const SizedBox(
          height: 80,
        ),
        BlocBuilder<QuestionsScreenViewModel,
            QuestionsScreenStates>(
          builder: (context, state) {
            if (state is LastQuestionState) {
              return CustomButton(
                text: "Submit",
                buttonColor: AppColors.primary,
                textColor: AppColors.white,
                onPress: () {
                  viewModel.doAction(
                    SubmitExamAction<List<ExamQuestionsEntity>>(
                        questions),
                  );
                },
              );
            }
            return CustomButton(
              text: "Next",
              buttonColor: AppColors.primary,
              textColor: AppColors.white,
              onPress: () {
                viewModel.doAction(
                  GoToNextQuestionAction(questions.length),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
