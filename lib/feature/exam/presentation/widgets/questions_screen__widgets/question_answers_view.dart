import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/feature/exam/domain/entities/exam_question_entity.dart';
import 'package:quizz_app/feature/exam/presentation/manager/questions_screen_manager/questions_screen_states.dart';
import 'package:quizz_app/feature/exam/presentation/manager/questions_screen_manager/questions_view_model.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/questions_screen__widgets/answers.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/questions_screen__widgets/choice_item_card.dart';
import '../../../../../core/resources/colors.dart';
import 'linear_progress_bar.dart';

class QuestionAnswersView extends StatefulWidget {
  List<ExamQuestionsEntity> questions;

  QuestionAnswersView({super.key, required this.questions});

  @override
  State<QuestionAnswersView> createState() => _QuestionAnswersViewState();
}

class _QuestionAnswersViewState extends State<QuestionAnswersView> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<QuestionsScreenViewModel>();
    return BlocListener<QuestionsScreenViewModel, QuestionsScreenStates>(
      listener: (context, state) {
        if (state is GoToPreviousQuestionState ||
            state is GoToNextQuestionState ) {
          setState(() {

          });
        }
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Question ${viewModel.getCurrentQuestion() + 1} of ${widget
                    .questions.length}",
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
            widget.questions[viewModel.getCurrentQuestion()].question ?? "",
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
          Answers(questions: widget.questions),
          const SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
