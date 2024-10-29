import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/exam/domain/use_cases/home_usecase.dart';
import 'package:quizz_app/feature/exam/presentation/manager/home_managers/action_handler.dart';
import 'package:quizz_app/feature/exam/presentation/manager/subject_exam_manager/exams_screen_action.dart';
import 'package:quizz_app/feature/exam/presentation/manager/subject_exam_manager/exams_screen_action_handler.dart';
import 'package:quizz_app/feature/exam/presentation/manager/subject_exam_manager/exams_screen_states.dart';

@injectable
class ExamsViewModel extends Cubit<ExamsScreenStates>{
  late ExamsScreenActionHandler actionHandler;
  ExamsViewModel(UseCase useCase) : super(ExamsInitialState()){
    actionHandler = ExamsScreenActionHandler(this, useCase);
  }

  void emitState(ExamsScreenStates state){
    emit(state);
  }

  void doAction(ExamsScreenActions action){
    actionHandler.handelActions(action);
  }
}