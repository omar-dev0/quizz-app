import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/di/di.dart';
import 'package:quizz_app/feature/exam/presentation/manager/result_manager/result_scree_view_model.dart';
import 'package:quizz_app/feature/exam/presentation/manager/result_manager/result_screen_actions.dart';

class ResulteFragment extends StatelessWidget {
   ResulteFragment({super.key});


  var viewModel = getIt.get<ResultScreenViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context){
        viewModel.doActions(GetResultExamByIdAction());
        return viewModel;
      },
      child: const Scaffold(
        body: Center(child: Text("Result"),),
      ),
    );
  }
}
