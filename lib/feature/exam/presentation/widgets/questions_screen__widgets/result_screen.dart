import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:quizz_app/core/extensions/build_context_extensions.dart';
import 'package:quizz_app/core/resources/colors.dart';

class ResultScreen extends StatelessWidget {
  final int correctAnswers;
  final int wrongAnswers;

  const ResultScreen(
      {super.key, required this.correctAnswers, required this.wrongAnswers});

  @override
  Widget build(BuildContext context) {
    double percent = (1.0 * correctAnswers / (correctAnswers + wrongAnswers));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        Text(
          "Your Score",
          style: Theme.of(context).textTheme.labelLarge,
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 24,
        ),
        SizedBox(
          child: Row(
            children: [
              CircularPercentIndicator(
                animation: true,
                radius: 90,
                lineWidth: 6,
                percent: percent,
                center: Text(
                  "${(percent * 100).toInt()}%",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                progressColor: AppColors.primary,
                backgroundColor: AppColors.error,
              ),
              const SizedBox(
                width: 23,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        const Text(
                          "Correct",
                          style: TextStyle(color: AppColors.primary),
                        ),
                        const SizedBox(
                          width: 64,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.primary)),
                          child: Text(
                            correctAnswers.toString(),
                            style: const TextStyle(color: AppColors.primary),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        const Text(
                          "Incorrect",
                          style: TextStyle(color: AppColors.error),
                        ),
                        const SizedBox(
                          width: 56,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.error)),
                          child: Text(
                            wrongAnswers.toString(),
                            style: const TextStyle(color: AppColors.error),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 80,
        ),
        SizedBox(
          width: context.width,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "Show results",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: AppColors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        SizedBox(
          width: context.width,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.white,
                side: const BorderSide(color: AppColors.primary)),
            child: Text(
              "Start again",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: AppColors.primary),
            ),
          ),
        ),
      ],
    );
  }
}
