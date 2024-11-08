import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/exam/domain/entities/exam_question_entity.dart';
import 'package:quizz_app/feature/exam/domain/use_cases/usecases.dart';
import 'package:quizz_app/feature/exam/presentation/manager/result_manager/result_screen_actions.dart';
import 'package:quizz_app/feature/exam/presentation/manager/result_manager/result_screen_states.dart';

@injectable
class ResultScreenViewModel extends Cubit<ResultScreenStates> {
  UseCases _useCases;

  ResultScreenViewModel(this._useCases) : super(InitialState());
  List<ExamQuestionsEntity> list = [];

  void _getExam() async {
    var response = await _useCases.invokeExamById();
    response.fold((fail) {
      emit(FailState(fail));
    }, (exam) {
      emit(SuccessState(exam));
    });
  }

  void _getExamQuestion(String id) async {
    var response = await _useCases.invokeExamQuestions(id);
    response.fold((left) {}, (questions) {
      list = questions;
    });
  }

  void doActions(ResultScreenActions action) {
    switch (action) {
      case GetResultExamByIdAction():
        emit(LoadingState());
        _getExam();
        break;
      case GetExamQuestionsAction():
        _getExamQuestion(action.examId);
        break;
      case NavigateToExamResultAction():
        emit(NavigateToResultScreenState());
    }
  }
}
