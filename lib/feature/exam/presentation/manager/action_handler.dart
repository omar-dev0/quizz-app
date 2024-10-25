import 'package:quizz_app/feature/exam/domain/entities/subject_item_entity.dart';
import 'package:quizz_app/feature/exam/domain/use_cases/home_usecase.dart';
import 'package:quizz_app/feature/exam/presentation/manager/home_screen_actions.dart';
import 'package:quizz_app/feature/exam/presentation/manager/home_screen_states.dart';
import 'package:quizz_app/feature/exam/presentation/manager/view_model.dart';

class ActionHandler {
  late HomeViewModel _homeViewModel;
  final HomeUseCase _homeUseCase;
  List<SubjectItemEntity> subjectsList = [];

  ActionHandler(this._homeUseCase, this._homeViewModel);

  void handelActions(HomeActions action) {
    switch (action) {
      case GetSubjectsAction():
        _getSubjects();
        break;
      case NavigateToSubjectScreen():
      // TODO: Handle this case.
    }
  }

  void _getSubjects() async {
    _homeViewModel.emitStat(LoadingState());
    final response = await _homeUseCase.invoke();
    response.fold(
      (fail) {
        _homeViewModel.emitStat(FailState());
      },
      (subjects) {
        subjectsList = subjects;
        _homeViewModel.emitStat(SuccessState());
      },
    );
  }
}
