import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/exam/domain/use_cases/usecases.dart';
import 'package:quizz_app/feature/exam/presentation/manager/result_manager/result_screen_actions.dart';
import 'package:quizz_app/feature/exam/presentation/manager/result_manager/result_screen_states.dart';

@injectable
class ResultScreenViewModel extends Cubit<ResultScreenStates>{
  UseCases _useCases;
  ResultScreenViewModel(this._useCases): super(InitialState());



  void doActions(ResultScreenActions action){
    switch (action) {

      case GetResultExamByIdAction():
        _useCases.invokeExamById(action.examId);
    }
  }
}