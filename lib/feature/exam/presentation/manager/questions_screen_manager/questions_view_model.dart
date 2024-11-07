import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/exam/domain/entities/exam_question_entity.dart';
import 'package:quizz_app/feature/exam/presentation/manager/questions_screen_manager/questions_screen_actions.dart';
import 'package:quizz_app/feature/exam/presentation/manager/questions_screen_manager/questions_screen_states.dart';

@injectable
class QuestionsScreenViewModel extends Cubit<QuestionsScreenStates>{
  int _currentQuestion = 0;
  String _lastChoice = "";
  Map<int,String> answers = {};
  QuestionsScreenViewModel(): super(InitialState());


  void setLastChoice(String key){
    _lastChoice = key;
  }
  int getCurrentQuestion(){
    return _currentQuestion;
  }
  void setExam(){
    _currentQuestion = 0;
  }
  void _saveAnswer(){
    answers[_currentQuestion] = _lastChoice;
  }
  void _nextQuestion(int totalQuestions){
    _saveAnswer();
    _currentQuestion++;
    if(_currentQuestion + 1 == totalQuestions){
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
  void _checkAnswers(List<ExamQuestionsEntity> questions){
      int correct = 0;
      for(int i = 0;i < questions.length; ++i){
          if(questions[i].correct == answers[i]){
            correct++;
          }
      }
      log("corrent in view model $correct");
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
        _checkAnswers(action.data);
        break;
      case GetQuestionTypeAction():
        _getQuestionAnswersType(action.type);
    }
  }
}