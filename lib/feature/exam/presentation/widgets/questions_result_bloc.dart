import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/result_manager/result_scree_view_model.dart';
import '../manager/result_manager/result_screen_states.dart';
import 'exam_result_details.dart';

class QuestionsResultBloc extends StatelessWidget {
  const QuestionsResultBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResultScreenViewModel, ResultScreenStates>(
      listener: (context, state) {
        if (state is NavigateToResultScreenState) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => ExamResultDetails(examResultEntity: state.exam)));
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
