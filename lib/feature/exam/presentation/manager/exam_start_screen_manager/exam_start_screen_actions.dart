sealed class ExamStartScreenActions{}

class GetExamByIdAction extends ExamStartScreenActions{
  String examId;
  GetExamByIdAction(this.examId);
}
class NavigateToExamScreenActin <T> extends ExamStartScreenActions{
  T examQuestions;
  NavigateToExamScreenActin(this.examQuestions);
}