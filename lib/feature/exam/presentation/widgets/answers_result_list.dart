import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/core/resources/colors.dart';
import 'package:quizz_app/feature/exam/domain/entities/answers_cached_entity.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/answer_reuslt_card.dart';

class AnswersResultList extends StatelessWidget {
  final AnswerCachedEntity answerCachedEntity;

  const AnswersResultList({super.key, required this.answerCachedEntity});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.white,
              boxShadow: const [
                BoxShadow(
                  color: AppColors.grey10,
                  blurRadius: 5,
                  spreadRadius: 4,
                )
              ]
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: answerCachedEntity.answers!.length,
              itemBuilder: (context, index) {
                Color border = AppColors.lightBlue;
                if(answerCachedEntity.answers![index].key == answerCachedEntity.correctKey){
                  border = Colors.green;
                }
                else if(answerCachedEntity.answers![index].key == answerCachedEntity.userChoiceKey && answerCachedEntity.correctKey != answerCachedEntity.userChoiceKey){
                  border = AppColors.error;
                }
                return AnswerReusltCard(
                    answer: answerCachedEntity.answers![index].answer!, borderColor: border);
              },),
          ),
        )
    );
  }
}
