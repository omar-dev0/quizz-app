import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/feature/exam/presentation/manager/subject_exam_manager/exams_view_model.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/subject_exams_widget/exam_item_container.dart';

class ExamsListView extends StatelessWidget {
  const ExamsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final examsViewModel = context.read<ExamsViewModel>();
    return Expanded(
      child: ListView.builder(
        itemCount: examsViewModel.actionHandler.list.length,
          itemBuilder: (context, index) {
          examsViewModel.setCurrentExamIndex(index);
        return const ExamItemContainer();
      }),
    );
  }
}
