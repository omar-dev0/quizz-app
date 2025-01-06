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
  String _currentExamId = "";
  Map<int,int> chooseAnswer = {};
  QuestionsScreenViewModel(): super(InitialState());
  List<int> groupedValue = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
  void setCurrentExamId(String examId){
    _currentExamId = examId;
    log("in view model id $_currentExamId");
  }
  int getCurrentQuestion(){
    return _currentQuestion;
  }
  void setExam(){
    _currentQuestion = 0;
  }
  void _nextQuestion(int totalQuestions){
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
      int correct = 0;
      for(int i = 0;i < questions.length; ++i) {
        if (chooseAnswer.containsKey(i)) {
          if (questions[i].correct == questions[i].answers?[chooseAnswer[i]!].key) {
            correct++;
          }
        }
        else{
          chooseAnswer[i] = -1;
        }
      }
      var box = Hive.box<CachedExamResultEntity>(AppConstant.kExamResult);
      CachedExamResultEntity exam ;
      List<AnswerCachedEntity> answerList = [];
      for(int i = 0; i < questions.length; ++i){
        int index = chooseAnswer[i]!;
        String? choice = "#";
        if(index != -1){
           choice =  questions[i].answers?[index].key!;
        }
        answerList.add(
          AnswerCachedEntity(questions[i].correct, choice, _currentExamId,questions[i].answers,questions[i].question)
        );
      }
      exam = CachedExamResultEntity(answerList, questions[0].type, questions[0].id, questions[0].question, questions[0].correct, questions[0].exam);
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