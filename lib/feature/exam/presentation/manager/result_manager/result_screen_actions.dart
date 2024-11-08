sealed class ResultScreenActions{}

class GetResultExamByIdAction extends ResultScreenActions{
  String examId;
  GetResultExamByIdAction(this.examId);
}