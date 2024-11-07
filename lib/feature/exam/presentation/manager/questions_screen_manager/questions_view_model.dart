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
  void _nextQuestion(int totalQuestions){
    _currentQuestion++;
    if(_currentQuestion == totalQuestions - 1){
      emit(FinishedExamState());
    }else{
      emit(GoToNextQuestionState());
    }
  }
  void _prevQuestion(){
    if(_currentQuestion > 0) _currentQuestion--;
  }

  void _getQuestionAnswersType(String type){
     if(type == "single_choice"){
       emit(SingleChoiceQuestionState());
     }else{
       emit(MultipleChoiceQuestionState());
     }
  }
  void doAction(QuestionsScreenActions action){
    switch (action) {
      case SelectAnswerAction():
        break;
      case GoToNextQuestionAction():
           _nextQuestion(action.questions);
           break;
      case GoToPreviousQuestionAction():
         _prevQuestion();
         emit(GoToPreviousQuestionState());
         break;
      case SubmitExamAction():
        // TODO: Handle this case.
        break;
      case GetQuestionTypeAction():
        _getQuestionAnswersType(action.type);
    }
  }
}