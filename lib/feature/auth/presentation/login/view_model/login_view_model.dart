import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_cases/login_use_case.dart';
import 'ActionsHandler.dart';
import 'ControllerManger.dart';
import 'RememberMeanger.dart';
import 'login_actions.dart';
import 'login_screen_state.dart';

@injectable
class LoginViewModel extends Cubit<LoginScreenState> {
  final ControllersManager controllersManager;
  final RememberMeManager rememberMeManager;
  final ActionHandler actionHandler;

  LoginViewModel(LoginUseCase loginUseCase)
      : controllersManager = ControllersManager(),
        rememberMeManager = RememberMeManager(),
        actionHandler = ActionHandler(loginUseCase, RememberMeManager()),
        super(InitialScreenState());

  TextEditingController getFieldController(String field) {
    return controllersManager.getFieldController(field);
  }

  bool getRememberMeBoxState() {
    return rememberMeManager.isRememberMeBoxChecked;
  }

  void doAction(LoginScreenActions action) {
    actionHandler.handleAction(action);
  }
}
