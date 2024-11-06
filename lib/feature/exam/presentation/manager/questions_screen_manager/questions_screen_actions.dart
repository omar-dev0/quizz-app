sealed class QuestionsScreenActions{}
class SelectAnswerAction extends QuestionsScreenActions{
  String answerKey;
  SelectAnswerAction(this.answerKey);
}
class GoToNextQuestionAction extends QuestionsScreenActions{}
class GoToPreviousQuestionAction extends QuestionsScreenActions{}