import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/core/resources/colors.dart';
import 'package:quizz_app/feature/exam/domain/entities/exam_question_entity.dart';
import '../widgets/questions_screen__widgets/choice_item_card.dart';
import '../widgets/questions_screen__widgets/linear_progress_bar.dart';
import '../widgets/questions_screen__widgets/quesions_screen_app_bar.dart';

class QuestionsScreen extends StatelessWidget {
  List<ExamQuestionsEntity> questions;

  QuestionsScreen({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: <Widget>[
              const QuesionsScreenAppBar(),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Question 1 of 20",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              LinearProgressBar(),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Question",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.black,
                    ),
              ),
              const ChoiceItemCard(),
              const ChoiceItemCard(),
              const ChoiceItemCard(),
              const ChoiceItemCard(),
              const SizedBox(
                height: 80,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(),
                    child: Text(
                      "Back",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.primary),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Next",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
