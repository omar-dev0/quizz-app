sealed class ExamsScreenActions{}
class GetExamsBySubjectIdAction extends ExamsScreenActions{
  String subjectId;
  GetExamsBySubjectIdAction(this.subjectId);
}

class NavigateToStartExamScreenAction<T> extends ExamsScreenActions{
  T examId;
  NavigateToStartExamScreenAction(this.examId);
}