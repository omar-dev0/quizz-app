import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/exam/domain/use_cases/home_usecase.dart';
import 'package:quizz_app/feature/exam/presentation/manager/subject_exam_manager/exams_screen_states.dart';
import 'package:quizz_app/feature/exam/presentation/manager/subject_exam_manager/exams_view_model.dart';
import 'exams_screen_action.dart';

@singleton
class ExamsScreenActionHandler{
  ExamsViewModel _examsViewModel;
  UseCase _useCase;
  ExamsScreenActionHandler(this._examsViewModel,this._useCase);


  void handelActions(ExamsScreenActions action){
    switch (action) {
      case GetExamsBySubjectIdAction():
        _getExamsBySubjectId(action.subjectId);
    }
  }


  void _getExamsBySubjectId(String subjectId) async{
    _examsViewModel.emitState(ExamsLoadingState());
    var response = await _useCase.invokeExam(subjectId);
    response.fold((fail){
      _examsViewModel.emitState(ExamsFailState(fail.message));
    }, (exams){
      _examsViewModel.emitState(ExamsSuccessState());
    });
  }
}