import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/core/resources/app_constant.dart';
import 'package:quizz_app/feature/auth/data/data_source/cached_token.dart';
import 'package:quizz_app/feature/auth/domain/common/api_result.dart';
import 'package:quizz_app/feature/auth/domain/use_cases/logout_use_case.dart';
import 'package:quizz_app/feature/auth/presentation/logout/view_model/logout_actions.dart';
import 'package:quizz_app/feature/auth/presentation/logout/view_model/logout_states.dart';
import 'package:quizz_app/feature/exam/domain/entities/cached_exam_result_entity.dart';

@injectable
class LogoutViewModel extends Cubit<LogoutStates> {
  final LogoutUseCase _logoutUseCase;

  LogoutViewModel(this._logoutUseCase) : super(InitialState());

  void doAction(LogoutActions action) {
    switch (action) {
      case LogoutNeededAction():
        _logout();
        break;
    }
  }

  void _logout() async {
    emit(LogoutLoadingState());
    var tokenBox = Hive.box<CachedToken>(AppConstant.ktoken);
    var resultBox = Hive.box<CachedExamResultEntity>(AppConstant.kExamResult);
    String token = tokenBox.values.toList().first.token.toString();
    var result = await _logoutUseCase.logout(token);
    if (result is Success) {
      tokenBox.clear();
      resultBox.clear();
      emit(LogoutSuccessState());
    } else {
      emit(LogoutFailedState());
    }
  }
}
