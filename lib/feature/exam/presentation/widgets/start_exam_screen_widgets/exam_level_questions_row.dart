import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/colors.dart';

class ExamLevelQuestionsRow extends StatelessWidget {
  final int numberOfQuestions;
  const ExamLevelQuestionsRow({super.key, required this.numberOfQuestions});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Level",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppColors.black),
        ),
        const SizedBox(width: 8,),
        Container(
          height: 20,
          width: 1,
          decoration: const BoxDecoration(
            color: AppColors.black
          ),
        ),
        const SizedBox(width: 8,),
        Text(
          "$numberOfQuestions Question",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColors.grey),
        ),
      ],
    );
  }
}
