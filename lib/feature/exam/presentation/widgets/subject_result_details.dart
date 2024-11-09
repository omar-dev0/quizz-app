import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/core/extensions/build_context_extensions.dart';

import '../../../../core/resources/assets_manger.dart';
import '../../../../core/resources/colors.dart';
import '../../domain/entities/cached_exam_result_entity.dart';

class SubjectResultDetails extends StatelessWidget {
  final CachedExamResultEntity exam;
  const SubjectResultDetails({super.key, required this.exam});


  @override
  Widget build(BuildContext context) {
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
                    exam.exam!.title!,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    "${exam.exam!.duration.toString()} Minutes",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: AppColors.primary),
                  )
                ],
              ),
            ),
            Text(
              "${exam.exam!.numberOfQuestions.toString()} Question",
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
