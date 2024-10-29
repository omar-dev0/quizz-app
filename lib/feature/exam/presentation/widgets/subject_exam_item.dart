import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/core/resources/colors.dart';

import 'exam_item_container.dart';

class SubjectExamItem extends StatelessWidget {
  const SubjectExamItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          Text(
            "English",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.black, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 24,),
          const ExamItemContainer(),
          const ExamItemContainer(),
          const ExamItemContainer(),
        ],
      ),
    );
  }
}
