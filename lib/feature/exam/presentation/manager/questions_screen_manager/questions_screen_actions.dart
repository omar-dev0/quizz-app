sealed class QuestionsScreenActions{}
class SelectAnswerAction extends QuestionsScreenActions{
  String answerKey;
  SelectAnswerAction(this.answerKey);
}
class GoToNextQuestionAction extends QuestionsScreenActions{
   int questions;
   GoToNextQuestionAction(this.questions);
}
class GoToPreviousQuestionAction extends QuestionsScreenActions{}
class SubmitExamAction<T> extends QuestionsScreenActions{
  T data;
  SubmitExamAction(this.data);
}
class GetQuestionTypeAction extends QuestionsScreenActions{
  String type;
  GetQuestionTypeAction(this.type);
}
class ResetExamAction extends QuestionsScreenActions{}