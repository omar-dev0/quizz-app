
import '../../../domain/entities/cached_exam_result_entity.dart';

class QuestionsScreenStates{}
class InitialState extends QuestionsScreenStates{}
class CorrectAnswerState extends QuestionsScreenStates{}
class WrongAnswerState extends QuestionsScreenStates{}
class GoToNextQuestionState extends QuestionsScreenStates{}
class GoToPreviousQuestionState extends QuestionsScreenStates{}
class FinishedExamState extends QuestionsScreenStates{
  int correct;
  int notCorrect;
  CachedExamResultEntity lastExam;
  FinishedExamState(this.correct, this.notCorrect,this.lastExam);
}
class SingleChoiceQuestionState extends QuestionsScreenStates{}
class MultipleChoiceQuestionState extends QuestionsScreenStates{}
class ShowExamResultState extends QuestionsScreenStates{

}

class LastQuestionState extends QuestionsScreenStates{}
class ResetExamState extends QuestionsScreenStates{}
