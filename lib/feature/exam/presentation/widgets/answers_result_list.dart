import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/feature/exam/domain/entities/answers_cached_entity.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/answer_reuslt_card.dart';

class AnswersResultList extends StatelessWidget {
  final AnswerCachedEntity answerCachedEntity;

  const AnswersResultList({super.key, required this.answerCachedEntity});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
          itemCount: answerCachedEntity.answers!.length,
          itemBuilder: (context, index) {
            Color border = (answerCachedEntity.answers![index].key ==
                answerCachedEntity.correctKey &&
                answerCachedEntity.userChoiceKey ==
                    answerCachedEntity.correctKey) ? Colors.green : Colors.red
            ;
            return AnswerReusltCard(
                answer: answerCachedEntity.answers![index].answer!, borderColor: border,);
          },)
    );
  }
}
