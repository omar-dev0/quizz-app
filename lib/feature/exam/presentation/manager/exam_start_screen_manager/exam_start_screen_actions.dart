sealed class ExamStartScreenActions{}

class GetExamByIdAction extends ExamStartScreenActions{
  String examId;

  GetExamByIdAction(this.examId);
}
class NavigateToExamScreenAction extends ExamStartScreenActions{
  dynamic questions;
  int duration;
  NavigateToExamScreenAction(this.questions, this.duration);
}