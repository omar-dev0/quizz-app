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
class SubmitExamAction extends QuestionsScreenActions{}