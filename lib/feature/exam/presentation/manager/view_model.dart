
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/exam/domain/use_cases/home_usecase.dart';
import 'package:quizz_app/feature/exam/presentation/manager/action_handler.dart';
import 'package:quizz_app/feature/exam/presentation/manager/home_screen_actions.dart';
import 'package:quizz_app/feature/exam/presentation/manager/home_screen_states.dart';

@injectable
class HomeViewModel extends Cubit<HomeScreenStates>{
  late final ActionHandler actionHandler;
  late int _currentSubjectListIndex;
  int _currentFragmentIndex = 0;
  HomeViewModel(HomeUseCase homeUseCase) : super(InitialState()){
     actionHandler = ActionHandler(homeUseCase, this);
  }

  void setCurrentFragmentIndex(int index){
    _currentFragmentIndex = index;
  }
  int getCurrentFragmentIndex(){
    return _currentFragmentIndex;
  }
  void setCurrentSubjectListIndex(int index){
    _currentSubjectListIndex = index;
  }

  int getCurrentSubjectListIndex(){
    return _currentSubjectListIndex;
  }

  void emitStat(HomeScreenStates state){
    emit(state);
  }

  void doAction(HomeActions action){
    actionHandler.handelActions(action);
  }
}

