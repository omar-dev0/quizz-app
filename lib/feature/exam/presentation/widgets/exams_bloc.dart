import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quizz_app/core/extensions/build_context_extensions.dart';
import 'package:quizz_app/feature/exam/presentation/manager/subject_exam_manager/exams_screen_states.dart';
import 'package:quizz_app/feature/exam/presentation/manager/subject_exam_manager/exams_view_model.dart';
import 'package:quizz_app/feature/exam/presentation/pages/exam_start_screen.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/exam_item_container.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/exams_list_view.dart';

import '../../../../core/resources/colors.dart';

class ExamsBloc extends StatelessWidget {
  const ExamsBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExamsViewModel, ExamsScreenStates>(
        builder: (context, state) {
          if(state is ExamsSuccessState){
            return const ExamsListView();
          }else if(state is ExamsFailState){
            Fluttertoast.showToast(
              msg: state.failMessage,
              backgroundColor: AppColors.error,
              textColor: AppColors.white,
              toastLength: Toast.LENGTH_SHORT,
            );
          }else{
            return SizedBox(
              height: 200,
              width: context.width,
              child: const Center(
                child: SpinKitFadingCircle(
                  color: AppColors.primary,
                ),
              ),
            );
          }
          return const ExamItemContainer();
        }, listener: (context, state) {
          if(state is NavigateToStartExamScreenState){
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const ExamStartScreen()));
          }
    }
    );
  }
}
