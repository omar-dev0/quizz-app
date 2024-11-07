sealed class ExamsScreenActions{}
class GetExamsBySubjectIdAction extends ExamsScreenActions{
  String subjectId;
  GetExamsBySubjectIdAction(this.subjectId);
}

class NavigateToStartExamScreenAction extends ExamsScreenActions{
  String examId;
  NavigateToStartExamScreenAction(this.examId);
}