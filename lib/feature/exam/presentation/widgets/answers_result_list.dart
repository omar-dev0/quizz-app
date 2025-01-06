import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizz_app/core/di/di.dart';
import 'package:quizz_app/core/resources/colors.dart';
import 'package:quizz_app/feature/exam/domain/entities/answers_cached_entity.dart';
import 'package:quizz_app/feature/exam/presentation/manager/result_screen_details/result_screen_viewmodel.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/answer_reuslt_card.dart';

class AnswersResultList extends StatelessWidget {
  final AnswerCachedEntity answerCachedEntity;
  final String? question;
  final int questionIndex;
  const AnswersResultList(
      {super.key, required this.answerCachedEntity, required this.question,required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ResultDetailsViewModel>();
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(bottom: 2, top: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.white,
              boxShadow: const [
                BoxShadow(
                  color: AppColors.grey10,
                  blurRadius: 5,
                  spreadRadius: 4,
                )
              ]),
          child: Column(
            children: [
              Text(
                answerCachedEntity.question!,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(
                height: 12.h,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: answerCachedEntity.answers!.length,
                itemBuilder: (context, index) {
                  Color border = AppColors.lightBlue;
                  Color background = AppColors.lightBlue;
                  if (answerCachedEntity.answers![index].key ==
                      answerCachedEntity.correctKey) {
                    border = Colors.green;
                    background = AppColors.lightGreen;
                    if(answerCachedEntity.answers![index].key == answerCachedEntity.userChoiceKey){
                      viewModel.selectedAnswers[questionIndex] = index;
                    }
                  } else if (answerCachedEntity.answers![index].key ==
                          answerCachedEntity.userChoiceKey &&
                      answerCachedEntity.correctKey !=
                          answerCachedEntity.userChoiceKey) {
                    border = AppColors.error;
                    background = AppColors.lightRed;
                    viewModel.selectedAnswers[questionIndex] = index;
                  }
                  return AnswerReusltCard(
                    answer: answerCachedEntity.answers![index].answer!,
                    borderColor: border,
                    backGroundColor: background,
                    questionIndex: questionIndex,
                    answerIndex: index,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
