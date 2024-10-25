import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/feature/exam/presentation/manager/view_model.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/subject_item.dart';

class SubjectsListView extends StatelessWidget {
  const SubjectsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.read<HomeViewModel>();
    return Expanded(
      child: ListView.builder(
        itemCount: homeViewModel.actionHandler.subjectsList.length,
        itemBuilder: (context, index) {
          homeViewModel.setCurrentSubjectListIndex(index);
          return const SubjectItem();
        },
      ),
    );
  }
}
