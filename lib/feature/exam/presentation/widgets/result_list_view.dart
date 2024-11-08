import 'package:flutter/cupertino.dart';
import 'package:quizz_app/feature/exam/domain/entities/cached_exam_result_entity.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/exam_result_item_cartd.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/subject_exams_widget/exam_item_container.dart';

class ResultListView extends StatelessWidget {
  List<CachedExamResultEntity> list;
   ResultListView({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: list.length,
          itemBuilder: (context,index){
             return  ExamResultItemCartd(exam: list[index],);
          },),
    );
  }
}
