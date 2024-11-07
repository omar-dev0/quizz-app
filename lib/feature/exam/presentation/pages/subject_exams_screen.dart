import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/feature/exam/presentation/manager/home_managers/view_model.dart';
import 'package:quizz_app/feature/exam/presentation/manager/subject_exam_manager/exams_view_model.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/subject_exam_item.dart';

import '../../../../core/di/di.dart';

class SubjectExamsScreen extends StatelessWidget {
  int subjectIndex;
  final HomeViewModel homeViewModel;

  SubjectExamsScreen(
      {super.key, required this.subjectIndex, required this.homeViewModel});

  ExamsViewModel examsViewModel = getIt.get<ExamsViewModel>();
  @override
  Widget build(BuildContext context) {
    String subjectId =  homeViewModel.actionHandler.subjectsList[subjectIndex].id!;
    String subjectName =  homeViewModel.actionHandler.subjectsList[subjectIndex].name!;
    return BlocProvider(
      create: (_)=> examsViewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Language",
            style: Theme
                .of(context)
                .textTheme
                .labelLarge,
          ),
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new),),
        ),
        body:  SubjectExamItem(subjectId:subjectId, subjectName: subjectName,),
      ),
    );
  }
}
