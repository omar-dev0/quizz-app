sealed class ResultScreenActions{}

class GetResultExamByIdAction extends ResultScreenActions{
}
class GetExamQuestionsAction extends ResultScreenActions{
  String examId;
  GetExamQuestionsAction(this.examId);
}

class NavigateToExamResultAction extends ResultScreenActions{

}