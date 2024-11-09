import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/result_list_view.dart';

import '../../../../core/di/di.dart';
import '../manager/result_manager/result_scree_view_model.dart';
import '../manager/result_manager/result_screen_actions.dart';
import '../manager/result_manager/result_screen_states.dart';

class ResulteFragment extends StatelessWidget {
  const ResulteFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ResultScreenViewModel>()..doActions(GetResultExamByIdAction()),
      child: Scaffold(
        body: BlocBuilder<ResultScreenViewModel, ResultScreenStates>(
          builder: (context, state) {
            if (state is SuccessState) {
              return ResultListView(list: state.exam);
            }
            return const Center(child: Text("Result"));
          },
        ),
      ),
    );
  }
}
