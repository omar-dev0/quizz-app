import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/core/resources/app_constant.dart';
import 'package:quizz_app/feature/exam/domain/entities/answers_cached_entity.dart';
import 'package:quizz_app/feature/exam/domain/entities/cached_exam_result_entity.dart';
import 'package:quizz_app/feature/exam/domain/entities/exam_question_entity.dart';
import 'package:quizz_app/feature/exam/presentation/manager/questions_screen_manager/questions_screen_actions.dart';
import 'package:quizz_app/feature/exam/presentation/manager/questions_screen_manager/questions_screen_states.dart';

@injectable
class QuestionsScreenViewModel extends Cubit<QuestionsScreenStates>{
  int _currentQuestion = 0;
  String _lastChoice = "";
  String _currentExamId = "";
  Map<int,String> answers = {};
  QuestionsScreenViewModel(): super(InitialState());

  void setCurrentExamId(String examId){
    _currentExamId = examId;
    log("in view model id $_currentExamId");
  }
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
    if(_lastChoice.isEmpty) _lastChoice = "#";
    answers[_currentQuestion] = _lastChoice;
  }
  void _nextQuestion(int totalQuestions){
    _saveAnswer();
    _currentQuestion++;
    if(_currentQuestion + 1 == totalQuestions){
      emit(LastQuestionState());
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
     _saveAnswer();
      int correct = 0;
      for(int i = 0;i < questions.length; ++i){
          if(questions[i].correct == answers[i]){
            correct++;
          }
      }
      var box = Hive.box<CachedExamResultEntity>(AppConstant.kExamResult);
      CachedExamResultEntity exam ;
      List<AnswerCachedEntity> answer = [];
      for(int i = 0; i < questions.length; ++i){
        answer.add(
          AnswerCachedEntity(questions[i].correct, answers[i], _currentExamId, questions[i].answers)
        );
      }
      exam = CachedExamResultEntity(answer, questions[0].type, questions[0].id, questions[0].question, questions[0].correct, questions[0].exam);
      box.add(exam);
      emit(FinishedExamState(correct, questions.length - correct));
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
        // _getQuestionAnswersType(action.type);
        break;
    }
  }
}