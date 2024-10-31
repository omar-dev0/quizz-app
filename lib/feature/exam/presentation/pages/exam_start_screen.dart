import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/core/extensions/build_context_extensions.dart';
import 'package:quizz_app/feature/exam/domain/entities/exam_entity.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/start_exam_screen_widgets/exam_image_title_row.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/start_exam_screen_widgets/exam_level_questions_row.dart';
import '../../../../core/resources/colors.dart';

class ExamStartScreen extends StatelessWidget {
  final ExamEntity exam;

  const ExamStartScreen({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new))),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ExamImageTitleRow(examTitle: exam.title!),
                Text(
                  "${exam.duration} Minutes",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.primary),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            ExamLevelQuestionsRow(numberOfQuestions: exam.numberOfQuestions!),
            Container(
              margin: const EdgeInsets.only(top: 16, bottom: 24),
              height: 1,
              width: context.width,
              decoration: const BoxDecoration(color: AppColors.primary),
            ),
            Text(
              "Instruction",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColors.black),
            ),
            Text("     Lorem ipsum dolor sit amet consectetur."),
            Text("     Lorem ipsum dolor sit amet consectetur."),
            Text("     Lorem ipsum dolor sit amet consectetur."),
            Text("     Lorem ipsum dolor sit amet consectetur."),
            SizedBox(
              height: 48,
            ),
            SizedBox(
              width: context.width,
              child: ElevatedButton(
                onPressed: () {

                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:14 ),
                  child: Text(
                    "Start",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
