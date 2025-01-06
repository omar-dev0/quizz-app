import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/result_list_view.dart';

import '../../../../core/di/di.dart';
import '../manager/result_manager/result_scree_view_model.dart';
import '../manager/result_manager/result_screen_actions.dart';
import '../manager/result_manager/result_screen_states.dart';

class ResulteFragment extends StatelessWidget {
   ResulteFragment({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ResultScreenViewModel>();
    viewModel.doActions(GetResultExamByIdAction());
    return Scaffold(
        body: BlocBuilder<ResultScreenViewModel, ResultScreenStates>(
          builder: (context, state) {
              if(state is SuccessState) {
                return FadeInUp(child: ResultListView(list: viewModel.examList));
              }
              viewModel.doActions(GetResultExamByIdAction());
              return const Center(child: CircularProgressIndicator());
          },
        ),
    );
  }
}
