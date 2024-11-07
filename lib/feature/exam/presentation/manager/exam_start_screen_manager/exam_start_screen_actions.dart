sealed class ExamStartScreenActions{}

class GetExamByIdAction extends ExamStartScreenActions{
  String examId;
  GetExamByIdAction(this.examId);
}
class NavigateToExamScreenAction extends ExamStartScreenActions{
  dynamic questions;
  NavigateToExamScreenAction(this.questions);
}