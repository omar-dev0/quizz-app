import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/remember_me_manager.dart';
import '../../../domain/use_cases/login_use_case.dart';
import 'actions_handler.dart';
import 'controller_manger.dart';
import 'login_actions.dart';
import 'login_screen_state.dart';

@injectable
class LoginViewModel extends Cubit<LoginScreenState> {
  final ControllersManager controllersManager;
  final RememberMeManager rememberMeManager;
  late final ActionHandler actionHandler;

  LoginViewModel(LoginUseCase loginUseCase)
      : controllersManager = ControllersManager(),
        rememberMeManager = RememberMeManager(),
        super(InitialScreenState()) {
    actionHandler = ActionHandler(
        loginUseCase, RememberMeManager(), ControllersManager(), this);
  }

  TextEditingController getFieldController(String field) {
    return controllersManager.getFieldController(field);
  }

  bool getRememberMeBoxState() {
    return rememberMeManager.isRememberMeBoxChecked;
  }

  void emitState(LoginScreenState state){
    emit(state);
  }

  void doAction(LoginScreenActions action) {
    actionHandler.handleAction(action);
  }
}
