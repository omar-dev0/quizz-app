import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/exam/presentation/manager/subject_exam_manager/exams_screen_action.dart';
import 'package:quizz_app/feature/exam/presentation/manager/subject_exam_manager/exams_screen_action_handler.dart';
import 'package:quizz_app/feature/exam/presentation/manager/subject_exam_manager/exams_screen_states.dart';

import '../../../domain/use_cases/usecases.dart';

@injectable
class ExamsViewModel extends Cubit<ExamsScreenStates>{
  late ExamsScreenActionHandler actionHandler;
  int? _currentExamIndex;
  ExamsViewModel(UseCases useCase) : super(ExamsInitialState()){
    actionHandler = ExamsScreenActionHandler(this, useCase);
  }

  void setCurrentExamIndex(int index){
    _currentExamIndex = index;
  }
  int getCurrentExamIndex() {
    return _currentExamIndex!;
  }
  void emitState(ExamsScreenStates state){
    emit(state);
  }

  void doAction(ExamsScreenActions action){
    actionHandler.handelActions(action);
  }
}