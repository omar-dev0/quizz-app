import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quizz_app/feature/exam/presentation/manager/view_model.dart';

import '../../../../core/di/di.dart';

class SubjectExamsScreen extends StatelessWidget {
  int subjectIndex ;
   SubjectExamsScreen({super.key, required this.subjectIndex});

  HomeViewModel homeViewModel = getIt.get<HomeViewModel>();

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: Text("Languages", style: Theme.of(context).textTheme.labelLarge,),
        leading: null,
      )
    );
  }
}
