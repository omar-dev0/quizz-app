
import 'package:flutter/material.dart';
import 'package:quizz_app/feature/exam/presentation/manager/home_managers/view_model.dart';


class SubjectExamsScreen extends StatelessWidget {
  int subjectIndex;
  final HomeViewModel homeViewModel;
   SubjectExamsScreen({super.key, required this.subjectIndex, required this.homeViewModel});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(homeViewModel.actionHandler.subjectsList[subjectIndex].name!, style: Theme.of(context).textTheme.labelLarge,),
        leading: null,
      )
    );
  }
}
