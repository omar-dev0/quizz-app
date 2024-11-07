
import 'package:quizz_app/feature/exam/domain/entities/exam_question_entity.dart';

class ExamStartScreenState{}
class InitialState extends ExamStartScreenState{}
class ExamLoadingState extends ExamStartScreenState{}
class SuccessGetExamState<T>extends ExamStartScreenState{
  T questions;
  SuccessGetExamState(this.questions);
}

class ExamFailState extends ExamStartScreenState{
  String message;
  ExamFailState(this.message);
}

class NavigateToExamStartScreenState extends ExamStartScreenState{
  List<ExamQuestionsEntity> questions;
  int duration;
  NavigateToExamStartScreenState(this.questions, this.duration);
}