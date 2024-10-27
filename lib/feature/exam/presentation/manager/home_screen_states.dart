class HomeScreenStates{}


class InitialState extends HomeScreenStates{}
class LoadingState extends HomeScreenStates{}
class SuccessState extends HomeScreenStates{}
class FailState extends HomeScreenStates{
  String message;
  FailState(this.message);
}
class ChangeHomeCurrentFragmentState extends HomeScreenStates{}

class NavigateToSubjectExamsState extends HomeScreenStates{}
