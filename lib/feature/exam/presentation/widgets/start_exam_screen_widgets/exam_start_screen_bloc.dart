import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/feature/exam/presentation/manager/exam_start_screen_manager/exam_start_screen_actions.dart';
import 'package:quizz_app/feature/exam/presentation/manager/exam_start_screen_manager/exam_start_screen_states.dart';
import 'package:quizz_app/feature/exam/presentation/manager/exam_start_screen_manager/exam_start_view_model.dart';
import 'package:quizz_app/feature/exam/presentation/manager/subject_exam_manager/exams_screen_states.dart';

class ExamStartScreenBloc extends StatelessWidget {
  final String examId;

  const ExamStartScreenBloc({super.key, required this.examId});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ExamStartScreenViewModel>();
    return BlocListener<ExamStartScreenViewModel, ExamStartScreenState>(
      listener: (context, state) {
        if (state is SuccessGetExamState) {
          viewModel.doAction(NavigateToExamScreenAction(state.questions));
        } else if (state is ExamLoadingState) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return const AlertDialog(
                  title: Text("Loading..."),
                );
              });
        } else if (state is ExamFailState) {
        } else if (state is NavigateToStartExamScreenState) {}
      },
      listenWhen: (previous, current) {
        if (previous is ExamLoadingState && current is SuccessGetExamState) {
          Navigator.pop(context);
        }
        return true;
      },
    );
  }
}
