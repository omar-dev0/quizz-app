import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/exam/presentation/manager/exam_start_screen_manager/exam_start_screen_actions.dart';
import 'package:quizz_app/feature/exam/presentation/manager/exam_start_screen_manager/exam_start_screen_states.dart';

import '../../../domain/use_cases/usecases.dart';

@injectable
class ExamStartScreenViewModel extends Cubit<ExamStartScreenState> {
  UseCases _useCase;
  ExamStartScreenViewModel(this._useCase) : super(InitialState());

  void doAction(ExamStartScreenActions action){
    switch (action) {
      case GetExamByIdAction():
        emit(ExamLoadingState());
        _getExamQuestions(action.examId);
        break;
      case NavigateToExamScreenAction():
        emit(NavigateToExamStartScreenState(action.questions,action.duration));
    }
  }

  void _getExamQuestions(String examId) async {
    var response = await _useCase.invokeExamQuestions(examId);
    response.fold((error){
      emit(ExamFailState(error.message));
    }, (questions){
      emit(SuccessGetExamState(questions));
    });
  }
}
