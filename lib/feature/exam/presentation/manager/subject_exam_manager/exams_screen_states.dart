class ExamsScreenStates{}

class ExamsInitialState extends ExamsScreenStates{}
class ExamsLoadingState extends ExamsScreenStates{}
class ExamsSuccessState extends ExamsScreenStates{}
class ExamsFailState extends ExamsScreenStates{
  String failMessage;
  ExamsFailState(this.failMessage);
}

class NavigateToStartExamScreenState extends ExamsScreenStates{

}