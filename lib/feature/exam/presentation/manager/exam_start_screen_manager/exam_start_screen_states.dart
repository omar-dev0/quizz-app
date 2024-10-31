class ExamStartScreenState{}

class ExamLoadingState extends ExamStartScreenState{}
class SuccessGetExamState<T>extends ExamStartScreenState{
  T questions;
  SuccessGetExamState(this.questions);
}

class ExamFailState extends ExamStartScreenState{
  String message;
  ExamFailState(this.message);
}

class NavigateToExamStartScreenState<T> extends ExamStartScreenState{
  T questions;
  NavigateToExamStartScreenState(this.questions);
}