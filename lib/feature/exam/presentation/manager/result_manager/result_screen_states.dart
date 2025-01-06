import 'package:quizz_app/feature/exam/domain/entities/cached_exam_result_entity.dart';

class ResultScreenStates{}
class InitialState extends ResultScreenStates{}
class SuccessState extends ResultScreenStates{
  List<CachedExamResultEntity> exam;
  SuccessState(this.exam);
}
class FailState extends ResultScreenStates{
  String message;
  FailState(this.message);
}

class LoadingState extends ResultScreenStates{}

class NavigateToResultScreenState extends ResultScreenStates{
  CachedExamResultEntity exam;
  NavigateToResultScreenState(this.exam);
}
class GetExamAnswersState extends ResultScreenStates{

}
class GoToResultScreenState extends ResultScreenStates{}