import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/core/extensions/build_context_extensions.dart';

import '../../../../core/resources/colors.dart';

class SubjectExamDetails extends StatelessWidget {
  const SubjectExamDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.import_contacts_sharp),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: context.width * .72,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Level",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    "30 Minutes",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: AppColors.primary),
                  )
                ],
              ),
            ),
            Text(
              "20 question",
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
