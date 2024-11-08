import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              return Center(child: Text(state.exam.length.toString()));
            }
            return Center(child: Text("Result"));
          },
        ),
      ),
    );
  }
}
