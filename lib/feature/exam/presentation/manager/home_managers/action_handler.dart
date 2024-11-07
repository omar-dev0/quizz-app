import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/exam/domain/entities/subject_item_entity.dart';
import 'package:quizz_app/feature/exam/presentation/manager/home_managers/home_screen_states.dart';
import 'package:quizz_app/feature/exam/presentation/manager/home_managers/view_model.dart';

import '../../../domain/use_cases/usecases.dart';
import 'home_screen_actions.dart';

@singleton
class ActionHandler {
  late HomeViewModel _homeViewModel;
  final UseCases _useCase;
  List<SubjectItemEntity> subjectsList = [];

  ActionHandler(this._useCase, this._homeViewModel);

  void handelActions(HomeActions action) {
    switch (action) {
      case GetSubjectsAction():
        _getSubjects();
        break;
      case ChangeHomeCurrentFragmentAction():
        _homeViewModel.emitStat(ChangeHomeCurrentFragmentState());
      case NavigateToSubjectExamsAction():
        _homeViewModel.emitStat(NavigateToSubjectExamsState(action.subjectIndex));
    }
  }

  void _getSubjects() async {
    _homeViewModel.emitStat(LoadingState());
    final response = await _useCase.invoke();
    response.fold(
      (fail) {
        _homeViewModel.emitStat(FailState(fail.message));
      },
      (subjects) {
        subjectsList = subjects;
        _homeViewModel.emitStat(SuccessState());
      },
    );
  }
}
