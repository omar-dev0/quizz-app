class QuestionsScreenStates{}
class InitialState extends QuestionsScreenStates{}
class CorrectAnswerState extends QuestionsScreenStates{}
class WrongAnswerState extends QuestionsScreenStates{}
class GoToNextQuestionState extends QuestionsScreenStates{}
class GoToPreviousQuestionState extends QuestionsScreenStates{}
class FinishedExamState extends QuestionsScreenStates{}
class SingleChoiceQuestionState extends QuestionsScreenStates{}
class MultipleChoiceQuestionState extends QuestionsScreenStates{}
class ShowExamResultState extends QuestionsScreenStates{
  int correct;
  int notCorrect;
  ShowExamResultState(this.correct, this.notCorrect);
}

class LastQuestionState extends QuestionsScreenStates{}
