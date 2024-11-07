import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/extensions/build_context_extensions.dart';

import '../../../../../core/resources/assets_manger.dart';
import '../../../../../core/resources/colors.dart';
import '../../manager/subject_exam_manager/exams_view_model.dart';

class SubjectExamDetails extends StatelessWidget {
  const SubjectExamDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final examViewModel = context.read<ExamsViewModel>();
    int currentExamIndex = examViewModel.getCurrentExamIndex();
    return Row(
      children: [
        Image.asset(ImageAssets.examItemImage,height: 71, width: 60,),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: context.width * .63,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    examViewModel.actionHandler.list[currentExamIndex].title!,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                  "${examViewModel.actionHandler.list[currentExamIndex].duration.toString()} Minutes",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: AppColors.primary),
                  )
                ],
              ),
            ),
            Text(
             "${examViewModel.actionHandler.list[currentExamIndex].numberOfQuestions.toString()} Question",
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(
              height: 12,
            ),
            Text("From: 14     To: 6:00",
                style: Theme.of(context).textTheme.bodySmall)
          ],
        ),
      ],
    );
  }
}
