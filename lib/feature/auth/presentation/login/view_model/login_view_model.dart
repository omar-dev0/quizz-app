import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/use_cases/login_use_case.dart';
import 'actions_handler.dart';
import 'controller_manger.dart';
import 'login_actions.dart';
import 'login_screen_state.dart';

@injectable
class LoginViewModel extends Cubit<LoginScreenState> {
  final ControllersManager controllersManager;
  late final ActionHandler actionHandler;

  LoginViewModel(LoginUseCase loginUseCase)
      : controllersManager = ControllersManager(),
        super(InitialScreenState()) {
    actionHandler = ActionHandler(
        loginUseCase, ControllersManager(), this);
  }

  TextEditingController getFieldController(String field) {
    return controllersManager.getFieldController(field);
  }

  void emitState(LoginScreenState state){
     emit(state);
  }

  void doAction(LoginScreenActions action) {
    actionHandler.handleAction(action);
  }
}
