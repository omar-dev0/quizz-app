import 'package:quizz_app/feature/exam/domain/entities/cached_exam_result_entity.dart';

sealed class ResultScreenActions{}

class GetResultExamByIdAction extends ResultScreenActions{
}
class GetExamQuestionsAction extends ResultScreenActions{
  String examId;
  GetExamQuestionsAction(this.examId);
}

class NavigateToExamResultAction extends ResultScreenActions{
   CachedExamResultEntity exam;
   NavigateToExamResultAction(this.exam);
}