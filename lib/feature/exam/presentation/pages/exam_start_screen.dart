import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/di/di.dart';
import 'package:quizz_app/core/extensions/build_context_extensions.dart';
import 'package:quizz_app/feature/exam/domain/entities/exam_entity.dart';
import 'package:quizz_app/feature/exam/presentation/manager/exam_start_screen_manager/exam_start_screen_actions.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/start_exam_screen_widgets/exam_image_title_row.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/start_exam_screen_widgets/exam_level_questions_row.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/start_exam_screen_widgets/exam_start_screen_bloc.dart';
import '../../../../core/resources/colors.dart';
import '../manager/exam_start_screen_manager/exam_start_view_model.dart';

class ExamStartScreen extends StatelessWidget {
  final ExamEntity exam;

  ExamStartScreen({super.key, required this.exam});

  final viewModel = getIt.get<ExamStartScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: Scaffold(
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
              const Text("     Lorem ipsum dolor sit amet consectetur."),
              const Text("     Lorem ipsum dolor sit amet consectetur."),
              const Text("     Lorem ipsum dolor sit amet consectetur."),
              const Text("     Lorem ipsum dolor sit amet consectetur."),
              const SizedBox(
                height: 48,
              ),
              SizedBox(
                width: context.width,
                child: ElevatedButton(
                  onPressed: () {
                    viewModel.doAction(GetExamByIdAction(exam.examId!));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
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
              ExamStartScreenBloc(
                examId: exam.examId!,
              )
            ],
          ),
        ),
      ),
    );
  }
}
