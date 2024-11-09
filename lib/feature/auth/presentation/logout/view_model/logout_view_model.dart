import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/auth/domain/use_cases/logout_use_case.dart';
import 'package:quizz_app/feature/auth/presentation/logout/view_model/logout_states.dart';

@injectable
class LogoutViewModel extends Cubit<LogoutStates>{
  final LogoutUseCase _logoutUseCase;
  LogoutViewModel(this._logoutUseCase) : super(InitialState());

}