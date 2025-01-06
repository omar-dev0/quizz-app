import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/bloc_observer/simple_bloc_observer.dart';
import 'package:quizz_app/feature/exam/presentation/manager/result_manager/result_scree_view_model.dart';
import 'package:quizz_app/feature/exam/presentation/manager/result_screen_details/result_screen_viewmodel.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/answers_result_list.dart';

import '../../../../core/resources/colors.dart';

class AnswerReusltCard extends StatelessWidget {
  final String answer;
  final Color borderColor;
  final Color backGroundColor;
  final int questionIndex;
  final int answerIndex;
  const AnswerReusltCard({super.key, required this.answer, required this.borderColor,required this.backGroundColor,required this.questionIndex,required this.answerIndex});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ResultDetailsViewModel>();
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 12,bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backGroundColor,
        border: Border.all(
          color: borderColor
        )
      ),
      child: Row(
        children: [
          Radio<int>(
            activeColor: borderColor,
            value: answerIndex, groupValue:viewModel.selectedAnswers[questionIndex], onChanged: (value) {},
          ),
          Flexible(child: Text(answer, style: const TextStyle(fontSize: 14,fontWeight: FontWeight.normal),overflow:TextOverflow.ellipsis,softWrap: true,maxLines: 2,)),
        ],
      ),
    );
  }
}
