import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/feature/exam/domain/entities/cached_exam_result_entity.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/exam_result_item_cartd.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/questions_result_bloc.dart';


class ResultListView extends StatelessWidget {
  List<CachedExamResultEntity> list;

  ResultListView({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 42),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ExamResultItemCartd(
                  exam: list[index],
                );
              },
            ),
          ),
          const QuestionsResultBloc()
        ],
      ),
    );
  }
}
