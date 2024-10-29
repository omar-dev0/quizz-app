sealed class ExamsScreenActions{}
class GetExamsBySubjectIdAction extends ExamsScreenActions{
  String subjectId;
  GetExamsBySubjectIdAction(this.subjectId);
}