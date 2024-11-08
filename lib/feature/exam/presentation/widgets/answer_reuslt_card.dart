import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/feature/exam/presentation/manager/result_manager/result_scree_view_model.dart';

class AnswerReusltCard extends StatelessWidget {
  final String answer;
  final Color borderColor;
  const AnswerReusltCard({super.key, required this.answer, required this.borderColor});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ResultScreenViewModel>();
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor
        )
      ),
      child: Text(answer),
    );
  }
}
