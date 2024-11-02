
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
  dynamic questions;
  NavigateToExamStartScreenState(this.questions);
}