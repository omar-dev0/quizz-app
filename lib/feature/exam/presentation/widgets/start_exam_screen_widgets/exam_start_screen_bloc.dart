import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/feature/exam/presentation/manager/exam_start_screen_manager/exam_start_screen_actions.dart';
import 'package:quizz_app/feature/exam/presentation/manager/exam_start_screen_manager/exam_start_screen_states.dart';
import 'package:quizz_app/feature/exam/presentation/manager/exam_start_screen_manager/exam_start_view_model.dart';
import 'package:quizz_app/feature/exam/presentation/pages/questions_screen.dart';

class ExamStartScreenBloc extends StatelessWidget {
  final String examId;
  final int duration;
  const ExamStartScreenBloc({super.key, required this.examId, required this.duration});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ExamStartScreenViewModel>();
    return BlocListener<ExamStartScreenViewModel, ExamStartScreenState>(
      listener: (context, state) {
        if (state is SuccessGetExamState) {
          viewModel.doAction(NavigateToExamScreenAction(state.questions,duration));
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
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return  AlertDialog(
                  title: Text(state.message),
                );
              });
        } else if (state is NavigateToExamStartScreenState) {
          if(state.questions.isNotEmpty){
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>  QuestionsScreen(questions: state.questions,examDuration: state.duration,)));
          }
        }
      },
      listenWhen: (previous, current) {
        if (previous is ExamLoadingState && current is SuccessGetExamState) {
          Navigator.pop(context);
        }
        return true;
      },
      child: const SizedBox.shrink(),
    );
  }
}
