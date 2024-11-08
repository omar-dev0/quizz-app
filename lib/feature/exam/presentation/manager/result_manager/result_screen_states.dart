import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/models/quesions_model/questions_cached_model.dart';
import 'package:quizz_app/feature/exam/domain/entities/exam_entity.dart';

class ResultScreenStates{}
class InitialState extends ResultScreenStates{}
class SuccessState extends ResultScreenStates{
  List<ExamEntity> exam;
  SuccessState(this.exam);
}
class FailState extends ResultScreenStates{
  String message;
  FailState(this.message);
}

class LoadingState extends ResultScreenStates{}