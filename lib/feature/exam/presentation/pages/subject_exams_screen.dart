import 'package:flutter/material.dart';
import 'package:quizz_app/feature/exam/presentation/manager/home_managers/view_model.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/subject_exam_item.dart';

class SubjectExamsScreen extends StatelessWidget {
  int subjectIndex;
  final HomeViewModel homeViewModel;

  SubjectExamsScreen(
      {super.key, required this.subjectIndex, required this.homeViewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: const SubjectExamItem(),
    );
  }
}
