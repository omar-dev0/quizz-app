import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/exam/presentation/manager/questions_screen_manager/questions_screen_actions.dart';
import 'package:quizz_app/feature/exam/presentation/manager/questions_screen_manager/questions_screen_states.dart';

@injectable
class QuestionsScreenViewModel extends Cubit<QuestionsScreenStates>{
  int _currentQuestion = 0;
  QuestionsScreenViewModel(): super(InitialState());

  int getCurrentQuestion(){
    return _currentQuestion;
  }
  void setExam(){
    _currentQuestion = 0;
  }
  void nextQuestion(){
    _currentQuestion++;
  }
  void prevQuestion(){
    if(_currentQuestion > 0) _currentQuestion--;
  }

  void doAction(QuestionsScreenActions action){
    switch (action) {
      case SelectAnswerAction():
        // TODO: Handle this case.
      case GoToNextQuestionAction():
           nextQuestion();
           emit(GoToNextQuestionState());
      case GoToPreviousQuestionAction():
         prevQuestion();
         emit(GoToPreviousQuestionState());
    }
  }
}