sealed class QuestionsScreenActions{}
class SelectAnswerAction extends QuestionsScreenActions{
  String answerKey;
  SelectAnswerAction(this.answerKey);
}
class GoToNextQuestionAction extends QuestionsScreenActions{
  String? questions;
  GoToNextQuestionAction(this.questions);
}
class GoToPreviousQuestionAction extends QuestionsScreenActions{}